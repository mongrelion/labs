job "pihole" {
  datacenters = ["dc1"]
  group "main" {

    ephemeral_disk {
      size    = 200
      migrate = true
      sticky  = true
    }

    task "pihole" {
      driver = "docker"

      config {
        image = "pihole/pihole:4.3.2-1"

        dns_servers = ["127.0.0.1", "1.1.1.1"]

        port_map {
          dns   = 53
          http  = 80
          https = 443
        }

        # In combination with ephemeral_disk, we mount directories relative to
        # the allocation directory, so that when the task gets rescheduled because
        # of whatever reason, the data gets relocated with it
        volumes = [
          "local/etc-pihole:/etc/pihole/",
          "local/etc-dnsmasq.d:/etc/dnsmasq.d/"
        ]
      }

      env {
        "TZ"           = "Europe/Amsterdam"
        "VIRTUAL_HOST" = "pihole.test"
      }

      resources {
        cpu    = 400
        memory = 64
        network {
          mbits = 1
          port "dns"   {
            static = 53
          }
          port "http"  {}
          port "https" {}
        }
      }

      service {
        name = "pihole"
        tags = ["urlprefix-pihole.test/"]
        port = "http"
        check {
          name     = "alive"
          type     = "http"
          path     = "/admin"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}

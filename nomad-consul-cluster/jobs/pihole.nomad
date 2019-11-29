job "pihole" {
  datacenters = ["sw-ams-1"]

  group "main" {
    volume "pihole" {
      type      = "host"
      source    = "pihole"
      read_only = false
    }

    task "pihole" {
      driver = "docker"

      config {
        image = "pihole/pihole:latest"
        port_map {
          dns   = 53
          http  = 80
          https = 443
        }
      }

      volume_mount {
        volume      = "pihole"
        destination = "/etc/pihole"
        read_only   = false
      }

      env {
        "TZ"           = "Europe/Amsterdam"
        "VIRTUAL_HOST" = "pihole.test"
      }

      resources {
        cpu    = 1000
        memory = 512
        network {
          mbits = 1
          port "dns"   {
            static = "53"
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
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}

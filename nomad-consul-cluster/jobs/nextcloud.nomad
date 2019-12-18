job "nextcloud" {
  datacenters = ["dc1"]

  group "main" {
    task "nextcloud-frontend" {
      driver = "docker"

      config {
        image = "nextcloud:latest"
        port_map {
          http = 80
        }
      }

      resources {
        cpu    = 500
        memory = 512
        network {
          mbits = 20
          port "http" {}
        }
      }

      service {
        name = "nextcloud"
        tags = ["urlprefix-nextcloud.test/"]
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

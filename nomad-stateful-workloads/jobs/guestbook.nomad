job "guestbook" {
  datacenters = ["dc1"]
  group "web" {

    task "guestbook" {
      driver = "docker"

      config {
        image = "gcr.io/google-samples/gb-frontend:v4"

        port_map {
          http = 80
        }
      }

      resources {
        cpu    = 400
        memory = 128
        network {
          mbits = 1
          port "http" {}
        }
      }

      service {
        name = "guestbook"
        tags = ["urlprefix-guestbook.test/"]
        port = "http"

        check {
          name     = "alive"
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }

        connect {
          sidecar_service {
            proxy {
              upstreams {
                destination_name = "redis-master"
                local_bind_port = 6379
              }
            }
          }
        }
      }
    }
  }

  group "db" {

    task "redis" {
      driver = "docker"

      config {
        image = "redis"

        port_map {
          db = 6379
        }
      }

      resources {
        cpu    = 400
        memory = 64
        network {
          mbits = 10
          port "db" {}
        }
      }

      service {
        name = "redis-master"
        port = "db"

        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }

        connect {
          sidecar_service {}
        }
      }
    }
  }
}

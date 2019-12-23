job "fabio" {
  datacenters = ["dc1"]
  type = "system"

  group "main" {
    task "fabio" {
      driver = "docker"

      config {
        image = "fabiolb/fabio:1.5.13-go1.13.4"
        network_mode = "host"
        port_map {
          front = 9999
          back  = 9998
        }
      }

      resources {
        cpu    = 200
        memory = 128
        network {
          mbits = 20
          port "front" {}
          port "back"  {}
        }
      }

      service {
        name = "fabio"
        port = "front"
        check {
          name     = "alive"
          type     = "tcp"
          interval = "5s"
          timeout  = "2s"
        }
      }
    }
  }
}

job "consul" {
  type        = "system"
  datacenters = ["dc1"]

  group "main" {
    task "consul" {
      driver = "docker"

      config {
        image        = "consul:1.6.2"
        network_mode = "host"
        port_map {
          http = 8500
          dns  = 8600
        }
      }

      resources {
        cpu    = 100
        memory = 64
        network {
          mbits = 10
          port "http" {}
          port "dns"  {}
        }
      }

      service {
        name = "consul"
        port = "http"
        check {
          name     = "alive"
          type     = "http"
          path     = "/"
          interval = "5s"
          timeout  = "2s"
        }
      }
    }
  }
}

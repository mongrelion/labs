job "loadbalancer" {
  datacenters = ["dc1"]
  type = "system"

  update {
    max_parallel = 1
  }

  group "fabio" {
    task "fabio" {
      driver = "raw_exec"

      config {
        command = "local/fabio"
        args = ["-proxy.addr", ":80"]
      }

      artifact {
        source = "https://github.com/fabiolb/fabio/releases/download/v1.5.13/fabio-1.5.13-go1.13.4-darwin_amd64"
        destination = "local/fabio"
        mode = "file"
        options {
          checksum = "sha256:cbf2bc41a326f86a396aefe33c0e02121f061ebc6be9626f408f50f30db7439a"
        }
      }

      resources {
        cpu    = 200
        memory = 128
        network {
          mbits = 20
          port "lb" {
            static = 80
          }
          port "ui" {
            static = 9998
          }
        }
      }
    }
  }
}

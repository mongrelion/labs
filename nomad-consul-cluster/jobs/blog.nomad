job "blog" {
  datacenters = ["sw-ams-1"]

  group "main" {
    task "blog-frontend" {
      driver = "docker"

      config {
        image = "mongrelion/blog:latest"
        port_map {
          http  = 80
          https = 443
        }
      }

      resources {
        cpu    = 100
        memory = 32
        network {
          mbits = 20
          port "http"  {}
          port "https" {}
        }
      }

      service {
        name = "blog"
        tags = ["urlprefix-blog.test/"]
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

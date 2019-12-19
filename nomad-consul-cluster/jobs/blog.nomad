job "blog" {
  datacenters = ["dc1"]

  group "main" {
    task "blog-frontend" {
      driver = "docker"

      config {
        image = "mongrelion/blog:129f0cf8ff99947ec377ed6ac9d7a8af034c84d5"
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

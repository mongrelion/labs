job "blog" {
  datacenters = ["sw-ams-1"]

  group "main" {
    task "frontend" {
      driver = "docker"

      config {
        image = "mongrelion/blog:latest"
      }
    }
  }
}

job "homeassistant" {
  datacenters = ["sw-ams-1"]

  group "main" {
    task "hass-frontend" {
      driver = "docker"

      config {
        image = "homeassistant/home-assistant:latest"
        port_map {
          http  = 8123
        }
        volumes = [
          "hass:/config"
        ]
        volume_driver = "local"
      }

      resources {
        cpu    = 100
        memory = 256
        network {
          mbits = 20
          port "http" {}
        }
      }

      service {
        name = "homeassistant"
        tags = ["urlprefix-hass.test/"]
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

    task "hass-mqtt" {
      driver = "docker"

      config {
        image = "eclipse-mosquitto:latest"
        port_map {
          mqtt = 1883
        }
      }

      resources {
        cpu    = 50
        memory = 32
        network {
          mbits = 10
          port "mqtt" {}
        }
      }

      service {
        name = "homeassistant"
        tags = ["urlprefix-hass.test/"]
        port = "mqtt"
        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}

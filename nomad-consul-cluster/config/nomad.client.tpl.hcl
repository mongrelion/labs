name       = "client"
datacenter = "sw-ams-1"
log_level  = "DEBUG"
data_dir   = "PWD/data/nomad/client"

ports = {
  http = 34646
}

client = {
  enabled = true
  host_volume "pihole" {
    path = "PWD/data/pihole"
    read_only = false
  }
}

plugin "raw_exec" {
  config = {
    enabled = true
  }
}

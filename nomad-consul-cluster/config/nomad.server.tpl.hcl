name       = "server"
datacenter = "dc1"
log_level  = "DEBUG"
data_dir   = "PWD/data/nomad/server"
server {
  enabled = true
  bootstrap_expect = 1
}

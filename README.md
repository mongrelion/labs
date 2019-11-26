# Nomad and Consul cluster
This is an experiment to get two clusters running locally: a Nomad cluster and
a Consul cluster.

# Requirements
| What                                  | Version      |
|---------------------------------------|--------------|
| [Nomad](https://www.nomadproject.io/) | `~> v0.10.1` |
| [Consul](https://www.consul.io/)      | `~> v1.6.2`  |

# Getting Started
## Data directories
We need to create the directories where the Consul and the Nomad data are going
to be stored:
```
$ make datadirs
```

## Services
It's recommended to run Consul before running Nomad, since Nomad makes use of
Consul for bootstrapping.

## Consul
```
$ make consul
```

## Nomad
### Server
```
$ make nomad-server
```

### Client
```
$ make nomad-client
```

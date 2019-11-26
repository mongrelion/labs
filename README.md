# Nomad and Consul cluster
This is an experiment to get two clusters running locally: a Nomad cluster and
a Consul cluster.

# Requirements
| What                                  | Version      |
|---------------------------------------|--------------|
| [Nomad](https://www.nomadproject.io/) | `~> v0.10.1` |
| [Consul](https://www.consul.io/)      | `~> v1.6.2`  |

# Getting Started
It's recommended to run Consul before running Nomad, since Nomad makes use of
Consul for bootstrapping.

## Consul
```
$ make consul
```

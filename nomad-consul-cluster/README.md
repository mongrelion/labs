# Nomad and Consul cluster
This is an experiment to get two clusters running locally: a Nomad cluster and
a Consul cluster.

# TODO
- [ ] Nomad is bound to 0.0.0.0. Fix
- [ ] Consul is bound to 0.0.0.0. Fix
- [ ] Fabio is running on host because it can't find a Consul agent in the
      container where it runs. Connect Fabio, which runs in a container, to
      Consul, which runs on the host
- [ ] Hass and mqtt are running on two different containers but how can we make
      them talk to each other?

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

## Encryption Keys
Consul uses an encryption key to communicate with the clients.  
Place the encryption key in the `.env` file as shown on the `.env.example` file.
Then source it like so:

```
$ source .env
```

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

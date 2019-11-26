consul:
	@./bin/consul agent -config-file=config/consul.json

nomad-config:
	@sed "s;PWD;${PWD};" config/nomad.tpl.json> config/nomad.json

nomad: nomad-config
	@./bin/nomad agent -config=config/nomad.json

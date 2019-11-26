datadirs:
	@mkdir -p data/nomad/{client,server}
	@mkdir -p data/consul

consul:
	@./bin/consul agent -config-file=config/consul.json

nomad-server-config:
	@sed "s;PWD;${PWD};" config/nomad.server.tpl.json> config/nomad.server.json

nomad-client-config:
	@sed "s;PWD;${PWD};" config/nomad.client.tpl.json> config/nomad.client.json

nomad-server: nomad-server-config
	@./bin/nomad agent -config=config/nomad.server.json

nomad-client: nomad-client-config
	@./bin/nomad agent -config=config/nomad.client.json

datadirs:
	@mkdir -p data/nomad/{client,server}
	@mkdir -p data/consul
	@mkdir -p data/pihole

consul-config:
	@if [ "${ENCKEY}" == "" ]; then echo "=> missing ENCKEY"; exit 1; fi
	@sed "s;ENCKEY;${ENCKEY};" config/consul.tpl.hcl > config/consul.hcl

consul: consul-config
	@./bin/consul agent -config-file=config/consul.hcl

nomad-server-config:
	@sed "s;PWD;${PWD};" config/nomad.server.tpl.hcl > config/nomad.server.hcl

nomad-client-config:
	@sed "s;PWD;${PWD};" config/nomad.client.tpl.hcl > config/nomad.client.hcl

nomad-server: nomad-server-config
	@./bin/nomad agent -config=config/nomad.server.hcl

nomad-client: nomad-client-config
	@./bin/nomad agent -config=config/nomad.client.hcl

renovate:
	@docker run \
	--rm \
	-e RENOVATE_TOKEN=$${GITHUB_TOKEN} \
	renovate/renovate mongrelion/labs

local:
	@docker run \
	--rm \
	-e RENOVATE_TOKEN=$${GITHUB_TOKEN} \
	-v ${PWD}:/usr/src/app \
	-w /usr/src/app \
	-e LOG_LEVEL=debug \
	renovate/renovate --platform=local


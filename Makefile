renovate:
	@docker run --rm -e RENOVATE_TOKEN=$${GITHUB_TOKEN} renovate/renovate mongrelion/labs


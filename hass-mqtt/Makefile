hass:
	@docker run \
		--name homeassistant \
		--rm \
		-it \
		--network home \
		-p 8080:8123 \
		-v ${PWD}/config/hass:/config \
		homeassistant/home-assistant

mqtt:
	@docker run \
		--name mosquitto \
		--rm \
		-it \
		--network home \
		-v ${PWD}/config/mosquitto.conf:/mosquitto/config/mosquitto.conf \
		eclipse-mosquitto

mqtt-client:
	@docker run \
		--rm \
		-it \
		--network home \
		-v ${PWD}/config/mosquitto.conf:/mosquitto/config/mosquitto.conf \
		eclipse-mosquitto ash

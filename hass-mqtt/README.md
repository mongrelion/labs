# Homeassistant + mqtt
The whole idea of this experiment is to figure out how to register a device in
Homeassistant and read/write its state.

For example, have a light hooked up to an ESP8266 module (which comes with native
support for mqtt) and turn that light on & off via Homeassistant.

This is how you do it!

# Getting Started
Fire up mqtt
```
$ make mqtt
```

Then Homeassistant:
```
$ make hass
```
And go to the [UI](http://localhost:8080) and setup the whole thing.

# Registerint the device in Homeassistant
Somewhere in the `configuration.yaml` file of Hass, you'd have to have a snippet
that looks like so:
```
light:
  - name: "Terrace Lamps"
    platform: mqtt
    command_topic: "home/terrace/light"
    payload_on: "1"
    payload_off: "0"

```

When Homeassistant comes up, it'll look through the items in that
`configuration.yaml` configuration file and find our "Terrace Lamps" and map it
to the "home/terrace/light" topic on mqtt. It also specifies the payloads for
when we want to turn the thing on ("1") or off ("2"). How we handle those signals
is up to the ESP8266 module that will also be listening on the topic "home/terrace/light".

# Posting a payload
Fire up the mosquitto console like this:
```
$ make mqtt-client
```

And post the payload like this:

```
$ mosquitto_pub -h mosquitto -t home/terrace/light -m 1
```


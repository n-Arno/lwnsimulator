lwnsimulator
============

LoraWan simulator based on [this repository](https://github.com/UniCT-ARSLab/LWN-Simulator), with up to date dependencies and pre-configured devices and virtual gateway for demo.

| Device           | ID               | OTAA app key                         |
|------------------|------------------|--------------------------------------|
| scw-test-device1 | 5c4d841bf6246d42 | 7a5cf4f81df578b27641d8305516aaa6     |
| scw-test-device2 | b602655e35690b7b | 4c98ea5a445c805f2579488cac7878ee     |
| scw-virt-gw      | 6341b8836122e874 | Gateway bridge via "chirpstack:1700" |

Usage
-----

Run image in docker, go to <your-ip>:8000 and start simulation. This will connect to a gateway bridge like [this one](https://github.com/chirpstack/chirpstack-docker) after configuration of the gateway and devices.

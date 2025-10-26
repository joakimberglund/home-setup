#!/bin/sh

openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout registry.key -out registry.crt -subj "/CN=registry.cube.local" -addext "subjectAltName=DNS:registry.cube.local,DNS:*.cube.local,IP:192.168.0.74"

cp registry.* /usr/local/share/ca-certificates/
update-ca-certificates

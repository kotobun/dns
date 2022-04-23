#!/bin/bash
docker stop dns && docker rm dns
./build.sh && \
docker run -d --name dns -p 53:53 -p 53:53/udp --restart unless-stopped dns:latest

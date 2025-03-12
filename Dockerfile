FROM alpine:latest

RUN apk add --no-cache \
	bash \
	coreutils \
	doas \
	jq \
	miller \
	pipx \
	xmlstarlet \
	yq \
	zsh

RUN adduser -D -u 6000 -s /bin/bash myself
RUN echo 'permit nopass myself' >/etc/doas.d/local.conf

USER myself
WORKDIR /home/myself
RUN mkdir -p save

RUN pipx install csvkit
RUN pipx install --suffix=-py yq

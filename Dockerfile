FROM alpine:latest

RUN --mount=type=bind,source=apk-packages.list,target=/tmp/apk-packages.list <<END
cat /tmp/apk-packages.list - <<-LIST >>/etc/apk/world
	bash
	doas
	py3-pip
	zsh
LIST
apk fix --no-cache
END

RUN adduser -D -u 6000 myself
RUN echo 'permit nopass myself' >/etc/doas.d/local.conf

USER myself
WORKDIR /home/myself

RUN --mount=type=bind,source=pip-packages.list,target=/tmp/pip-packages.list <<END
python -m venv .venv
. .venv/bin/activate
pip install -r /tmp/pip-packages.list
END

COPY ./bashrc .bashrc
COPY ./zshrc .zshrc

RUN mkdir -p save

# provizora-medio
Easy to configure dockerized test environment.

Gives you an isolated environment to test various things, and provides
you with a simple way to configure it.

The container is based on the most recent Alpine Linux image,
and installs the Alpine Linux `apk` packages you specify in the
`apk-packages.list` file.  It also installs the Python packages you
specify in the `pip-packages.list` file.

The container comes with `bash` and `zsh` shells, `py3-pip`, and `doas`
(for elevating privileges for the default `myself` user).

The shells are configured via the `bashrc` and `zshrc` file stubs.

In the home directory of the `myself` user, there is a `save` directory
where you can place persistent files (it is mounted as a volume).

To start, use the provided `provizora-medio` script.  It will build
the container, and then run it.  It will pass its arguments to the
container, so you can use it to start a shell, or run a command.

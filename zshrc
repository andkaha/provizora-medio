PATH=$PATH:$HOME/.local/bin
PS1='%# '

if [ -e "$HOME/.venv/bin/activate" ]; then
	activate () { . $HOME/.venv/bin/activate; }
	echo 'Use "activate" for Python environment' >&2
fi

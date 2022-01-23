mkdir -p ~/.local/share
mkdir -p ~/.config
mkdir -p ~/.cache/joebkup
git submodule update --init --recursive
stow headless -t ~/

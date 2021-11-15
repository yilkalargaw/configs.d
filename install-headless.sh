mkdir -p ~/.local/share
mkdir -p ~/.config
git submodule update --init --recursive
stow headless -t ~/

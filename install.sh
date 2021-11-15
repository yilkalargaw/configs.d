mkdir -p ~/.local/share
mkdir -p ~/.config
mkdir -p ~/.emacs.d
git submodule update --init --recursive
stow graphic -t ~/
stow headless -t ~/
stow .emacs.d -t ~/.emacs.d

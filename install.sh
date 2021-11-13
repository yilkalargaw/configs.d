mkdir -p .local/share
mkdir -p .config
git submodule update --init --recursive
git stow graphic -t ~/
git stow headless -t ~/
git stow .emacs.d -t ~/

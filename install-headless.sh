mkdir -p .local/share
mkdir -p .config
git submodule update --init --recursive
git stow headless -t ~/

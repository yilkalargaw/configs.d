if [ -x "$(command -v fd)" ] && [ -x "$(command -v fzf)" ] ; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden'

	# usage: _fzf_setup_completion path|dir|var|alias|host COMMANDS...
	_fzf_setup_completion path ag rg git kubectl jmacs joe jstar jpico nano
	_fzf_setup_completion dir tree
fi

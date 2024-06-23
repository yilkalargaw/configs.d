if [ -x "$(command -v exa)" ]; then
	alias ls='exa'
	alias tree='exa --tree'
fi

if [ -x "$(command -v eza)" ]; then
	alias ls='eza'
	alias tree='eza --tree'
fi

alias la='ls -ah'
alias ll='ls -lh'
alias lal='ls -alh'
# alias la='ls -a'
# alias ll='ls -l'
# alias lal='ls -al'
alias lah='ls -lah'
alias feh='feh -g 640x480  -dZ.'

label="com.gitlab.uppercat.tlbx"

for i in $(exec podman ps -af label="$label=true" --format "{{.Names}}")
do
	alias "${i}do"="tlbx enter ${i}"

	if podman ps -af name="${i}" --format "{{.Names}} {{.Image}}" | cut -d " " -f2 | cut -d "/" -f3 | grep -q "alpine:"; then
		alias "sh${i}"="tlbx enter -it ${i} /bin/sh"
		alias "rsh${i}"="tlbx enter -it --user=root ${i} /bin/sh"
	else
		alias "sh${i}"="tlbx enter -it ${i} /bin/bash"
		alias "rsh${i}"="tlbx enter -it --user=root ${i} /bin/bash"
	fi
done

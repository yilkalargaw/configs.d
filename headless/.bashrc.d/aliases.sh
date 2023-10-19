if [ -x "$(command -v exa)" ]; then
	alias ls='exa'
	alias tree='exa --tree'
fi

alias la='ls -a'
alias ll='ls -l'
alias lah='ls -lah'
alias feh='feh -g 640x480  -dZ.'

# alias exemacs="tlbx enter exercismbox emacs"
# alias flatmacs="FLATPAK_ENABLE_SDK_EXT=ziglang,openjdk11,texlive,rust-stable,golang,haskell,php74,ldc,dmd,node14,llvm12 flatpak run org.gnu.emacs"
# alias flatmacs="flatpak run org.gnu.emacs"
# alias flatecli="flatpak --command=emacsclient run org.gnu.emacs"
# alias shbrowsybox="tlbx enter -it browsybox /bin/bash -l"
# alias shactibox="tlbx enter -it  actibox /bin/bash -l"
# alias shfedexybox="tlbx enter -it fedexybox /bin/bash -l"
# alias shnominalbox="tlbx enter -it nominalbox /bin/bash -l"
# alias rshbrowsybox="tlbx enter -it --user=root browsybox /bin/bash -l"
# alias rshactibox="tlbx enter -it  --user=root actibox /bin/bash -l"
# alias rshfedexybox="tlbx enter -it --user=root fedexybox /bin/bash -l"
# alias rshnominalbox="tlbx enter -it --user=root nominalbox /bin/bash -l"
# alias browsydo="tlbx enter -it browsybox"
# alias actido="tlbx enter actibox"
# alias fedexydo="tlbx enter fedexybox"
# alias nominaldo="tlbx enter nominalbox"
# alias browsybrave="tlbx enter browsybox brave-browser"
# alias pbrowsybrave="tlbx enter browsybox brave-browser --incognito"
# alias browsyfox="tlbx enter browsybox firefox --no-remote"
# alias pbrowsyfox="tlbx enter browsybox firefox --no-remote --private-window"
# alias actifox="tlbx enter actibox firefox --no-remote"
# alias pactifox="tlbx enter actibox brave-browser --no-remote --private-window"

label="com.gitlab.uppercat.tlbx"

for i in $(exec podman ps -af label="$label=true" --format "{{.Names}}")
do
	if podman ps -af name="${i}" --format "{{.Names}} {{.Image}}" | cut -d " " -f2 | cut -d "/" -f3 | grep -q "alpine:"; then
		alias "${i}do"='tlbx enter ${i}'
		alias "sh${i}"='tlbx enter -it ${i} /bin/sh'
		alias "rsh${i}"='tlbx enter -it --user=root ${i} /bin/sh'
	else
		alias "${i}do"='tlbx enter ${i}'
		alias "sh${i}"='tlbx enter -it ${i} /bin/bash'
		alias "rsh${i}"='tlbx enter -it --user=root ${i} /bin/bash'
	fi
done

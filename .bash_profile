DIR=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)
for f in $DIR/.{aliases,functions}; do
	[ -r "$f" ] && [ -f "$f" ] && source "$f"
done
unset f
unset DIR

T_PS1_SHOWDIRTYSTATE=true
alias __my_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/ (\1)/'"
export PS1='\[\e[34m\]\w\[\e[0m\]$(__my_ps1) \[\e[1m\]\$ \[\e[0m\]'

export EDITOR="subl -wn"
export BASH_SILENCE_DEPRECATION_WARNING=1

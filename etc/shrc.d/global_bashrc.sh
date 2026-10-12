#! /usr/bin/bash
# global interactive (bash) stuff

# Only run this if we are in a bash session
[ -n "$BASH_VERSION" ] || return

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# also expand .files with *
shopt -s dotglob

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command return and,
# if necessary, update the values of LINES and COLUMNS.
# This will also be done in bash.bashrc but only for $DISPLAY sessions,
# I want this for tty as well because of tmux, etc.
shopt -s checkwinsize

# Check if these change something.
shopt -s histreedit
shopt -s histverify

# bash completion for sudoers
complete -cf sudo

# format BOLD,...;FGColor[;BGColor]m
#        0-3?    ;30-36   ;40-47
__PS1pathBlue__="\[\033[01;34m"
__PS1retHl__="\[\033[00;00;41m"
__PS1ret__="\[\033[01;30m"
__PS1RST__="\[\033[00m"
case ${EUID} in
  0 ) # root
    PS1color='\[\033[01;31m' ;;
  1000 ) # me
    PS1color='\[\033[01;32m' ;;
  *) # others
    PS1color='\[\033[01;33m'
esac

PS1="\n$__PS1ret__\]\$? \$([[ \$? != 0 ]] && echo \"$__PS1retHl__\]\")$PS1color\]\u@\h:$__PS1pathBlue__\]\w$__PS1RST__\]\n\$ "

unset __PS1pathBlue__
unset __PS1retHl__
unset __PS1ret__
unset __PS1RST__
unset PS1color

[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash

#! /usr/bin/bash
# global interactive stuff

stty -ixon


alias dir="dir --color=auto"
alias vdir="vdir --color=auto"

alias grep="grep --color=auto"

alias diff="diff --color=auto"

alias dmesg="dmesg -e --color=auto"

# dig with clearer output
alias dig="dig +noall +answer"

# check conn
alias _dig="watch -n 1.1 'dig +tries=1 +timeout=1 google.com'"
alias _dig2="watch 'dig google.com; sleep 1; killall dig'"
alias _curl="curl speedtest.qsc.de/10GB.qsc > /dev/null"

# some more aliases
alias ls="ls -lh --color=auto --quoting-style=shell-escape -Fa"
alias ll="ls -lh --color=auto --quoting-style=shell-escape -FC"
alias lf="ls -lh --color=auto --quoting-style=shell-escape -d */"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias dirfzf="find . -type d | fzf"
alias fzfdir="dirfzf"
alias cdfzf="cd \"\$(find . -type d | fzf)\""
alias fzfcd="cdfzf"
alias res="tput reset"
alias reset="tput reset"
alias pstree="pstree -pUl"

# make aliases work with sudo?
alias sudo="sudo "

# more useful ps (only when called without arguments, so `ps aux` etc. still work)
unalias ps 2>/dev/null
ps() { if [ $# -eq 0 ]; then command ps -eo pid,cmd; else command ps "$@"; fi; }

# auto display progress
alias dd="dd status=progress"

# more useful netstat
alias netstat="netstat -anlWp"

# more useful jobs
alias jobs="jobs -l"

# more info like fs, etc.
#alias lsblk="lsblk -afm"
#alias lsblk="lsblk -a -o NAME,FSTYPE,LABEL,MOUNTPOINT,SIZE,OWNER,GROUP,MODE,PARTUUID,UUID"
alias _lsblk_full="lsblk -a -o NAME,FSTYPE,LABEL,MOUNTPOINT,SIZE,OWNER,GROUP,MODE,PARTUUID,UUID,TYPE,HOTPLUG,RM,VENDOR,MODEL,SERIAL"
alias lsblk="lsblk -a -o NAME,FSTYPE,LABEL,MOUNTPOINT,SIZE,OWNER,GROUP,MODE,TYPE,HOTPLUG,RM,VENDOR,MODEL,SERIAL"

# more useful socket info
alias ss="ss -raepi"

# start with process and don't be parent:
alias _strace="mkdir -p /tmp/tmp.strace; strace -y -f -tt -ff -a 120 -s 100 -o /tmp/tmp.strace/strace -D "
# attatch to already running pid:
alias _strace_pid="mkdir -p /tmp/tmp.strace; strace -y -f -tt -ff -a 120 -s 100 -o /tmp/tmp.strace/strace -p "

# make rm a bit more sane
alias rm="rm -Iv --one-file-system"

alias cp="cp -v"
alias mv="mv -v"

# make uptime display uptime
alias uptime="uptime -p"

# df,free easy readable output
alias df="df -h"
alias free="free -h"

# findmnt truncates long mount options
alias findmnt="findmnt -u"

# make date display in standard format (only when called without arguments, so `date +%s` etc. still work)
unalias date 2>/dev/null
date() { if [ $# -eq 0 ]; then command date --rfc-3339=n; else command date "$@"; fi; }

# prettier iproute2 output
alias ip="ip -c "

# more useful passwords
#alias _pwgen="pwgen --capitalize --numerals --secure -1 28 5"
_pwgen() { pwgen --capitalize --numerals --secure --symbols --remove-chars='~.`"\&;|<>*?[]{}#%@:/()^,'\' -1 "${1:-28}" "${2:-5}"; }

# find all man pages
alias _man_find="man -aw "

# manage home dotfile git repo
#alias dfgit="/usr/bin/git --git-dir=\"$XDG_DATA_HOME\"/dotfileGit --work-tree=\"$HOME\""
alias y="yadm"
alias ysys="sudo yadm --yadm-dir /opt/yadm_sys --yadm-data /opt/yadm_sys_data"

# see how wget2 compares to wget
# local db would mean rampart creation of files
#alias wget="wget2 --no-local-db" # Doesn't build anymore, wait until a full release
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

# use inotify to watch for changes recursively in a folder
alias _iwatchR="inotifywait -r -m -e create -e modify -e move "

# use inotify to watch for changes in a file
alias _iwatchF="inotifywait -m "

# tmp untill i remove pacaur
alias pacaur="echo use yay" # use paru now lol

# only show 6 results, my terminal is not so large
alias googler="googler --count 6 "

# ffmpeg headers are massive and obnoxious
alias ffmpeg="ffmpeg -hide_banner"
alias ffprobe="ffprobe -hide_banner"
alias ffplay="ffplay -hide_banner"

# some mpv profiles
alias mpvs="mpv --profile=spec"
alias mpvvs="mpv --profile=vidSpec"

# vid with profile=spec
alias _vspec="_vid --f=251 --args='--profile=spec'"

# cal with week numbers
alias cal="cal --week"

# one second is a bit fast
alias battop="battop -d 7"

# -d show hidden files
alias nnn="nnn -d -e -H -x"

alias e="thunar ."

# shorter this way
alias g='git'

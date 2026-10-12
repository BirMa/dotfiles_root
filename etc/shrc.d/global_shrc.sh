#! /usr/bin/bash
# global interactive stuff

_dmesg () {
  sudo dmesg --color=always "$@" | grep -v "audit:.*msg='.*res=success'"
}

# Colored manpages see 
# http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
# https://gist.github.com/cocoalabs/2fb7dc2199b0d4bf160364b8e557eb66
man () {
  LESS_TERMCAP_mb=$'\e'"[1;36m" \
  LESS_TERMCAP_md=$'\e'"[1;36m" \
  LESS_TERMCAP_me=$'\e'"[0m" \
  LESS_TERMCAP_se=$'\e'"[0m" \
  LESS_TERMCAP_so=$'\e'"[1;40;92m" \
  LESS_TERMCAP_ue=$'\e'"[0m" \
  LESS_TERMCAP_us=$'\e'"[1;32m" \
  command man "$@"
}

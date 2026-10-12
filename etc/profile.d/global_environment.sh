# global non interactive stuff (sourced by /etc/profile: keep it POSIX sh)
# Plain variables live in /etc/environment.d/50-global.conf (imported into
# login shells by 00-environment-d.sh). Only computed/shell-only stuff here.

# This file is sourced by everything you git, don't do this.
#set -o nounset

#umask 0077

# amount of parallel jobs (overrides the default from /etc/environment.d/50-global.conf)
export JOBNUMBER
NPROC_N="$(nproc)"
JOBNUMBER="${NPROC_N:-2}"

export MAKEFLAGS="-j${JOBNUMBER}"

# enable colors for some things, etc.
eval "$(dircolors -b)"

# Import the environment.d(5) variables into login shells, so tty/ssh/startx
# sessions get the same environment as the systemd user manager.
# Method from environment.d(5).
if [ -x /usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator ]; then
  set -a
  eval "$(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)"
  set +a
fi

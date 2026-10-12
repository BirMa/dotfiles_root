# Drop duplicate PATH entries (keeps the first occurrence). Runs after the other
# profile.d scripts, so login shells started from an environment that already has
# the additions (systemd user manager -> tmux.service, nested `bash -l`) don't stack them.
_dp_new=
_dp_ifs=$IFS
IFS=:
for _dp_dir in $PATH; do
  case ":$_dp_new:" in
    *":$_dp_dir:"*) ;;
    *) _dp_new=${_dp_new:+$_dp_new:}$_dp_dir ;;
  esac
done
IFS=$_dp_ifs
PATH=$_dp_new
export PATH
unset _dp_new _dp_ifs _dp_dir

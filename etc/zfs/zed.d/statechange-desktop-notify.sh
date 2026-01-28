#!/usr/bin/env bash
set -u

[ -n "${ZEVENT_VDEV_STATE_STR:-}" ] || exit 1
[ -n "${ZEVENT_POOL:-}" ] || exit 1

if [ "${ZEVENT_VDEV_STATE_STR}" = "ONLINE" ]; then
    exit 0
fi

title="ZFS Pool ${ZEVENT_POOL}"
body="State: ${ZEVENT_VDEV_STATE_STR}"
[ -n "${ZEVENT_VDEV_PATH:-}" ] && body="${body}, Device: ${ZEVENT_VDEV_PATH}"
[ -n "${ZEVENT_EID:-}" ] && body="${body}, EID: ${ZEVENT_EID}"
[ -n "${ZEVENT_TIME_STRING:-}" ] && body="${body}, Time: ${ZEVENT_TIME_STRING}"

logger -t zed-desktop-notify -p daemon.alert "${title}: ${body}"

users=$(loginctl list-sessions --json=short | jq --raw-output '[.[].user] | unique | .[]')

for user in $users; do
    if ! systemd-run --machine="${user}@.host" --user \
        notify-send --urgency=critical --icon=dialog-warning "$title" "$body"
    then
        echo "Failed to send notification to user ${user}" >&2
    fi
done

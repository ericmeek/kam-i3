#!/usr/bin/env bash
set -euo pipefail

STATE_FILE="/var/lib/kam-i3/brew-packages-installed"
BREWFILE="/usr/share/kam-i3/Brewfile"

mkdir -p /var/lib/kam-i3

if [[ -f "$STATE_FILE" ]]; then
	exit 0
fi

"$BREW" bundle --file "$BREWFILE"

touch "$STATE_FILE"

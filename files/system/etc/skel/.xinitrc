#!/bin/sh

# Make DISPLAY and other desktop variables visible to D-Bus and systemd user services.
dbus-update-activation-environment --systemd --all

xrdb -merge /home/eric/.Xresources
exec i3


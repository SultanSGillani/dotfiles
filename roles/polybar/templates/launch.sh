#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do
    sleep 1;
done

{% if ansible_facts['hostname'] == 'linuxlaptop' %}
MONITOR="eDP-1 DP-1"
{% elif ansible_facts['hostname'] == 'linuxserver' %}
MONITOR="DVI-I-1 HDMI-0"
{% elif ansible_facts['hostname'] == 'sultanubuntu' %}
MONITOR="eDP1 HDMI1"
{% else %}
MONITOR="eDP-1"
{% endif %}

for m in $MONITOR; do
    MONITOR=$m polybar --reload main &
done

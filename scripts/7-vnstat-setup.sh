#!/bin/bash

sudo vnstat --add -i wlan1
sudo systemctl enable --now vnstat


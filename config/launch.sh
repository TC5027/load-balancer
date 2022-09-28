#!/bin/bash

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
./rename.py
mv ../src/xdp_lb_kern.c.tmp ../src/xdp_lb_kern.c

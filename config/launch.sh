#!/bin/bash

# indique quel interpréteur utilisé pour run le script (comme ce qu'on faisait en python avec wagner)
# j'ai fait chmod +x hey.sh (et hey.py)
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
./rename.py


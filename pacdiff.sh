#!/usr/bin/env bash

cat pacmanfile | sort

diff --color <(pacman -Qqe) <(cat pacmanfile | grep -o '^[^#]*' | sort) 
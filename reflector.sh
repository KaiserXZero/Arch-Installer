#!/bin/bash

reflector --verbose --country 'United States' -l 200 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy

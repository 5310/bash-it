#!/usr/bin/env bash

###
# This profile is TTY-safe.
# I use it as my .bash_profile`
# which gets loaded by login shells
# much like the TTY accessible from ctrl+alt+fN
###

# Path to the bash it configuration
export BASH_IT="/home/$(whoami)/.bash_it"

# Inherit the default .bashrc
source $BASH_IT/.bashrc

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-naked-newline'

# Load Bash It
source $BASH_IT/bash_it.sh
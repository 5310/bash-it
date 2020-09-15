#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-newline'

# Set custom project path.
export PROJECT_PATHS="$HOME/Active/Projects/Personal/"

# Reset the console output text formatting.
trap 'printf "\e[0m" "$_"' DEBUG

# Your place for hosting Git repos. I use this for private repos.
#export GIT_HOSTING='git@git.domain.com'

# Load Bash It
export EDITOR='nano'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
#export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
#export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Ntfy integration
eval "$(ntfy shell-integration)"

# Load Bash It
source $BASH_IT/bash_it.sh

# Enable globstar
shopt -s globstar

# Export local binary path because it's needed in 18.04+
# Now local path overrides the system one!
export PATH="$HOME/.local/bin:$PATH"

# Rust stuff
export PATH="$HOME/.cargo/bin:$PATH"

# deno config
if [ -e "$HOME/.deno" ]; then 
  export DENO_INSTALL="$HOME/.deno"
  export PATH="$DENO_INSTALL/bin:$PATH"
fi

# Setup Nix (originally added by the installed but then moved to proper file
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then 
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# OpenColorIO config
export OCIO="$HOME/Archive/Miscellany/Color Profiles/active-profile/config.ocio"

# QT5 Configuration Manager flag
export QT_QPA_PLATFORMTHEME="gtk2"

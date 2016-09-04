cite 'about-alias'
about-alias 'Personal alises'

alias a='atom . && echo Opening Atom in "$(pwd)/"'
alias aptupgd='sudo apt-get update && sudo apt-get dist-upgrade -Vy && sudo apt-get autoremove'
alias ds=ncdu
alias es='babel-node --presets "es2015,stage-1"'
alias git=hub
alias npmup='sudo npm update -g'
alias pipup='sudo pip install -U $(pip list | cut -d " " -f 1)'

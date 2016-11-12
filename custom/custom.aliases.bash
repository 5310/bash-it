cite 'about-alias'
about-alias 'Personal alises'

alias a='atom . && echo Opening Atom in "$(pwd)/"'
alias aptupgd='sudo apt-get update && sudo apt-get dist-upgrade -Vy && sudo apt-get autoremove'
alias ds=ncdu
alias git=hub
alias npmup='sudo npm update -g'
alias pipup='sudo pip install -U $(pip list | cut -d " " -f 1)'

# Compile and run various fossil platforms for the masters. Remove when not needed.
gccr () {
  gcc -o ${1%.*} $1 && ./${1%.*}
}
javar () {
  javac $1 && java ${1%.*}
}
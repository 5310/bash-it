cite 'about-alias'
about-alias 'Personal alises'

alias a='atom . && echo Opening Atom in "$(pwd)/"'
alias aptupgd='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove --purge -y'
alias cat='bat --paging never'
alias ds=ncdu
alias git=hub
alias npmup='sudo npm update -g'
alias pipup='sudo pip install -U $(pip list | cut -d " " -f 1)'
alias pnpmup='sudo pnpm i -g pnpm && sudo pnpm upgrade -g'
alias xt='exa -bhHlST --git'
alias x='exa -bhHlS --git'

# Compile and run various fossil platforms for the masters. Remove when not needed.
gccr () {
  gcc -o ${1%.*} $1 && ./${1%.*}
}
g++r () {
  g++ -o ${1%.*} $1 && ./${1%.*}
}
javar () {
  javac $1 && java ${1%.*}
}

# Some IPFS aliases.
alias ipfspins='echo; for hash in $(ipfs pin ls -t "recursive" --quiet); do echo -n $hash; if ipfs ls $hash >/dev/null 2>/dev/null; then echo " directory:"; ipfs ls $hash | head -n 10 | sed "s/^/    /"; else echo " content:"; ipfs cat $hash | head -10 | sed "s/^/    /"; fi; echo; done'

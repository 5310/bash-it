cite 'about-alias'
about-alias 'Personal alises'

alias e='kate'
alias aptupgd='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove --purge -y'
alias cat='bat --paging never'
alias cp="cp -i" # confirm before overwriting something
alias df='df -h' # human-readable sizes
alias ds=ncdu
alias gksudo=kdesu
alias more=less
alias xt='exa -bhHlST --git'
alias x='exa -bhHlS --git'
alias temp="sensors | grep Core | cut -d + -f 2 | cut -d '.' -f 1 | tr '\r\n' ' ' && nvidia-smi -q -d temperature | grep 'GPU Current Temp' | cut -d ':' -f 2 | cut -d ' ' -f 2"
alias temps='echo "c0 c1 c2 c3 g0" && while true; do temp; sleep 2; done'

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

# Various repository related aliases.
alias npmls='ls -1 $(npm root -g)'
alias npmup='sudo npm update -g'
alias pipup='sudo pip install -U $(pip list | cut -d " " -f 1 | tail -n +3)'
alias pnpmup='sudo pnpm i -g pnpm && sudo pnpm install -g $(pnpm list -g --json | fx this[0].dependencies "Object.keys(this).join(\" \")")' # depends on npm:fx
#alias pnpmup='sudo pnpm i -g pnpm && sudo pnpm install -g $(pnpm list -g --json | grep '"from":' | cut -d " " -f 10 | cut -c 2- | rev | cut -c 3- | rev)' # plain shell cleanup

# Some IPFS aliases.
alias ipfspins='echo; for hash in $(ipfs pin ls -t "recursive" --quiet); do echo -n $hash; if ipfs ls $hash >/dev/null 2>/dev/null; then echo " directory:"; ipfs ls $hash | head -n 10 | sed "s/^/    /"; else echo " content:"; ipfs cat $hash | head -10 | sed "s/^/    /"; fi; echo; done'

# Archive extractor
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


cite 'about-alias'
about-alias 'Personal alises'

alias e='code . && echo Opening VS Code in "$(pwd)/"'
alias aptupgd='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove --purge -y'
alias cat='bat --paging never'
alias ds=ncdu
alias git=hub
alias npmup='sudo npm update -g'
alias pipup='sudo pip install -U $(pip list | cut -d " " -f 1 | tail -n +3)'
alias pnpmup='sudo pnpm i -g pnpm && sudo pnpm install -g $(pnpm list -g --json | fx this[0].dependencies "Object.keys(this).join(\" \")")' # depends on npm:fx
#alias pnpmup='sudo pnpm i -g pnpm && sudo pnpm install -g $(pnpm list -g --json | grep '"from":' | cut -d " " -f 10 | cut -c 2- | rev | cut -c 3- | rev)' # plain shell cleanup
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

# Some IPFS aliases.
alias ipfspins='echo; for hash in $(ipfs pin ls -t "recursive" --quiet); do echo -n $hash; if ipfs ls $hash >/dev/null 2>/dev/null; then echo " directory:"; ipfs ls $hash | head -n 10 | sed "s/^/    /"; else echo " content:"; ipfs cat $hash | head -10 | sed "s/^/    /"; fi; echo; done'

# List globally installed Node packages
nodels() { #TODO: pad fields
  echo via npm:
  for package in $(npm list -g --parseable --depth=0 | tail -n +2); do
    packagename=$(basename $package)
    echo '  ' $packagename $(fx \
      "x => typeof x.bin==='object' ? Object.keys(x.bin)[0]==='$packagename' ? '$' : '$ '+Object.keys(x.bin)[0] : typeof x.bin==='string' ? '$' : ''" \
      < $package/package.json\
    )
  done
  echo via pnpm:
  for package in $(pnpm list -g --parseable --depth=0 | tail -n +2); do
    packagename=$(basename $(dirname $package))
    echo '  ' $packagename $(fx \
      "x => typeof x.bin==='object' ? Object.keys(x.bin)[0]==='$packagename' ? '$' : '$ '+Object.keys(x.bin)[0] : typeof x.bin==='string' ? '$' : ''" \
      < $package/node_modules/$packagename/package.json\
    )
  done
}

# Here come common aliases.
# First `ls` aliases as I used to use them all the time.

alias ls='ls --color=auto'
alias lf='ls -F'
alias ll='ls -lF'

# Change directory aliases
alias cd-='cd -'
alias cd.='cd ..'
alias cd..='cd ../..'
alias cd...='cd ../../..'
alias cd....='cd ../../../..'
alias cd.....='cd ../../../../..'
alias cd......='cd ../../../../../..'
alias cd.......='cd ../../../../../../..'

# I use git, todo.sh and vim constantly, so I put these aliases here.
alias g='git'
#alias v='vim'
alias v='nvim'
alias t='todo.sh'
alias c='cargo'
alias s='sbt'
alias va='vagrant'
alias d='docker'
alias o='xdg-open'
alias l='systemctl --user start xorg-locker'
alias ru='rustup'

# This is a very old alias for `ps ... | grep`, I started using it on FreeBSD,
# and the power of habit is so strong, I can't stop using it.
alias psg='ps aux | grep'

# A set of `find` related aliases for maximum search convinience.
alias ff='find . -xdev -name'
alias -g -- -grep='-exec grep'
alias -g -- -all='{} +'
alias -g -- -one='{} \;'

# All `diff`s must be in unified format.
alias diff='diff -u'

# Password generator alias.
alias mkpass='pwgen -C -n 12 1'

# Default options for essential file management commands.
# `rm` and `mv` are so dangerous, they must always ask for confirmation.
alias rm='rm -i'
alias mv='mv -i'

# I like colors!
alias grep='grep --color=auto'

# Super fast search in my home directory.
# I support locate database in ~/.locatedb with my home dir contents
# for fastest search possible.
alias loc='locate -d ~/.locatedb -e'

# Just a shortcut to `source`. Yes, it's a habit as well.
alias so='.'

# Truncate a file without hassle.
alias trunc='truncate -s 0'

# Global aliases for syntax highlighting.
#
# Usage:
#     # Highlight logs
#     tail -f /var/log/nginx.log CL
#
#     # Highlight any pipe output with given language
#     cat myscript.sh C sh
#
#     # Color-cat any file, can fail if can't guess language
#     # from file extension
#     ccat myscript.sh
#
alias -g CL='| source-highlight --outlang-def=esc.outlang --style-file=esc.style -s log'
alias -g C='| source-highlight --outlang-def=esc.outlang --style-file=esc.style -s'
alias ccat='source-highlight --outlang-def=esc.outlang --style-file=esc.style -i'

# This is an alias to put data into X clipboard from command line
alias -g XC='| xsel --clipboard --input'

# Global alias to run command in background
alias -g BG='2>&- >&- &|'

# System management aliases to avoid typing long `sudo something` commands.
alias sc='sudo systemctl'
alias suc='systemctl --user'
alias jc='journalctl'
alias jv='journalctl --unit'

# Suffix aliases.
# Run `*.jar` files with JVM.
alias -s jar='java -jar'
alias -s jnlp='javaws'

# Simple calculator alias for `zcalc`
alias zc='zcalc -e'

# Calendar customization
alias cal='cal -m'

# Use mplayer to identify media file content
alias mpid='mplayer -identify -frames 0 -really-quiet'

# Show raw hex content of a file
alias hex='hexdump -ve '\''1/1 "%02x"'\'

# Android aliases
alias pm='adb shell pm'
alias am='adb shell am'

# Run simple web server from current directory to serve media files
# in a quick-n-dirty way.
function bcast {
    twistd -no web --path="${1:-.}"
}

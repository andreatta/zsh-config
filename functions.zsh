# Functions are defined here.

# This is like `psg`, but excludes `grep` process from output.
function psq () {
    ps aux | grep [${1:0:1}]${1:1}
}

# Activate Python virtualenv.
# This function looks for Python's virtual environment upward in
# directories hierarchy, the environment must be deployed in `env`
# directory. If it finds it, it activates the virtualenv.
function activate () {
    dir=$(back env/bin/activate) || return
    source $dir/env/bin/activate
}

# Backward directory search.
# Look for given filename from current directory upward, can be given
# second optional argument to limit number of directories to travel.
#
# Example:
#
#     # Look for .zshrc file if it exists somewhere in hierarchy:
#     FOUND=$(back .zshrc)
#     # The same as above, but look for 3 directories upward only:
#     FOUND=$(back .zshrc 3)
#
function back () {
    filename="./$1"
    dirscount=${2:--1}
    startdir="$PWD"

    while ! [ -e "$filename" -o $dirscount = 0 -o "$PWD" = "/" ]; do
        cd ..
        dirscount=$(( $dirscount - 1 ))
    done

    result="$PWD"
    cd "$startdir"

    [ -e "$result/$filename" ] || return 1
    echo $result
}

# Very simple `bc` wrapper.
# Just type `bcc 2+2*2` to calculate.
function bcc() {
	echo scale=5\;$@ | bc
}

# Colorized `tail -f` shortcut.
function tf() {
	tailf $@ CL
}

# I use `vim` to read man pages.
function man() {
        \vim -c ":RMan $*" -c ":redraw!"
}

# This function is to tell me version of arbitrary perl module. Just type
# `pmver Module::Name` to see Module::Name's version.
function pmver() {
    perl -M$1 -E "say \$$1::VERSION;"
}


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


alias mktd='mkdir ~/research/work/`date +'%Y-%m-%d'`'
alias td='cd ~/research/work/`date +'%Y-%m-%d'`'
alias rcf='ssh -AXY mstftsm@rssh.rhic.bnl.gov'
alias lab='ssh -AXY mustafa@star1.physics.purdue.edu'
alias bnl='ssh -AXY mmustafa@ssh.bnl.gov'
alias pdsf='ssh -AXY mustafa@pdsf.nersc.gov'
alias pdsf6='ssh -AXY mustafa@pdsf6.nersc.gov'
alias pdsf7='ssh -AXY mustafa@pdsf7.nersc.gov'
alias pdsf8='ssh -AXY mustafa@pdsf8.nersc.gov'
alias rm='rm -i'
alias l='ls -lrht'
alias la='ls -lrta'
alias ca='cd ~/research/npe/NPE/AuAu62GeV/analysis'
rcf='mstftsm@rftpexp.rhic.bnl.gov'
pdsf='mustafa@pdsf.nersc.gov'
lab='mustafa@star1.physics.purdue.edu'

export PATH=$PATH:/home/mustafa/MATLAB/R2013b/bin

CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/home/mustafa/Research/root/include
export CPLUS_INCLUDE_PATH

alias g11='g++ -W -Wall -Wextra -pedantic -std=c++11'
alias g03='g++ -W -Wall -Wextra -pedantic'


alias scp='scp -p'
alias cp='cp -p'

set -o vi

# fold path names

export MYPS='$(echo -n "${PWD/#$HOME/~}" | awk -F "/" '"'"'{
if (length($0) > 14) { if (NF>4) print $1 "/" $2 "/.../" $(NF-1) "/" $NF;
else if (NF>3) print $1 "/" $2 "/.../" $NF;
else print $1 "/.../" $NF; }
else print $0;}'"'"')'
PS1='$(eval "echo ${MYPS}")$ '

# create today's tasks list
alias tskslst='cd /home/mustafa/personal-management/tasks-list'
alias tsklst='cd /home/mustafa/personal-management/tasks-list; vim /home/mustafa/personal-management/tasks-list/`date +'%Y-%m-%d'`.md'

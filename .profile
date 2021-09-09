# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export EDITOR=emacsclient
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export TZ="America/New_York"
export DOCKER_HOST=host.docker.internal:2375
#export LANG=en_US.UTF-8
if [ -n "$BASH_VERSION" ]; then
    for dir in home dnxhome; do
        if [ -d ~/git/$dir ]; then
            source ~/git/$dir/.bash_profile
            changes=$( (cd ~/git/$dir && git diff-index --name-status HEAD) )
            if [ -n "$changes" ]; then
                echo "~/git/$dir:"
                echo "$changes"
            fi
        fi
    done
fi

# Put machine-local things in ~/.profile.local
if [ -e "$HOME/.profile.local" ]; then
   .  "$HOME/.profile.local"
fi 


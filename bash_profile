# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# Adding key to agent
# ssh-add ~/.ssh/id_rsa_eriksen > /dev/null 2>&1


################ john bash_profile ####################



#!/bin/sh
# . $HOME/.aliases
# . $HOME/bin/library.sh
# initializeANSI

# export PATH="/usr/local/opt/coreutils/libexec/gnubin:/Volumes/space5/bin:/usr/local/bin:/usr/local/sbin\
#   :/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
# export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/Volumes/Documents_/Sandbox/mvb_2.4_info/man :${MANPATH}"
# export PATH="/usr/local/sbin:$PATH"
# export CDPATH=$CDPATH:/mnt/resources:$HOME/Documents:$HOME/Documents/Sandbox:$HOME/Movies
# export __CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
# export INPUTRC=$HOME/.inputrc
# export DISPLAY=""
# export PAGER=less
# # export LESS='-r '
# export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
# export CLICOLOR=1
# export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31'
# export EDITOR=vim
# export VIM_APP_DIR='/Applications'
# export TERM='xterm-256color'
# export FIGNORE=$FIGNORE:'Application Scripts':'ScriptingAdditions':'Screen Savers'
# # export GREP_OPTIONS='--color=auto' # GREP_COLOR='100;8'
# export HOMEBREW_GITHUB_API_TOKEN=c52b742f55d7b35ecc4b18283f060b9a7564fc28
# export ENSCRIPT="--no-header --margins=50:50:50:50 --font=Courier10 --word-wrap --media=A4"
# export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# export RBENV_ROOT=/usr/local/var/rbenv
#
# # NEW BASH HISTORY START
# # http://superuser.com/questions/1006009/how-to-make-bash-keep-most-frequently-used-history-entries-for-ever?rq=1
# HISTCONTROL=ignoreboth:erasedups
# HISTIGNORE="?:??:???:$HISTIGNORE"
# export HISTSIZE=
# PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# # NEW BASH HISTORY END
#
# # export LSCOLORS='GxFxCxDxBxegedabagaced'
# # export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
# # export COMPANY="John Eley Studio"
# # export BAT_CHARGE="~/Dropbox/bin/batcharge.py"
# # export LOCATE_PATH="~/tmp/locatedb"
# # export LS_OPTIONS='--color=auto'
# # export PRINTER='Brother HL-2130 series'
# # eval $( keychain --quiet --eval --agents ssh )
#
#
# if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
#   . `brew --prefix`/etc/bash_completion.d/git-completion.bash
# fi

# _anybar_relaunch


#
#. $HOME/.bashrc
export PATH=/usr/local/Cellar/ruby/2.4.1_1/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

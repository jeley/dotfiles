[ -n "$PS1" ] && source ~/.bash_profile;



#################### john bashrc ######################


# #.bashrc
# . $HOME/.functions
# . $HOME/.aliases
# initializeANSI
#
#
# # This takes the place of motd
# # echo "${graybf}▇ ▇ ▇ ▇ ▇ ⓕ ⓞ ⓡ ⓤ ⓜ ▇ ▇ ▇ ▇ ▇ ${r}"
# # echo ""
# # echo "▂ ▃ ▅ ▆ ▇ ⓕ ⓞ ⓡ ⓤ ⓜ ▇ ▆ ▅ ▃ ▂"
#
# # https://www.topbug.net/blog/2016/11/28/a-better-ls-command/#better-color
# if ls --color -d . >/dev/null 2>&1; then  # GNU ls
#   export COLUMNS  # Remember columns for subprocesses.
#   eval "$( dircolors -b $HOME/.dircolors )"
#   function ls {
#     command ls -F -h --color=always -v --author --time-style=long-iso -C "$@" | less -R -X -F
#   }
# fi
#
# # OPTIONS:
# # When changing directory small typos are ignored:
# shopt -s cdspell
#
# # This will make *.xxx expand to nothing if no files match
# # the pattern (so the loop will not be executed)
# shopt -s nullglob
#
# # PROMPT
# PS1="${redf}\u@\h${r} ${whitebf}\W${r} ${redf}> ${r}"
#
# # AVOID OVERWRITING EXISTING FILES
# # set -o noclobber
#
# # Sets vi editing on commandline
# set -o vi
#
# # Set colors for less.
# # Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less .
# export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
# export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
# export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
# export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
# export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
# export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
# export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
#
source $HOME/init.sh
anybar_monitor_enable


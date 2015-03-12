### .zshrc
### author: pingtux

### general ZSH options ###
HISTFILE=~/.histfile # history file location
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep # no annoying beep
bindkey -e # EMACS-Style Key-Binding
setopt correctall # Correction for everyhting 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # Syntax-Highlighting plugin
autoload -U compinit # auto completition
compinit
setopt completealiases # complete aliases, too
setopt AUTO_PUSHD # push automatically to directory stack with ´cd´
setopt auto_cd # enter the name of a directory to cd into it
setopt inc_append_history # don't wait unitl shell exits to append to history
setopt extended_history # save time stamps
setopt histignorespace # ignore commands that start with a space
setopt hist_expire_dups_first # remove duplicates first if HISTSIZE is reached
### end of general ZSH options ###

### user settings ###

## aliases:
alias ls='ls --color=auto'
alias lk='cinnamon-screensaver-command -lm $1'
alias vi='vim'
alias ll='ls -lah'
alias close='exit'
alias syu='pacaur -Syu'
alias mountb='sudo /home/roman/.skripte/mountb.sh'
alias umountb='sudo /home/roman/.skripte/umountb.sh'
alias temppi='ssh pi@romanpi "/opt/vc/bin/vcgencmd measure_temp"'
alias suspend-system='sudo systemctl suspend'
alias pianobar='sudo systemctl start polipo && pianobar'
alias irssi='TERM=screen-256color irssi'

# suffix aliases
alias -s pdf=evince
alias -s mkv=vlc
alias -s mp4=vlc
alias -s avi=vlc
alias -s mp3=clementine
alias -s xlsx=libreoffice
alias -s xls=libreoffice
alias -s docx=libreoffice
alias -s doc=libreoffice

## cd path for frequently used folders:
cdpath=(/media/nas/ /media/nas/Dokumente/ /media/nas/Dokumente/1\ -\ Schule)

## PS1:
export PS1=$'[\e[1;31m%n\e[0m\e[0;37m@\e[0m\e[0;31m%M\e[0m %~] '

## environment options
export EDITOR='vim'
export GREP_OPTIONS="--color=auto" # automatically highlight results when grepping
export GUI_BROWSER="firefox" # needed for function google()
export PAGER='less'
export TERM='xterm-256color'

# coloured Man pages
export LESS_TERMCAP_us=$'\E[01;32m'       # underline begin
export LESS_TERMCAP_ue=$'\E[0m'           # underline end
export LESS_TERMCAP_so=$'\E[01;44;33m'    # start standout mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout mode
export LESS_TERMCAP_md=$'\E[01;34m'       # begin bold
export LESS_TERMCAP_mb=$'\E[01;34m'       # begin blink
export LESS_TERMCAP_me=$'\E[0m'           # end of everything

## functions

 extract() {
	if [ -f $1 ]; then
		case $1 in
			*.tar.bz2|*.tbz2)
				tar xvfj $1
				;;
			*.tar.gz|*.tgz)
				tar xvfz $1
				;;
			*.bz2)
				bzip2 -d $1
				;;
			*.rar)
				unrar x $1
				;;
			*.gz)
				gzip -d $1
				;;
			*.tar)
				tar xvf
				;;
			*.zip)
				unzip $1
				;;
			*.Z)
				compress -d $1
				;;
			*.7z)
				7z x $1
				;;
			*)
				echo  "Cannot extract \"$1\" via unpack()"
				;;
		esac
	else
		echo "\"$1\" is not a valid file"
	fi
}

 google() {
        if [ $# -gt '1' ]; then
                for i in $@
                do
                        SEARCHSTRING="$SEARCHSTRING+"$i""
                done
        elif [ $# -eq '0' ]; then
                echo "please enter a search term"
                exit
        elif [ $# -eq '1' ]; then
                SEARCHSTRING="$1"
        fi

        $GUI_BROWSER "https://www.google.ch/#q=$SEARCHSTRING" 1>/dev/null
        SEARCHSTRING=""
}

## miscellaneous

# Workaround for deprecated GREP_OPTIONS
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

## startup tools

# tmux Autostart
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

fortune -s # short fortune


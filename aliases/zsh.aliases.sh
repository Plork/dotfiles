#!/usr/bin/env bash

alias rl='source ~/.zshrc; echo ".zshrc reloaded"'
alias regen='zgen reset;source ~/.zshrc'

alias ll='ls -la'
alias llt='ls -lat'

alias senable='sudo systemctl enable'
alias srestart='sudo systemctl restart'
alias sstatus='sudo systemctl status'
alias sstop='sudo systemctl stop'
alias sstart='sudo systemctl start'

# Shortcuts
alias cdl="cd ~/Downloads"
alias cdt="cd ~/Desktop"
alias cg="cd ~/Git"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ~='cd ~/'

# Prompt if overwriting
alias cp='cp -i'
alias mv='mv -i'

alias sudo='sudo '

hs(){ history | grep -i "$1" ;}
alias .f='cd ~/.dotfiles'

# Detect the platform (similar to $OSTYPE)
OS="`uname`"
case $OS in
  'Linux')
		alias ls='ls --color=auto -p'
		alias sagi='sudo apt-get install'
		alias sai='sudo apt install'
		alias sagu='sudo apt-get update'
		alias saar='sudo add-apt-repository'
		alias sagr='sudo apt-get remove'
		alias pbcopy='xclip -selection c'
		alias pbpaste='xclip -selection clipboard -o'
    ;;
  'Darwin')
    ;;
  *) ;;
esac

# Other bash stuff
alias t="touch"
alias tr1='tree -L 1 -C'
alias tr2='tree -L 2 -C'
alias tr3='tree -L 3 -C'

if type bat > /dev/null 2>&1; then
	alias cat="bat"
fi

alias CDD='cd $(ls -v1td */ | head -1)'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

alias tf="terraform"

alias bb="bicep build ./main.bicep --outfile azuredeploy.json"

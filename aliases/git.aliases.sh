#!/usr/bin/env bash
#
# Some additional git aliases

alias gau="git add -u"
alias gbd="git branch -D"
alias gbm="git branch --merged"
alias gbnm="git branch --no-merged"
alias gbu="git branch -u"
alias gbv="git branch -v"
alias gbv="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gbvv="git branch -vv"
alias gcane="git commit --amend --no-edit"
alias gcof="git checkout -f"
alias gct="git checkout -t"
alias gdc="git diff --cached"
alias gdlast="git diff HEAD~1..HEAD"
alias gh="git hist"
alias gl="git l3"
alias glast="git log -1 HEAD"
alias glon="git log --oneline --name-only"
alias gpdel="git push --delete"
alias gpl="git pull"
alias groot='if [ "`git rev-parse --show-cdup`" != "" ]; then cd `git rev-parse --show-cdup`; fi'
alias gst="git status"
alias gstu="git status -uno"
alias gt="git tag"
alias gundo="git reset HEAD~1"
alias guns="git reset HEAD --"

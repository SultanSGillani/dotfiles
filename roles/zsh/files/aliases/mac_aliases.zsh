alias 'cask'="brew cask"
alias 'copy'="pbcopy < $@"
alias 'paste'="pbpaste"
alias 'services'="brew services"
alias 'growl'="terminal-notifier -message"
alias 'update!'="sudo softwareupdate -i -a; brew update; brew upgrade; brew
    cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem
    update"
alias 'cleanup!'="brew cleanup -s"
alias 'sleep!'="pmset sleepnow"
alias 'hidedesktop'="defaults write com.apple.finder CreateDesktop -bool
    false && killall Finder"
alias 'showdesktop'="defaults write com.apple.finder CreateDesktop -bool
true && killall Finder"
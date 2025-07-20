cask "iterm2"

dotfile "iterm2"

execute "defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true"
execute "defaults write com.googlecode.iterm2 PrefsCustomFolder -string '$HOME/.iterm2'"
#!/bin/bash

# Only run on macOS
if ! platform_is darwin; then
  log_info "macOS defaults are only for macOS. Skipping..."
  return 0
fi

log_info "Configuring macOS defaults..."

# Dock settings
log_info "Configuring Dock..."
execute "defaults write com.apple.dock autohide -bool true"
execute "defaults write com.apple.dock autohide-delay -float 0"
execute "defaults write com.apple.dock autohide-time-modifier -float 0.5"
execute "defaults write com.apple.dock tilesize -int 48"
execute "defaults write com.apple.dock magnification -bool true"
execute "defaults write com.apple.dock largesize -int 64"
execute "defaults write com.apple.dock minimize-to-application -bool true"
execute "defaults write com.apple.dock show-recents -bool false"

# Finder settings
log_info "Configuring Finder..."
execute "defaults write com.apple.finder ShowPathbar -bool true"
execute "defaults write com.apple.finder ShowStatusBar -bool true"
execute "defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'"
execute "defaults write com.apple.finder AppleShowAllFiles -bool true"
execute "defaults write NSGlobalDomain AppleShowAllExtensions -bool true"
execute "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true"
execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'"

# Trackpad settings
log_info "Configuring Trackpad..."
execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true"
execute "defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true"
execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true"
execute "defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true"

# Keyboard settings
log_info "Configuring Keyboard..."
execute "defaults write NSGlobalDomain KeyRepeat -int 2"
execute "defaults write NSGlobalDomain InitialKeyRepeat -int 15"
execute "defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false"
execute "defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false"
execute "defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false"
execute "defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false"
execute "defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false"
execute "defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false"

# Screenshot settings
log_info "Configuring Screenshots..."
execute "defaults write com.apple.screencapture location -string '$HOME/Pictures'"
execute "defaults write com.apple.screencapture type -string 'png'"
execute "defaults write com.apple.screencapture disable-shadow -bool true"

# Other useful settings
log_info "Configuring other settings..."
execute "defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false"
execute "defaults write com.apple.LaunchServices LSQuarantine -bool false"
execute "defaults write com.apple.CrashReporter DialogType -string 'none'"
execute "defaults write com.apple.helpviewer DevMode -bool true"

# Show battery percentage in menu bar
execute "defaults write com.apple.menuextra.battery ShowPercent -bool true"

# Enable full keyboard access for all controls
execute "defaults write NSGlobalDomain AppleKeyboardUIMode -int 3"

# Disable automatic termination of inactive apps
execute "defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true"

log_info "macOS defaults configured. Some changes may require a restart."
log_info "You may need to run 'killall Dock' and 'killall Finder' to apply some changes."
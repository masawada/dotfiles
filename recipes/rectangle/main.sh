#!/bin/bash

# Only install on macOS
if ! platform_is darwin; then
  log_info "Rectangle is only for macOS. Skipping..."
  return 0
fi

brew_cask "rectangle"

# Configure Rectangle preferences
log_info "Configuring Rectangle preferences..."

# Launch on login
execute "defaults write com.knollsoft.Rectangle launchOnLogin -bool true"

# Hide menu bar icon
execute "defaults write com.knollsoft.Rectangle hideMenubarIcon -bool true"

# Check for updates automatically
execute "defaults write com.knollsoft.Rectangle SUEnableAutomaticChecks -bool true"
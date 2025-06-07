#!/bin/bash

# Only install on macOS
if ! platform_is darwin; then
  log_info "iTerm2 is only for macOS. Skipping..."
  return 0
fi

brew_cask "iterm2"

# TODO: Add iTerm2 preferences configuration if needed
# You can export preferences from iTerm2 and include them here
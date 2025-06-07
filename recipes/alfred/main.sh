#!/bin/bash

# Only install on macOS
if ! platform_is darwin; then
  log_info "Alfred is only for macOS. Skipping..."
  return 0
fi

brew_cask "alfred"

# Note: Alfred preferences sync can be configured through iCloud or Dropbox
# within the Alfred preferences UI
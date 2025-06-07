#!/bin/bash

# Only run on macOS
if ! platform_is darwin; then
  log_info "Homebrew is only for macOS. Skipping..."
  return 0
fi

# Check if Homebrew is already installed
if command -v brew &>/dev/null; then
  log_info "Homebrew is already installed. Skipping..."
else
  log_info "Installing Homebrew..."
  
  # Download and run the official Homebrew installer
  execute '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  
  # Add Homebrew to PATH for Apple Silicon Macs
  if [[ -f "/opt/homebrew/bin/brew" ]]; then
    log_info "Configuring Homebrew for Apple Silicon..."
    execute 'eval "$(/opt/homebrew/bin/brew shellenv)"'
  fi
fi

# Update Homebrew
execute "brew update"

# Install essential tools
log_info "Installing essential Homebrew packages..."
package "coreutils"
package "findutils"
package "gnu-sed"
package "gawk"
package "grep"
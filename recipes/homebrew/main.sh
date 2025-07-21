if ! is_macos; then
  log_info "Homebrew is macOS only. Skipping..."
  return
fi

if ! command -v brew &>/dev/null; then
  log_info "Installing Homebrew..."
  command /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Setup PATH for current session (Apple Silicon)
  if [[ -f "/opt/homebrew/bin/brew" ]]; then
    log_info "Setting up Homebrew environment..."
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  log_info "Homebrew is already installed. Skipping..."
fi
if is_macos; then
  # Install via Homebrew on macOS
  package "ghq"
elif is_linux; then
  # Install from binary on Linux
  install_binary_archived_with_zip \
    "ghq" \
    "https://github.com/x-motemen/ghq/releases/download/v1.6.1/ghq_linux_amd64.zip" \
    "ghq_linux_amd64" \
    "fa121c76c14608175c52fc0ea53a584f20dda96bcec66909b5f7ee8b75715163"
fi

# create ghq_path
execute "mkdir -p $HOME/.ghq"

version="12.4.2"
url="https://github.com/Jguer/yay/releases/download/v${version}/yay_${version}_x86_64.tar.gz"
sha256_checksum="1ad3e5dbc410edc668eb9062bb6e56b90da818780581f06aa79dd696aa0b5ceb"
extracted_dir="yay_${version}_x86_64"

if ! type "yay" > /dev/null 2>&1; then
  execute "curl -L $url -o /tmp/yay.tar.gz"
  execute "echo \"$sha256_checksum  /tmp/yay.tar.gz\" | sha256sum -c"
  execute "tar -xzf /tmp/yay.tar.gz -C /tmp"
  execute "/tmp/$extracted_dir/yay -Sy --noconfirm --provides=no yay-bin"
else
  log_info "yay is already installed. Skipping..."
fi

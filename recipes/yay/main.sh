version="12.3.5"
url="https://github.com/Jguer/yay/releases/download/v${version}/yay_${version}_x86_64.tar.gz"
sha256_checksum="09b570e649aa7b111305ce1df9a83f0e88b06c191eeb8277aad2ac1ead2cbd6f"
extracted_dir="yay_${version}_x86_64"

if ! type "yay" > /dev/null 2>&1; then
  execute "curl -L $url -o /tmp/yay.tar.gz"
  execute "echo \"$sha256_checksum  /tmp/yay.tar.gz\" | sha256sum -c"
  execute "tar -xzf /tmp/yay.tar.gz -C /tmp"
  execute "/tmp/$extracted_dir/yay -Sy --noconfirm --provides=no yay-bin"
else
  log_info "yay is already installed. Skipping..."
fi

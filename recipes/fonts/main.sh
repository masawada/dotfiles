package_fonts=(
  "adobe-source-han-sans-otc-fonts"
  "adobe-source-han-serif-otc-fonts"
  "adobe-source-code-pro-fonts"
  "ttf-hack"
  "ttf-inconsolata"
  "ttf-font-awesome"
  "noto-fonts"
  "noto-fonts-emoji"
)
for package_font in "${package_fonts[@]}"; do
  package "$package_font"
done

aur_fonts=(
  "siji-git"
)
for aur_font in "${aur_fonts[@]}"; do
  aur "$aur_font"
done

create_directory "$HOME/.local/share/fonts"
create_symlink "/usr/share/fonts/misc/siji.bdf" "$HOME/.local/share/fonts/siji.bdf"

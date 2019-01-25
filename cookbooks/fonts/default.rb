%w[
  adobe-source-han-sans-otc-fonts
  adobe-source-han-serif-otc-fonts
  ttf-hack
  ttf-inconsolata
  ttf-font-awesome
].each do |font|
  package font
end

yay 'ttf-ricty'

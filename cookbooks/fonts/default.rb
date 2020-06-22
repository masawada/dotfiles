%w[
  adobe-source-han-sans-otc-fonts
  adobe-source-han-serif-otc-fonts
  ttf-hack
  ttf-inconsolata
  ttf-font-awesome
  noto-fonts
].each do |font|
  package font
end

%w[
  ttf-ricty
  siji-git
  cherry-font-git
].each do |font|
  yay font
end

# workaround for freetype2
# https://masawada.hatenablog.jp/entry/2019/05/07/114349
link File.join(ENV['HOME'], '.local', 'share', 'fonts', 'siji.bdf') do
  to "/usr/share/fonts/misc/siji.bdf"
end

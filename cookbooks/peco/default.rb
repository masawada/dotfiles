case node[:os]
when "Darwin"
  archive_name = 'peco_darwin_amd64.tar.gz'
else
  archive_name = 'peco_linux_amd64.tar.gz'
end

github_binary 'peco' do
  repository 'peco/peco'
  version 'v0.5.3'
  archive archive_name
end

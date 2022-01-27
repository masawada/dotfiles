case node[:os]
when "Darwin"
  archive_name = 'ecspresso_1.7.6_darwin_arm64.tar.gz'
else
  archive_name = 'ecspresso_1.7.6_linux_amd64.tar.gz'
end

github_binary 'ecspresso' do
  repository 'kayac/ecspresso'
  version 'v1.7.6'
  archive archive_name
end

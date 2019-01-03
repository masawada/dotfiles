case node[:os]
when "Darwin"
  archive_name = 'ghq_darwin_amd64.zip'
else
  archive_name = 'ghq_linux_amd64.zip'
end

github_binary 'ghq' do
  repository 'motemen/ghq'
  version 'v0.8.0'
  archive archive_name
end

ghq_path="#{ENV['HOME']}/.ghq"
directory ghq_path do
  user node[:user]
  not_if File.exist?(ghq_path)
end

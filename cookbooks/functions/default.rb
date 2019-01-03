package 'unzip'

define :github_binary, repository: nil, version: nil, archive: nil do
  name       = params[:name]
  version    = params[:version]
  repository = params[:repository]
  archive    = params[:archive]

  bin = "/usr/local/bin/#{name}"
  url = "https://github.com/#{repository}/releases/download/#{version}/#{archive}"

  execute "curl -fSL -o /tmp/#{archive} #{url}" do
    not_if "test -f #{bin}"
  end

  if archive.end_with?('.zip')
    extracted = File.join('/tmp', archive.sub(/\.zip$/, ''))
    extract   = "unzip -o /tmp/#{archive} -d #{extracted}"
  elsif archive.end_with?('.tar.gz')
    extracted = File.join('/tmp', archive.sub(/\.tar\.gz$/, ''))
    extract   = "tar zxvf /tmp/#{archive}"
  else
    raise
  end

  execute extract do
    cwd 'tmp'
    not_if "test -f #{bin}"
  end
  execute "mv #{extracted}/#{name} #{bin} && chmod +x #{bin}" do
    not_if "test -f #{bin}"
  end
end

define :github_binary, repository: nil, version: nil, archive: nil do
  name       = params[:name]
  version    = params[:version]
  repository = params[:repository]
  archive    = params[:archive]

  bin = "/usr/local/bin/#{name}"
  url = "https://github.com/#{repository}/releases/download/#{version}/#{archive}"

  if archive.end_with?('.zip')
    extract   = 'unzip -o'
    extracted = archive.sub(/\.zip$/, '')
  elsif archive.end_with?('.tar.gz')
    extract   = 'tar zxvf'
    extracted = archive.sub(/\.tar\.gz$/, '')
  else
    raise
  end

  execute "curl -fSL -o /tmp/#{archive} #{url}" do
    not_if "test -f #{bin}"
  end
  execute "#{extract} /tmp/#{archive}" do
    cwd 'tmp'
    not_if "test -f #{bin}"
  end
  execute "mv /tmp/#{extracted}/#{name} #{bin} && chmod +x #{bin}" do
    not_if "test -f #{bin}"
  end
end

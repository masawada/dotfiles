package 'go'

gopath = "#{ENV['HOME']}/.go"
directory gopath do
  not_if File.exist?(gopath)
  user node[:user]
end

%w[
  github.com/motemen/gore
  github.com/nsf/gocode
  github.com/k0kubun/pp
  golang.org/x/tools/cmd/godoc
].each do |repo|
  execute "GOPATH=#{gopath} go get -u #{repo}" do
    not_if File.exist?(File.join(gopath, 'src', repo))
    user node[:user]
  end
end

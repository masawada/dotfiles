package 'go'

gopath = "#{ENV['HOME']}/.go"
directory gopath do
  not_if { File.exist?(gopath) }
  user node[:user]
end

%w[
  github.com/itchyny/gojq/cmd/gojq@latest
  github.com/x-motemen/gore/cmd/gore@latest
  github.com/mdempsky/gocode@latest
  golang.org/x/tools/cmd/godoc@latest
].each do |repo|
  execute "GOPATH=#{gopath} go install #{repo}" do
    not_if { File.exist?(File.join(gopath, 'src', repo)) }
    user node[:user]
  end
end

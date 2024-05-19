package "go"

gopath="$HOME/.go"

if [ ! -d "$gopath" ]; then
  execute "mkdir $gopath"
fi

repos=(
  "github.com/itchyny/gojq/cmd/gojq@latest"
  "github.com/x-motemen/gore/cmd/gore@latest"
  "github.com/mdempsky/gocode@latest"
  "golang.org/x/tools/cmd/godoc@latest"
  "golang.org/x/tools/cmd/goimports@latest"
)
for repo in "${repos[@]}"; do
  execute "GOPATH=$gopath go install $repo"
done

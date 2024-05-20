nodenv_dir="$HOME/.nodenv"
node_build_dir="$nodenv_dir/plugins/node-build"

if [ -d "$nodenv_dir" ]; then
  # update nodenv
  execute "cd $nodenv_dir; git checkout master; git pull"
else
  # clone nodenv
  execute "git clone git@github.com:nodenv/nodenv.git $nodenv_dir"
fi

if [ -d "$node_build_dir" ]; then
  # update node-build
  execute "cd $node_build_dir; git checkout master; git pull"
else
  # clone node-build
  execute "git clone git@github.com:nodenv/node-build.git $node_build_dir"
fi

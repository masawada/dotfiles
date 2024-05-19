rbenv_dir="$HOME/.rbenv"
ruby_build_dir="$rbenv_dir/plugins/ruby-build"

if [ -d "$rbenv_dir" ]; then
  # update rbenv
  execute "cd $rbenv_dir; git checkout master; git pull"
else
  # clone rbenv
  execute "git clone git@github.com:rbenv/rbenv.git $rbenv_dir"
fi

if [ -d "$ruby_build_dir" ]; then
  # update ruby-build
  execute "cd $ruby_build_dir; git checkout master; git pull"
else
  # clone ruby-build
  execute "git clone git@github.com:rbenv/ruby-build.git $ruby_build_dir"
fi

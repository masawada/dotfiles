plenv_dir="$HOME/.plenv"
perl_build_dir="$plenv_dir/plugins/perl-build"

if [ -d "$plenv_dir" ]; then
  # update plenv
  execute "cd $plenv_dir; git checkout master; git pull"
else
  # clone plenv
  execute "git clone git@github.com:tokuhirom/plenv.git $plenv_dir"
fi

if [ -d "$perl_build_dir" ]; then
  # update perl-build
  execute "cd $perl_build_dir; git checkout master; git pull"
else
  # clone perl-build
  execute "git clone git@github.com:tokuhirom/Perl-Build.git $perl_build_dir"
fi

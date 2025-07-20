if is_macos; then
  package 'vim'
elif is_linux; then
  package 'gvim'
fi

dotfile 'vimrc'
dotfile 'vim'

plug_vim_source="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
plug_vim_path="$DOT_DIR/config/vim/autoload/plug.vim"
if [ ! -f "$plug_vim_path" ]; then
  execute "curl -fSLo $plug_vim_path --create-dirs $plug_vim_source"
fi

execute "vim +'PlugInstall --sync' +qa"

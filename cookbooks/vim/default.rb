case node[:platform]
when 'arch'
  package 'gvim'
when 'darwin'
  package 'vim' do
    options '--with-lua'
  end
end

dotfile '.vimrc'
dotfile '.vim'

plug_vim_source = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
plug_vim_path = "#{node[:dot_dir]}/config/vim/autoload/plug.vim"
execute "curl -fSL -o #{plug_vim_path} #{plug_vim_source}" do
  not_if "test -f #{plug_vim_path}"
end

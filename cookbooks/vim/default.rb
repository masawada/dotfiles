case node[:platform]
when 'arch'
  package 'gvim'
when 'darwin'
  package 'vim' do
    options '--with-lua'
  end
end

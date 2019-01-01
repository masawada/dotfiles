yay_version = '9.0.1'
url = "https://github.com/Jguer/yay/releases/download/v#{yay_version}/yay_#{yay_version}_x86_64.tar.gz"
archive = "yay_#{yay_version}_x86_64.tar.gz"
extracted = "yay_#{yay_version}_x86_64"

execute "curl -fSL -p /tmp/#{archive} #{url}" do
  user node[:user]
  not_if "command -v yay"
end
execute "tar zxvf /tmp/#{archive}" do
  not_if 'command -v yay'
  cwd '/tmp'
end
execute "/tmp/#{extracted}/yay --noconfirm yay-bin" do
  not_if 'command -v yay'
  user 'root'
end

define :yay do
  name = params[:name].shellescape
  execute "yay --noconfirm #{name}" do
    not_if "yay -Q #{name} || yay -Qg #{name}"
    if ENV['SUDO_USER']
      user ENV['SUDO_USER']
    end
  end
end

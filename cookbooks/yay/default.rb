yay_version = '12.3.5'

url = "https://github.com/Jguer/yay/releases/download/v#{yay_version}/yay_#{yay_version}_x86_64.tar.gz"
archive = "/tmp/yay_#{yay_version}_x86_64.tar.gz"
extracted_bin = "/tmp/yay_#{yay_version}_x86_64/yay"

execute "curl -fSL -o #{archive} #{url}" do
  user node[:user]
  not_if "command -v yay"
end
execute "tar zxvf #{archive}" do
  user node[:user]
  not_if 'command -v yay'
  cwd '/tmp'
end
execute "#{extracted_bin} -Syu yay-bin --noconfirm --noprovides" do
  user node[:user]
  not_if 'command -v yay'
end

define :yay do
  name = params[:name].shellescape
  execute "yay -Syu #{name} --noconfirm --noprovides" do
    not_if "yay -Q #{name} || yay -Qg #{name}"
    if ENV['SUDO_USER']
      user ENV['SUDO_USER']
    end
  end
end

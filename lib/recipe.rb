include_recipe 'recipe_helper'

node.reverse_merge!(
  user: ENV['SUDO_USER'] || ENV['USER'],
  dot_dir: File.expand_path('../..', __FILE__),
)

include_role node[:platform]

node.reverse_merge!(
  rbenv: {
    user: node[:user],
    global: '2.7.1',
    versions: %w[
      2.7.1
    ],
    scheme: 'https',
  }
)

include_recipe "rbenv::user"

dotfile '.bundle'
dotfile '.gemrc'

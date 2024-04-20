node.reverse_merge!(
  rbenv: {
    user: node[:user],
    global: '3.3.0',
    versions: %w[
      3.3.0
    ],
    scheme: 'https',
  }
)

include_recipe "rbenv::user"

dotfile '.bundle'
dotfile '.gemrc'

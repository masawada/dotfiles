node.reverse_merge!(
  nodenv: {
    user: node[:user],
    global: '18.16.0',
    versions: %w[
      18.16.0
    ],
    scheme: 'https',
  },
)

include_recipe 'nodenv::user'

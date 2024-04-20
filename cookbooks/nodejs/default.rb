node.reverse_merge!(
  nodenv: {
    user: node[:user],
    global: '20.12.2',
    versions: %w[
      20.12.2
    ],
    scheme: 'https',
  },
)

include_recipe 'nodenv::user'

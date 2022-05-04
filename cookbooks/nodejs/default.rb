node.reverse_merge!(
  nodenv: {
    user: node[:user],
    global: '12.18.1',
    versions: %w[
      12.18.1
      14.4.0
    ],
    scheme: 'https',
  },
)

include_recipe 'nodenv::user'

node.reverse_merge!(
  nodenv: {
    user: node[:user],
    global: '10.15.0',
    versions: %w[
      11.6.0
      10.15.0
    ],
  },
)

include_recipe 'nodenv::user'

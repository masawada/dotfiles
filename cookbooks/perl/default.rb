node.reverse_merge!(
  plenv: {
    user:     node[:user],
    global:   '5.30.3',
    versions: %w[
      5.30.3
    ],
    scheme: 'https',
  },
)

include_recipe "plenv::user"

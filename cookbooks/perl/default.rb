node.reverse_merge!(
  plenv: {
    user:     node[:user],
    global:   '5.34.1',
    versions: %w[
      5.34.1
    ],
    scheme: 'https',
  },
)

include_recipe "plenv::user"

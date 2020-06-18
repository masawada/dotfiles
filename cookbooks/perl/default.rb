node.reverse_merge!(
  plenv: {
    user:     node[:user],
    global:   '5.30.3',
    versions: %w[
      5.30.3
    ],
  },
)

include_recipe "plenv::user"

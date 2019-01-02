node.reverse_merge!(
  plenv: {
    user:     node[:user],
    global:   '5.28.1',
    versions: %w[
      5.28.1
    ],
  },
)

node.reverse_merge!(
  rbenv: {
    user: node[:user],
    global: '2.6.0',
    versions: %w[
      2.6.0
    ],
  }
)

include_recipe "rbenv::user"

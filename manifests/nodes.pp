node basenode {
}

node 'li230-219.members.linode.com' inherits basenode {
  include 'strd6_users'
  # TODO: Figure out why puppet sucks at installing postgres
  # include 'database'
  include 'app'
  include 'app_files'
  include rvm::system

}

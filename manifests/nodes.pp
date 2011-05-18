node basenode {
  include sudo
}

node 'li230-219.members.linode.com' inherits basenode {
  include 'strd6_users'
  include 'database'
  include 'image_magick'
}

class image_magick {
  package {['libmagick9-dev', 'imagemagick']:
    ensure => installed,
  }
}

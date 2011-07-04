class app {
  include 'core'

  # Java for jsdoc-toolkit
  #TODO look into using V8
  #TODO figure out how to add partner sources from puppet
  # deb http://archive.canonical.com/ lucid partner
  #TODO Figure out how to click through the license
  #package { ['sun-java6-jre']:
  #  ensure => installed,
  #}

  # Imagemagick for RMagick
  package {['libmagickwand-dev', 'imagemagick']:
    ensure => installed,
  }

  # XML for nokogiri
  package { ['libxml2-dev', 'libxslt1-dev']:
    ensure => installed,
  }

  # Passenger nginx
  package { 'libcurl4-openssl-dev':
    ensure => installed,
  }

  create_user{'gitbot':}

  file { "/u":
    ensure  => directory,
    owner   => "rails",
    group   => "users",
    mode    => 664,
  }

  file { "/u/apps/":
    ensure => directory,
    owner   => "rails",
    group   => "users",
    mode => 664,
    require => File["/u/"],
  }
}

class app {
  include 'core'
  
  # Java for jsdoc-toolkit
  #TODO look into using V8
  # package { ['sun-java6-jre']:
  #   ensure => installed,
  # }
  
  # Imagemagick for RMagick
  package {['libmagickwand-dev', 'imagemagick']:
    ensure => installed,
  }
  
  # XML for nokogiri
  package { ['libxml2-dev', 'libxslt1-dev']:
    ensure => installed,
  }

  create_user{'gitbot':}
  create_user{'rails':}
  file { "/u":
    ensure  => directory,
    owner   => "rails",
    group   => "users",
    mode   => 664,
  }
}

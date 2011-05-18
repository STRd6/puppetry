class app {
  include 'core'
  
  # Java for jsdoc-toolkit
  #TODO look into using V8
  package { ['sun-java6-jre']:
    ensure => installed,
  }
  
  # Imagemagick for RMagick
  package {['libmagick9-dev', 'imagemagick']:
    ensure => installed,
  }
  
  # XML for nokogiri
  package { ['libxml2-dev', 'libxslt-dev']:
    ensure => installed,
  }
}

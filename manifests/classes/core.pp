class core {
  #TODO this is kind of messy
  
  # Version control
  package { ['git-core']:
    ensure => installed,
  }
  
  # Readline
  package { ['libreadline6', 'libreadline6-dev']:
    ensure => installed,
  }
  
  # Web/ssl
  package { ['openssl', 'libssl-dev', 'curl']:
    ensure => installed,
  }
  
  # Compression
  package { ['zlib1g', 'zlib1g-dev', 'zip']:
    ensure => installed,
  }
  
  # Build essential
  package { ['build-essential', 'autoconf', 'bison']:
    ensure => installed,
  }

}

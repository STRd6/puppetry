class core {
  #TODO this is kind of messy
  
  # Version control
  package { ['git-core', 'subversion']:
    ensure => installed,
  }
  
  # Readline
  #TODO Figure out which of these we don't need
  package { ['libreadline5', 'libreadline-dev', 'libreadline5-dev', 'libreadline6-dev']:
    ensure => installed,
  }
  
  # Web/ssl
  package { ['openssl', 'curl', 'libssl-dev']:
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

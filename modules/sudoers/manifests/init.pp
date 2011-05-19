class sudoers {
  package { "sudo": 
    ensure => latest 
  }
  
  file { "/etc/sudoers":
    owner   => "root",
    group   => "root",
    source  => "puppet:///modules/sudoers/sudoers",
    require => Package["sudo"]
  }
}

class sudoers {
  package { "sudo": 
    ensure => latest 
  }
  
  file { "/etc/sudoers":
    owner   => "root",
    group   => "root",
    mode => 440,
    source  => "puppet:///modules/sudoers/sudoers",
    require => Package["sudo"]
  }
}

class postgres {
  package { ['postgresql', 'postgresql-server-dev-8.4']:
    ensure => installed,
  }
  
  file { "/etc/postgresql/8.4/main/pg_hba.conf":
    owner   => "postgres",
    group   => "postgres",
    source  => "puppet:///modules/postgres/pg_hba.conf",
    require => Package["postgresql"],
  }
  
  service { 'postgresql-8.4':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File['/etc/postgresql/8.4/main/pg_hba.conf'],
  }
}

class database {
  package { ['postgresql', 'postgresql-server-dev-8.4']:
    ensure => installed,
  }
}

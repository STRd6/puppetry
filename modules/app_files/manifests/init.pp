class app_files {
  $app_name = "pixie.strd6.com"
  $owner = 'rails'

  file { "/u/apps/${app_name}/":
    ensure => directory,
    owner => $owner,
    group => "users",
    mode => 664,
    require => File["/u/apps/"],
  }

  file { "/u/apps/${app_name}/shared/":
    ensure => directory,
    owner   => $owner,
    group   => "users",
    mode => 664,
    require => File["/u/apps/${app_name}/"],
  }

  file { "/u/apps/${app_name}/shared/local":
    ensure => directory,
    owner   => $owner,
    group   => "users",
    mode => 664,
    require => File["/u/apps/${app_name}/shared"],
  }

  define app_file() {
    file { "/u/apps/${app_name}/shared/local/${title}":
      owner   => $owner,
      group   => "users",
      mode => 664,
      source  => "puppet:///modules/app_files/${title}",
      require => File["/u/apps/${app_name}/shared/local"],
    }
  }

  app_file { "authlogic.yml": }
  app_file { "database.yml": }
  app_file { "local.rake": }
  app_file { "settings.yml": }
  app_file { "s3.yml": }
}

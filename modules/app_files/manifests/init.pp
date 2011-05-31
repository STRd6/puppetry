class app_files {
  #TODO These are much more specific to the app thant the server
  
  file { "/u/shared/":
    ensure => directory,
    owner   => "rails",
    group   => "rails",
  }

  define app_file() {
    file { "/u/shared/${title}":
      owner   => "rails",
      group   => "rails",
      source  => "puppet:///modules/secret/${title}",
      require => File["/u/shared/"],
    }
  }

  app_file { "authlogic.yml": }
  app_file { "database.yml": }
  app_file { "local.rake": }
  app_file { "settings.yml": }
  app_file { "s3.yml": }
}

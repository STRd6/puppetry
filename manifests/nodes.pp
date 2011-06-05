node basenode {
}

node 'li230-219.members.linode.com' inherits basenode {
  include 'strd6_users'
  include 'database'
  include 'app'
  include 'app_files'
  include rvm::system
  
  if $rvm_installed == "true" {
    rvm_system_ruby {
      'ruby-1.9.2-p180':
        ensure => 'present',
        default_use => true;
    }

    rvm_gem {
      'bundler':
        ruby_version => 'ruby-1.9.2-p180',
        ensure => latest,
        require => Rvm_system_ruby['ruby-1.9.2-p180'];
    }
  }

  rvm_gem {
    'passenger':
      ruby_version => 'ruby-1.9.2-p180',
      ensure => '3.0.7',
      require => Rvm_system_ruby['ruby-1.9.2-p180'];
  }
}

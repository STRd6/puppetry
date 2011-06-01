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
        ensure => 'present';
      'ree-1.8.7-2011.03':
        ensure => 'present',
        default_use => true;
    }
    
    rvm_gem {
      'bundler':
        ruby_version => 'ree-1.8.7-2011.03',
        ensure => latest,
        require => Rvm_system_ruby['ree-1.8.7-2011.03'];
    }
  }
}

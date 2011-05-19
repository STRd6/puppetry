class ssh {
  file { "/etc/ssh/sshd_config":
    owner   => "root",
    group   => "root",
    source  => "puppet:///modules/ssh/sshd_config",
  }
  
  service { 'ssh':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File["/etc/ssh/sshd_config"],
  }
}

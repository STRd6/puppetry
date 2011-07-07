define create_user($ssh_key="") {
  $username = $title
  
  user { $username:
    ensure => present,
    groups => ['users', 'rvm'],
    managehome => true,
    shell => "/bin/bash",
    require => Group['rvm', 'users']
  }
  
  file { "/home/${username}/":
    ensure => directory,
    owner => $username,
    group => $username,
    require => User[$username],
  }
  
  file { "/home/${username}/.bashrc":
    owner => $username,
    group => $username,
    require => User[$username],
    source => "puppet:///modules/strd6_users/bashrc",
  }
  
  file { "/home/${username}/.ssh": 
    ensure => 'directory',
    owner => $username,
    group => $username,
    mode => '700',
    require => [User[$username], File["/home/${username}/"]],
  }
  
  if $ssh_key {
		$key_name = "${username}@remote"
      
    ssh_authorized_key { $key_name:
      ensure => 'present',
      key => $ssh_key,
      name => $key_name,
      type => 'ssh-rsa',
      user => $username,
      require => File["/home/${username}/.ssh"],
    }
  }
}

class strd6_users {
  group { 'rvm':
    ensure => 'present',
  }

  group { 'users':
    ensure => 'present',
  }

  create_user{'rails':
    ssh_key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA4lQIOpBEdluY3m7vYD3B96aq4vObGmnbaNC4/ut3D5w/DdSheOCTuAoDZHR9ws0v5CNR7TjjblzZVCA6Q/R4CkMjF2yqK4JyZWxS1VABUvlyZLyaQ28dh14dRVO4kpqP0fkKIvUFxzHDsaM1iZNfJyWF4b7YM6QBFoT/7RWPBk0NQ86gWt5DFPlRKf3zYDyLBQ873TLn1L0fZs18MLma+twwgkmio6sktWyfxXMgFJlUJQ64arTBMwtG+23+25UrRoZfK29D2V7H7EEC0tbBlCeq1Pt/KwoPtdas7YA7iurs6sa1aJieaj5l9fjQwApgTT8sv1ZTxrbCeP+UNXIsbQ==',
  }
  create_user{'daniel':
    ssh_key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA4lQIOpBEdluY3m7vYD3B96aq4vObGmnbaNC4/ut3D5w/DdSheOCTuAoDZHR9ws0v5CNR7TjjblzZVCA6Q/R4CkMjF2yqK4JyZWxS1VABUvlyZLyaQ28dh14dRVO4kpqP0fkKIvUFxzHDsaM1iZNfJyWF4b7YM6QBFoT/7RWPBk0NQ86gWt5DFPlRKf3zYDyLBQ873TLn1L0fZs18MLma+twwgkmio6sktWyfxXMgFJlUJQ64arTBMwtG+23+25UrRoZfK29D2V7H7EEC0tbBlCeq1Pt/KwoPtdas7YA7iurs6sa1aJieaj5l9fjQwApgTT8sv1ZTxrbCeP+UNXIsbQ==',
  }
  create_user{'matt':
    ssh_key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA3XNHAzkJeQU+BT30xBufdavhbaykGVzjaNTYMFjOaUQ0SJKLGFS4PdIe9q+/JKMDRWC4Gr/5gUQ1/Es64uq6yFZrwcqbJ38SLWKi2M6NYaMPrt8SyBF8kmDtuZvXu/psNnHAaArkuewgwl7BN66oB7n07JlxTcRG4+h40vUXJHWQDutyy9lZXjJuPPOjfABKsh7lU8EHoG+KMjPDeGjgNPWcAnPYZaXn4DcN4vVln1hMj53M0rsWBRmHATiHXouPfV0Azr6EJ2FE9e+qlFxr4pM7jLEJlmtjffb6I+589CHRz/fVvJXWb0EFXpCMhuhI4RmUx0Dl0a/Hh59Gg2+jlQ==',
  }
  create_user{'lana':
    ssh_key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA1ft676evApxnXC8q8wqwOyRe7K7TNN8q5DMZ8+ByA7yGx86URFBrzVMMJTBgd2IkqaK0vbELr6/FvjDAAF/GDeuhxPP1ucC8xyIuSIQXhWRy8PwpL2HvwAD7G42LpxrHBODhikw9x6vMHOF74pDoPBJ+GTV9W3PPRFJ0/px1IAQyv5f4QotoNG8XmjlHxmxa31R9EWaCkglt/o/3GY/8hT5962Tik0fcPcb2EvAMmldwplDZfNFO+5qt7SoVaiC6NlbTyku6NiqcYj04XJOmcY+Pc0NM1XbSuq5k7cjiRJ/O5yxxW3vbYDd2mh1ygy3SNIlelKVTcAO3nWzpDV0uaQ==',
  }

  ssh_authorized_key { 'rails@matt-remote':
    ensure => 'present',
    key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA3XNHAzkJeQU+BT30xBufdavhbaykGVzjaNTYMFjOaUQ0SJKLGFS4PdIe9q+/JKMDRWC4Gr/5gUQ1/Es64uq6yFZrwcqbJ38SLWKi2M6NYaMPrt8SyBF8kmDtuZvXu/psNnHAaArkuewgwl7BN66oB7n07JlxTcRG4+h40vUXJHWQDutyy9lZXjJuPPOjfABKsh7lU8EHoG+KMjPDeGjgNPWcAnPYZaXn4DcN4vVln1hMj53M0rsWBRmHATiHXouPfV0Azr6EJ2FE9e+qlFxr4pM7jLEJlmtjffb6I+589CHRz/fVvJXWb0EFXpCMhuhI4RmUx0Dl0a/Hh59Gg2+jlQ==',
    name => 'rails@matt-remote',
    type => 'ssh-rsa',
    user => 'rails',
    require => File["/home/rails/.ssh"],
  }

  ssh_authorized_key { 'rails@lana-remote':
    ensure => 'present',
    key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA1ft676evApxnXC8q8wqwOyRe7K7TNN8q5DMZ8+ByA7yGx86URFBrzVMMJTBgd2IkqaK0vbELr6/FvjDAAF/GDeuhxPP1ucC8xyIuSIQXhWRy8PwpL2HvwAD7G42LpxrHBODhikw9x6vMHOF74pDoPBJ+GTV9W3PPRFJ0/px1IAQyv5f4QotoNG8XmjlHxmxa31R9EWaCkglt/o/3GY/8hT5962Tik0fcPcb2EvAMmldwplDZfNFO+5qt7SoVaiC6NlbTyku6NiqcYj04XJOmcY+Pc0NM1XbSuq5k7cjiRJ/O5yxxW3vbYDd2mh1ygy3SNIlelKVTcAO3nWzpDV0uaQ==',
    name => 'rails@lana-remote',
    type => 'ssh-rsa',
    user => 'rails',
    require => File["/home/rails/.ssh"],
  }
}

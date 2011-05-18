define create_user($ssh_key) {
  $username = $title
  
  user { $username:
    ensure => present,
    managehome => true,
  }
  
  $key_name = "${username}@remote"
  
  file { "/home/${username}/":
    ensure  => directory,
    owner   => $username,
    require => User[$username],
  }
  
  file { "/home/${username}/.ssh": 
    ensure => 'directory',
    owner => $username,
    mode => '700',
    require => [User[$username], File["/home/${username}/"]],
  }
  
  ssh_authorized_key { $key_name:
    ensure => 'present',
    key => $ssh_key,
    name => $key_name,
    type => 'ssh-rsa',
    user => $username,
    require => File["/home/${username}/.ssh"],
  }
}

class strd6_users {
  create_user{'daniel':
    ssh_key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA4lQIOpBEdluY3m7vYD3B96aq4vObGmnbaNC4/ut3D5w/DdSheOCTuAoDZHR9ws0v5CNR7TjjblzZVCA6Q/R4CkMjF2yqK4JyZWxS1VABUvlyZLyaQ28dh14dRVO4kpqP0fkKIvUFxzHDsaM1iZNfJyWF4b7YM6QBFoT/7RWPBk0NQ86gWt5DFPlRKf3zYDyLBQ873TLn1L0fZs18MLma+twwgkmio6sktWyfxXMgFJlUJQ64arTBMwtG+23+25UrRoZfK29D2V7H7EEC0tbBlCeq1Pt/KwoPtdas7YA7iurs6sa1aJieaj5l9fjQwApgTT8sv1ZTxrbCeP+UNXIsbQ==',
  }
  create_user{'matt':
    ssh_key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA3XNHAzkJeQU+BT30xBufdavhbaykGVzjaNTYMFjOaUQ0SJKLGFS4PdIe9q+/JKMDRWC4Gr/5gUQ1/Es64uq6yFZrwcqbJ38SLWKi2M6NYaMPrt8SyBF8kmDtuZvXu/psNnHAaArkuewgwl7BN66oB7n07JlxTcRG4+h40vUXJHWQDutyy9lZXjJuPPOjfABKsh7lU8EHoG+KMjPDeGjgNPWcAnPYZaXn4DcN4vVln1hMj53M0rsWBRmHATiHXouPfV0Azr6EJ2FE9e+qlFxr4pM7jLEJlmtjffb6I+589CHRz/fVvJXWb0EFXpCMhuhI4RmUx0Dl0a/Hh59Gg2+jlQ==',
  }
}


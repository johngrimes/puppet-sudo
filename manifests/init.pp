class sudo {
  package {'sudo':
    ensure => 'present',
  }

  file {'/etc/sudoers':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0440',
    content => template('sudo/sudoers.erb'),
    require => File['/etc/sudoers.d']
  }

  file {'/etc/sudoers.d':
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0550',
    recurse => true,
    purge   => true
  }

  group { 'admin':
    ensure => present
  }
}

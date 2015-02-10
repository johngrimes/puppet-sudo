define sudo::directive ($content) {
  file {"/etc/sudoers.d/${title}":
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0440',
    content => $content,
    require => File['/etc/sudoers.d']
  }
}

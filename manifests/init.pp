class apache2 {
  package{ [apache2, apache2-threaded-dev]: ensure => installed }

  service{ apache2: ensure => running, hasrestart => true }

  apache::site{"default":
      ensure => absent,
      require => Package['apache2']
  }
}

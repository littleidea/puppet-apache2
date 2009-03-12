class apache2 {
  package{ [apache2, apache2-threaded-dev]: ensure => installed }
}

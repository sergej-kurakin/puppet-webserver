class 'mysql' {
  package { "mysql-client-5.5":
    ensure => present,
  }

  package { "mysql-server-5.5":
    ensure => present,
  }

  service { "mysql":
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Package['mysql-server-5.5'],
  }
}
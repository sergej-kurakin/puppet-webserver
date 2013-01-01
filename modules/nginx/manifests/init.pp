class 'nginx' {
  package { 'nginx':
    ensure => present,
  }

  service { 'nginx':
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Package['nginx'],
  }
}
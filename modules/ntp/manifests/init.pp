class 'ntp' {
  package { 'ntp':
    ensure => present,
  }

  service { 'ntp':
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Package['ntp'],
  }
}
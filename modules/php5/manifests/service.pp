class php5::service {
  service { 'php5-fpm':
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Class['php5::install'],
  }
}
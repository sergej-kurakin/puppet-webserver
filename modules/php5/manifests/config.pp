class php5::config {

  file { '/etc/php5/cli/php.ini':
    ensure => present,
    content => template('php5/cli/php.ini.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['php5::install'],
  }

  file { '/etc/php5/fpm/php.ini':
    ensure => present,
    content => template('php5/fpm/php.ini.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['php5::install'],
    notify => Class['php5::service'],
  }

  file { '/etc/php5/fpm/php-fpm.conf':
    ensure => present,
    content => template('php5/fpm/php-fpm.conf.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['php5::install'],
    notify => Class['php5::service'],
  }

  file { '/etc/php5/fpm/pool.d/www.conf':
    ensure => present,
    content => template('php5/fpm/pool.d/www.conf.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['php5::install'],
    notify => Class['php5::service'],
  }

}
class nginx {
  package { 'nginx':
    ensure => present,
  }

  file { '/etc/nginx/nginx.conf':
    ensure => present,
    content => template('nginx/nginx.conf.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  file { '/etc/nginx/fastcgi_params':
    ensure => present,
    content => template('nginx/fastcgi_params.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  file { '/etc/nginx/mime.types':
    ensure => present,
    source => 'puppet:///modules/nginx/mime.types',
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  file { '/etc/nginx/scgi_params':
    ensure => present,
    content => template('nginx/scgi_params.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  file { '/etc/nginx/uwsgi_params':
    ensure => present,
    content => template('nginx/uwsgi_params.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  service { 'nginx':
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Package['nginx'],
  }
}
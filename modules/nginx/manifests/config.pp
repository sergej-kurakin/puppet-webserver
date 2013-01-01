class nginx::config {

  file { '/etc/nginx/nginx.conf':
    ensure => present,
    content => template('nginx/nginx.conf.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }

  file { '/etc/nginx/fastcgi_params':
    ensure => present,
    content => template('nginx/fastcgi_params.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }

  file { '/etc/nginx/mime.types':
    ensure => present,
    source => 'puppet:///modules/nginx/mime.types',
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }

  file { '/etc/nginx/scgi_params':
    ensure => present,
    content => template('nginx/scgi_params.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }

  file { '/etc/nginx/uwsgi_params':
    ensure => present,
    content => template('nginx/uwsgi_params.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => present,
    content => template('nginx/conf.d/default.conf.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['nginx::install'],
    notify => Class['nginx::service'],
  }

}
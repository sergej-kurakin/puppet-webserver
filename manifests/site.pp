node 'puppettest' {
  apt::key { "nginx":
    key        => '7BD9BF62',
    key_source => 'http://nginx.org/keys/nginx_signing.key',
  }

  apt::source { 'nginx':
    location   => 'http://nginx.org/packages/debian/',
    repos      => 'nginx',
    key        => '7BD9BF62',
    key_source => 'http://nginx.org/keys/nginx_signing.key',
  }

  apt::key { "dotdeb":
    key        => '89DF5277',
    key_source => 'http://www.dotdeb.org/dotdeb.gpg',
  }

  apt::source { 'dotdeb':
    location   => 'http://packages.dotdeb.org',
    repos      => 'all',
    key        => '89DF5277',
    key_source => 'http://www.dotdeb.org/dotdeb.gpg',
  }

  package { ['screen', 'vim', 'bash-completion'] :
    ensure => present,
  }

  package { "nginx":
    ensure => present,
  }

  service { "nginx":
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Package[nginx],
  }

  package { "ntp":
    ensure => present,
  }

  service { "ntp":
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Package[ntp],
  }

  package { ["php5", "php5-cgi", "php5-cli", "php5-fpm", "php5-dev", "php5-gd", "php5-intl", "php5-mcrypt", "php5-mysql", "php5-sqlite", "php5-xsl", "php5-curl", "php5-imagick", "php5-geoip", "php5-ssh2"]:
    ensure => present,
  }

  service { "php5-fpm":
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Package[php5-fpm],
  }

  package { "mysql-client-5.5":
    ensure => present,
  }

  package { "mysql-server-5.5":
    ensure => present,
  }

}

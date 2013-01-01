node 'puppettest' {

  include apts::nginx, apts:dotdeb

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

  service { "mysql":
      ensure => running,
      hasstatus => true,
      hasrestart => true,
      enable => true,
      require => Package["mysql-server-5.5"],
    }

}

class ntp::config {
  file { '/etc/ntp.conf':
    ensure => present,
    source => 'puppet:///modules/ntp/ntp.conf',
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['ntp::install'],
    notify => Class['ntp::service'],
  }
}
class php5::install {
  package { $php5::params::packages :
    ensure => present,
  }
}
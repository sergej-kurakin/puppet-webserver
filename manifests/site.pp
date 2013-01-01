node 'puppettest' {

  include apts::nginx, apts::dotdeb

  package { ['screen', 'vim', 'bash-completion'] :
    ensure => present,
  }

  include ntp, mysql, php5 nginx

}

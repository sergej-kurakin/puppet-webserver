class apts::dotdeb {
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
}
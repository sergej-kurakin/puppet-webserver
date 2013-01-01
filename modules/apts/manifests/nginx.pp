class apts::nginx {
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
}
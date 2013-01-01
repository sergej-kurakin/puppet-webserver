class apts {
  # Need anchor to provide containment for dependencies.
  anchor { 'apt::update':
    require => Class['apt::update'],
  }
}
define nginx::vhost::snippet(
  $vhost,
  $content = undef,
  $ensure  = present
) {

  if !defined(File["/etc/nginx/sites-available/${vhost}.d/"]) {
    file { "/etc/nginx/sites-available/${vhost}.d/":
      ensure  => directory,
      owner   => root,
      group   => root,
      mode    => '0600',
      require => Class['nginx::package'],
      notify  => Class['nginx::service'],
    }
  }

  file { "/etc/nginx/sites-available/${vhost}.d/${name}.conf":
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0600',
    require => Class['nginx::package'],
    notify  => Class['nginx::service'],
    content => $content
  }

}

define nginx::vhost::snippet(
  $vhost,
  $content = undef,
  $ensure  = present
) {

  # do vhost before snippet
  Nginx::Vhost[$vhost] -> Nginx::Vhost::Snippet[$name]

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

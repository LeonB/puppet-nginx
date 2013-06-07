class nginx::config {

  # do package before config
  Class['nginx::package'] -> Class['nginx::config']

  # notify service class
  Class['nginx::config'] ~> Class['nginx::service']

  nginx::vhost { 'default':
    server_name => 'localhost',
    root        => '/usr/share/nginx/html',
    source      => 'puppet:///modules/nginx/sites-available/default',
  }

  # nginx::vhost::snippet { 'index':
  #   vhost   => 'default',
  #   content => template('nginx/snippets/index.erb')
  # }

  # nginx::vhost::snippet { 'doc':
  #   vhost   => 'default',
  #   content => template('nginx/snippets/doc.erb')
  # }

  # file { '/usr/share/nginx/www/index.html':
  #   source => "puppet:///modules/nginx/index.html"
  # }

  file { '/etc/nginx/proxy.conf':
    ensure  => $nginx::ensure,
    content => template('nginx/proxy.conf'),
  }

  file { '/etc/nginx/deny.conf':
    ensure  => $nginx::ensure,
    content => template('nginx/deny.conf'),
  }

}

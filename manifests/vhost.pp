define nginx::vhost(
	$server_name = $name,
	$root        = undef,
	$content     = template('nginx/vhost.erb')
) {

	file{ "/etc/nginx/sites-available/${name}":
		owner   => root,
		group   => root,
		mode    => 0600,
		require => Class["nginx::package"],
		notify  => Class["nginx::service"],
		content => $content
	}

}

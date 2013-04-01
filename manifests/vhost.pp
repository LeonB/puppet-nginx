define nginx::vhost(
	$server_name = $name,
	$root        = undef,
	$content     = undef,
	$source      = undef,
) {

	if $content and $source {
		fail('Specifiy $source or $content, not both')
	}

	if !$content and !$source {
		$real_content = template('nginx/vhost.erb')
	} else {
		$real_content = undef
	}

	file{ "/etc/nginx/sites-available/${name}":
		owner   => root,
		group   => root,
		mode    => 0600,
		content => $real_content,
		source  => $source,
		require => Class["nginx::package"],
		notify  => Class["nginx::service"],
	}

	file{ "/etc/nginx/sites-available/${name}.d/":
		ensure  => directory,
		force   => true,
		owner   => root,
		group   => root,
		mode    => 0600,
		require => Class["nginx::package"],
		notify  => Class["nginx::service"],
	}

	file { "/etc/nginx/sites-enabled/${name}":
		ensure  => 'link',
		target  => "/etc/nginx/sites-available/${name}",
                require => Class["nginx::package"],
                notify  => Class["nginx::service"],
	}

}

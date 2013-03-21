class nginx::config {

	nginx::vhost { 'default':
		server_name => 'localhost',
		root        => '/usr/share/nginx/www'
	}

	# nginx::vhost::snippet { 'index':
	# 	vhost   => 'default',
	# 	content => template('nginx/snippets/index.erb')
	# }

	# nginx::vhost::snippet { 'doc':
	# 	vhost   => 'default',
	# 	content => template('nginx/snippets/doc.erb')
	# }

	# file { '/usr/share/nginx/www/index.html':
	# 	source => "puppet:///modules/nginx/index.html"
	# }

	file { '/etc/nginx/conf.d/proxy.conf':
		ensure  => $nginx::ensure,
		content => template('nginx/conf.d/proxy.conf'),
	}

}

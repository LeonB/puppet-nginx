class nginx::passenger::config {

	# do package before config
	Class['nginx::passenger::package'] -> Class['nginx::passenger::config']

}

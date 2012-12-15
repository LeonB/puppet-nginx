class nginx::package {

	package  { $nginx::package_name:
		ensure => present
	}
}

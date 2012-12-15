class nginx(
	$package_name = params_lookup( 'package_name' ),
	$user         = params_lookup( 'user' )
  ) inherits nginx::params {

	include nginx::package, nginx::config, nginx::service
}

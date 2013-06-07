class nginx(
  $package_name = params_lookup( 'package_name' ),
  $enabled      = params_lookup( 'enabled' ),
  $user         = params_lookup( 'user' )
  ) inherits nginx::params {

        $ensure = $enabled ? {
                true => present,
                false => absent
        }

  include nginx::package, nginx::config, nginx::service
}

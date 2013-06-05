class nginx::passenger(
    $packages = params_lookup( 'packages' ),
    $enabled  = params_lookup( 'enabled' ),
    $user     = params_lookup( 'user' )
  ) inherits nginx::passenger::params {

    # Depends on ruby
    include ruby
    Class['nginx::passenger'] -> Class['ruby']

        $ensure = $enabled ? {
                true => present,
                false => absent
        }

    include nginx::passenger::package, nginx::passenger::config
}

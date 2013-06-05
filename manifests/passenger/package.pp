class nginx::passenger::package {

    apt::ppa { 'ppa:brightbox/passenger': }

    package  { $nginx::passenger::packages:
        ensure  => $nginx::passenger::ensure,
        require => Apt::Ppa['ppa:brightbox/passenger'],
    }
}

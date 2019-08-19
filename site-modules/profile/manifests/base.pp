class profile::base {

  #the base profile should include component modules that will be on all nodes
  include ntp

  class { 'ntp':
    servers => [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org'],
  }
  
  accounts::user { 'monitoring':
    ensure => present,
    uid => '450',
    gid => '450',
    managehome => false,
    locked => true,
  }

  accounts::user { 'emergency':
    ensure => present,
    uid => '460',
    gid => '460',
    shell => '/bin/bash',
    password => '!!', # No password
    sshkeys => [
      "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxXShJiI4H+QnSOsRO+3NTU2X3Xn0g/2qvztPn/kwmKLgwfEtoYybbgpCRWMB5NZgnYh+QbSxvqII1QizVcZJcmprEyESeTHRmT2LGBwSxsSnI3CI3l4FGnSNg2cO6+6XRNcS7fjFxa1DgES6LiXekIGxjcJci1kBMQoBS0NzgTspsUEt2dzWrssEnT6ZZjdVNyMYYOVGfuYvw4My6xgMvzz8amJi+/J6Q9FS18N+46s1qjL/zjNxpxZOSmjad3nHIZZb8I2wtcILFZjMXqyf2rbJt2SYpH43CxajEPMwgYjp2xgKp7xbbOO35mCIswVxPq/lzjh5mlmdW8OTUbqOmw== erik",
    ],
  }
}

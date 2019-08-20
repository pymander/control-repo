class profile::mysql {
  class {'::mysql::server':
    package_name => 'mariadb-server',
    service_name => 'mariadb',
    override_options => {
      mysqld => {
        'log-error' => '/var/log/mariadb/mariadb.log',
        'pid-file'  => '/var/run/mariadb/mysqld.pid',
      },
      mysqld_safe => {
        'log-error' => '/var/log/mariadb/mariadb.log',
      },
    }
  }
}

class profile::mysql {
  class {'::mysql::server':
    package_name => 'mariadb-server',
    service_name => 'mariadb',
    override_options => {
      mysqld => {
        'log-error' => '/var/log/mysql/mariadb.log',
        'pid-file'  => '/var/run/mysqld/mysqld.pid',
      },
      mysqld_safe => {
        'log-error' => '/var/log/mysql/mariadb.log',
      },
    }
  }
}

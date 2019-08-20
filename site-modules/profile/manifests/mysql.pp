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

  # Purge all unmanaged databases
  resources { 'mysql_database':
    purge => true,
  }

  # Default MySQL tables that need to exist
  mysql_database { 'information_schema':
    ensure => 'present',
    charset => 'utf8',
    collate => 'utf8_general_ci',
  }
  mysql_database { 'mysql':
    ensure => 'present',
    charset => 'latin1',
    collate => 'latin1_swedish_ci',
  }
  mysql_database { 'performance_schema':
    ensure => 'present',
    charset => 'utf8',
    collate => 'utf8_general_ci',
  }

  # Our custom database table 
  mysql::db { 'webportal_customer':
    ensure => present,
    user => 'webportal',
    password => 'hunter2',
  }
}

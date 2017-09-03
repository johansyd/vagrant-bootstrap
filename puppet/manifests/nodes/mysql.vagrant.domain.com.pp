node 'mysql.vagrant.voipinfo.se' {
  class { 'common-dev-install':}
  

  class {'mysql::client':}
  class {'mysql::server':
    root_password    => 'root',
    override_options => {
    	'mysqld' => {
    		'bind-address' => '0.0.0.0',
    		'skip-external-locking' => false
    	}
    }
  } -> mysql::db { 'bootstrap':
    user     => 'test',
    password => '*7838569912F242229B7BF838FA85368E35BC6AD7',
    host     => 'localhost',
    grant 	 => ['ALL']
  } ->

  mysql_grant { 'root@%/*.*':
    ensure     => 'present',
    table      => '*.*',
    user       => 'root@%',
    privileges => ['ALL'],
  }

}

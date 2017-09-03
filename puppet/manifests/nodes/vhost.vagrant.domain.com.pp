node 'vhost.vagrant.domain.com' {
  class { 'apache':
    default_vhost => false
  }
  apache::vhost { 'vhost.vagrant.domain.com':
    docroot  => '/var/www/vhost.vagrant.domain.com/application/htdocs',
    port => 80,
    docroot_group => 'vagrant',
    docroot_owner => 'apache',
    docroot_mode => '777',
    ssl      => false,
    directories => [
	  { path    => '/var/www/vhost.vagrant.domain.com/application/htdocs',
	    options => ['Indexes','FollowSymLinks','MultiViews'],
      allow_override  => ['All'],
	    order => ''
      
    }
    ],
    rewrites => [
	  {
	    comment      => 'redirect IE',
	    rewrite_cond => ['%{HTTPS} on'],
	    rewrite_rule => ['^ http://%{HTTP_HOST}%{REQUEST_URI}'],
	    },
  	],
  	headers => [
  	  'always set Access-Control-Allow-Origin "*"',
  	  'set Access-Control-Allow-Headers "Origin, X-Requested-With, Content-Type, Accept, request"',
  	  'always set Access-Control-Allow-Methods "POST, GET, OPTIONS, DELETE, PUT"'
  	],
    manage_docroot => false,
    setenv => []
  }
  php::ini { '/etc/php.ini':
    display_errors => 'On',
    short_open_tag   => 'On',
  }
  class { 'apache::mod::php':
    package_name => 'php55w'
  }

  file { '/var/www/vhost.vagrant.domain.com':
    owner => 'root',
    group => 'vagrant',
    mode => '777'
  }

  file { '/var/www':
    owner => 'root',
    group => 'vagrant',
    mode => '777'  
  }

  file { '/var/www/vhost.vagrant.domain.com/application':
    ensure => 'link',
    target => '/var/www/vhost.vagrant.domain.com/active',
    owner => 'root',
    group => 'vagrant'
  }

  class { 'common-dev-install':}

  class {'selinux':
    mode => 'disabled'
  }

  class {'mysql::client':}

  package{'webtatic-release-7-3.noarch':
      provider => 'rpm',
      ensure => 'present',
      source => 'https://mirror.webtatic.com/yum/el7/webtatic-release.rpm'
  } ->

  package{'epel-release-7-9.noarch':
      provider => 'rpm',
      ensure => 'present',
      source => 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
  } ->

  package {'php55w':
    notify  => Service['httpd'],
    ensure => 'present'
  }

  package {'php55w-mbstring':
    notify  => Service['httpd'],
    ensure => 'present',
    require => Package['php55w']
  }
  package {'php55w-xml':
    notify  => Service['httpd'],
    ensure => 'present',
    require => Package['php55w']
  }
  package {'php55w-cli':
    notify  => Service['httpd'],
    ensure => 'present',
    require => Package['php55w']
  }
  package {'php55w-devel':
    notify  => Service['httpd'],
    ensure => 'present',
    require => Package['php55w']
  }
  package {'php55w-mysqlnd':
    notify  => Service['httpd'],
    ensure => 'present',
    require => Package['php55w']
  }
  package {'php55w-mcrypt':
    notify  => Service['httpd'],
    ensure => 'present',
    require => Package['php55w']
  }
  package {'php55w-pear':
    notify  => Service['httpd'],
    ensure => 'present',
    require => Package['php55w']
  }
  package {'php55w-pecl-xdebug':
    notify  => Service['httpd'],
    ensure => 'present',
    require => Package['php55w']
  }

  package {'php55w-soap':
    notify  => Service['httpd'],
    ensure => 'present',
    require => Package['php55w']
  }

  
}

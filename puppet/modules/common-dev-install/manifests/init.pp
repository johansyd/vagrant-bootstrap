class common-dev-install() {
  package { 'neovim':
    ensure => 'installed',
  }
  package { 'emacs':
    ensure => 'installed',
  }
  package { 'tree':
    ensure => 'installed',
  }
  package { 'perl-libwww-perl':
    ensure => 'installed',
  }
  package { 'traceroute':
    ensure => 'installed',
  }
  package { 'git':
    ensure => 'installed',
  }
}
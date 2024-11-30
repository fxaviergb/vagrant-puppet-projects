class apache (
  String $directory_root = '/var/www/html',
) {
  # Instalar Apache
  package { 'apache2':
    ensure => installed,
  }

  # Configurar el archivo de host virtual
  file { '/etc/apache2/sites-available/vagrant.conf':
    content => template('apache/virtual-hosts.conf.erb'),
    require => Package['apache2'],
  }

  # Habilitar el host virtual
  file { '/etc/apache2/sites-enabled/vagrant.conf':
    ensure  => link,
    target  => '/etc/apache2/sites-available/vagrant.conf',
    require => File['/etc/apache2/sites-available/vagrant.conf'],
  }

  # Asegurar que el directorio raíz existe
  file { $directory_root:
    ensure => directory,
  }

  # Crear el archivo index.php
  file { "${directory_root}/index.php":
    ensure  => file,
    source  => 'puppet:///modules/apache/index.php',
    require => File[$directory_root],
    notify  => Service['apache2'],
  }

  # Asegurar que Apache está ejecutándose
  service { 'apache2':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    subscribe  => File['/etc/apache2/sites-enabled/vagrant.conf'],
  }
}

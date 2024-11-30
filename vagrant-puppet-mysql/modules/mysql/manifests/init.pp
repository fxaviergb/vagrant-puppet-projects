class mysql {
  # Instalar el paquete MySQL Server
  package { 'mysql-server':
    ensure => installed,
  }

  # Asegurar que el servicio MySQL esté corriendo
  service { 'mysql':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['mysql-server'],
  }

  # Copiar el archivo SQL a la máquina virtual
  file { '/tmp/init.sql':
    ensure  => file,
    source  => 'puppet:///modules/mysql/init.sql',
    require => Package['mysql-server'],
  }

  # Ejecutar el script SQL para crear la base de datos, usuario, tabla y registros
  exec { 'initialize-mysql':
    command => '/usr/bin/mysql < /tmp/init.sql',
    path    => ['/usr/bin', '/bin'],
    unless  => '/usr/bin/mysql -e "USE mi_base_datos; SHOW TABLES LIKE \'personas\';"',
    require => [ File['/tmp/init.sql'], Service['mysql'] ],
  }
}

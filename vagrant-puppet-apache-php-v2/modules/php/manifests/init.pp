class php {
  # Instalar PHP y el módulo necesario para Apache
  package { ['php', 'libapache2-mod-php']:
    ensure => installed,
    require => Package['apache2'],
  }
}

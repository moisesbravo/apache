class apache::service {  
  service { "${apache::apache_name_service}":
      ensure => "running",
      hasstatus => true,
      hasrestart => true,
      enable => true,
      name => "${apache::apache_name_service}", #Aqui se instanció la variable en el init.pp y luego solo instanción en la subclase service.pp 
      require => Class["apache::config"],
    }
  #notice{"The value is: ${apache_name_service}": },
}
class apache::install (
       
        
){
  # Instalación de Apache
package { "${apache::apache_name_service}":
    ensure => present,
     require => Package['apache2']
}
 
}
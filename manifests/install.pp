class apache::install (
       
        
){
  # Instalación de Apache
package { "${apache::apache_name_service}":
    ensure => present,
    require => Exec["apt-get update"]
}
 
}
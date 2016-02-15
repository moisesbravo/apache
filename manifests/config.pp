class apache::config (
        $apache_owner_name = "www-data", #hiera('apache_owner_name'), #Valor de la variable Hiera
        $apache_name_group = "www-data", #hiera('apache_name_group'), #Valor de la variable Hiera
        $apache_dir_name = "/var/www/index.html" #hiera('apache_dir_name'),
){

  file {'index.html':
      ensure => file,
      mode => 0640,
      owner =>  $apache_owner_name,
      group => $apache_name_group,
  path => $apache_dir_name,
  #path => "/var/www/html/index.html",
      content => template('apache/index.html.erb'),
  require => Class["apache::install"],
      notify => Class["apache::service"],
    }
    
  #Mueve la configuracion del http.conf
    file { "/etc/apache2/httpd.conf":  
        require => File["/var/www/$name"],
        ensure => file,
        backup =>false,
        source => "puppet:///modules/apache/files/httpd.conf",
    } #notify {"El grupo es: $apache_name_group":} #Para comprobar el valor de la variables
  #notify {"El path es: $apache_dir_name":}
}
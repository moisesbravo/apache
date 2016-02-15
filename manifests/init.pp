class apache (
  $apache_package_name = hiera('apache_package_name'),
  $apache_name_service = hiera('apache_name_service'),
      $machineos = $operatingsystem,
      $machinenode = $hostname,
      $machineip = $ipaddress,
){
  class {'::apache::install':} ->
  class {'::apache::config':} ->
  class {'::apache::service':} 
}
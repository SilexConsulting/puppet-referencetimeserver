# Class: referencetimeserver::config
#
# This module manages referencetimeserver deployment
#
# Actions: DOWNLOAD & MOVE referencetimeserver war file to tomcat web apps directory
#
# Requires Tomcat server
#
# Sample usage:
#
# include referencetimeserver
# puppet apply --modulepath=/path/to -e "include referencetimeserver"
#
class referencetimeserver::config {

  $source_parts = split($referencetimeserver::referencetimeserver_source, '/')

  # Download the referencetimeserver WAR file into the tomcat webapps directory
  exec { 'referencetimeserver-download':
    path      => ['/usr/bin', '/usr/sbin', '/bin'],
    command   => "wget ${referencetimeserver::referencetimeserver_source}",
    cwd       => $referencetimeserver::params::tomcat_webapps_path,
    creates   => "${referencetimeserver::params::tomcat_webapps_path}/${source_parts[-1]}",
    timeout   => 0,
  }
}

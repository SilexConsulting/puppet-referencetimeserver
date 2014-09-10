# == Class: referencetimeserver
#
# This module manages referencetimeserver
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class referencetimeserver (
  $referencetimeserver_source   = $referencetimeserver::params::referencetimeserver_source
) inherits referencetimeserver::params {
  class {'referencetimeserver::install': } ->
  class {'referencetimeserver::config': } ~>
  Service['tomcat7'] ->
  Class['referencetimeserver']
}

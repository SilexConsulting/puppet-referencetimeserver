# Class: referencetimeserver::params
#
# This module manages referencetimeserver parameters which are used by the config class.
#
class referencetimeserver::params {
  require tomcat

  $tomcat_service               = $tomcat::service_name
  $tomcat_package               = $tomcat::package_name

  $referencetimeserver_source   = 'https://s3-eu-west-1.amazonaws.com/organograms/RELEASE-0.1/IntervalServer.war'

  case $::osfamily {
    'Debian': {
      $tomcat_webapps_path  = "/var/lib/${tomcat_package}/webapps"
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}

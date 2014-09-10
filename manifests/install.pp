# == Class referencetimeserver::install
# Pre-conditions that must be met before referencetimeserver can be installed

class referencetimeserver::install {
  include tomcat
  include beluga::wget
}

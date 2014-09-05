#
# Cookbook Name:: subscribrers
# Attrbutes:: default
#

default[:subscribers] = {
  # Subscribers will be run inline on to application/solo instances,
  # unless a utility name is set, in which case, they will
  # only be run on to a utility instance that matches
  # the name
  :utility_name => 'redis',
  
  # Verbose
  :verbose => false
}

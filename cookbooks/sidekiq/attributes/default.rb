#
# Cookbook Name:: sidekiq
# Attrbutes:: default
#

default[:sidekiq] = {
  # Sidekiq will be installed on to application/solo instances,
  # unless a utility name is set, in which case, Sidekiq will
  # only be installed on to a utility instance that matches
  # the name
  :utility_name => 'sidekiq',
  
  # Number of workers (not threads)
  :workers => 1,
  
  # Concurrency
  :concurrency => 1,
  
  # Queues
  :queues => {
    # :queue_name => weight
    :image      => 1,
    :agent      => 1,
    :snoop      => 1,
    :default    => 1,
    :mailers    => 1,
    :analytics  => 1
  },
  
  # Verbose
  :verbose => false
}

#
# Cookbook Name:: subscribers
# Recipe:: default
#

if util_or_app_server?(node[:subscribers][:utility_name]) 
  # report to dashboard
  ey_cloud_report "subscribers" do
    message "Setting up subscriber workers"
  end

  # loop through applications
  node[:applications].each do |app_name, _|
    # reload monit
    execute "restart-subscribers-for-#{app_name}" do
      command "monit reload && sleep 1 && monit restart all -g #{app_name}_subscribers"
      action :nothing
    end
    
    # monit
    template "/etc/monit.d/subscribers_#{app_name}.monitrc" do 
      mode 0644 
      source "subscribers.monitrc.erb" 
      backup false
      variables({ 
        :app_name => app_name, 
        :memory_limit => 511 # MB
      })
      notifies :run, resources(:execute => "restart-subscribers-for-#{app_name}")
    end
end

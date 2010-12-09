#
# Cookbook Name:: debian_basic
# Recipe:: default
#
# Copyright 2010, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/apt/sources.list" do
  mode 0644
  variables :code_name => node[:lsb][:codename]
  case node[:platform]
  when "ubuntu"
    source "ubuntu.sources.list.erb"    
  when "debian"
    source "debian.sources.list.erb"
  end
  
end

# update and upgrade system
# Warning
execute "Updating system (apt-get update)" do
  command "apt-get update"
end
execute "Upgrading default system (apt-get full-upgrade)" do
  command "apt-get -y full-upgrade"
end

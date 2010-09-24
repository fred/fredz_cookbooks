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
  command "apt-get update"
end

packages = value_for_platform(
  "default" => [
    'aptitude',
    'lsof',
    'ack-grep',
    'diff',
    'diffutils',
    'colordiff',
    'htop',
    'vim',
    'libpcrecpp0',
    'libpcre3', 
    'libpcre3-dev', 
    'libssl-dev', 
    'libxml2-dev', 
    'libxml2', 
    'libxslt1-dev',
    'libxslt1.1',
    'libcurl4-gnutls-dev',
    'libncurses5-dev',
    'libreadline6-dev',
    'libreadline-dev',
    'dialog'
  ]
)


case node[:platform]
when "ubuntu","debian"
  packages.each do |pkg|
    package pkg do
      action :install
    end
  end
end
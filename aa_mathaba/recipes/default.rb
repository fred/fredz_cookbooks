#
# Cookbook Name:: aa_mathaba
# Recipe:: default
#
# Copyright 2010, Mathaba
#
# All rights reserved - Do Not Redistribute
#

template "htpasswd" do
  path "#{node[:apache][:dir]}/htpasswd"
  source "htpasswd.erb"
  owner "root"
  group "root"
  mode 0644
end

template "apache2.conf" do
  path "#{node[:apache][:dir]}/apache2.conf"
  source "apache2.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "apache2")
end

template "security" do
  path "#{node[:apache][:dir]}/conf.d/security"
  source "security.erb"
  owner "root"
  group "root"
  mode 0644
  backup false
  notifies :restart, resources(:service => "apache2")
end

template "charset" do
  path "#{node[:apache][:dir]}/conf.d/charset"
  source "charset.erb"
  owner "root"
  group "root"
  mode 0644
  backup false
  notifies :restart, resources(:service => "apache2")
end

template "#{node[:apache][:dir]}/ports.conf" do
  source "ports.conf.erb"
  group "root"
  owner "root"
  variables :apache_listen_ports => node[:apache][:listen_ports]
  mode 0644
  notifies :restart, resources(:service => "apache2")
end

# Sites
template "#{node[:apache][:dir]}/sites-available/default" do
  source "default-site.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "apache2")
end
template "#{node[:apache][:dir]}/sites-available/default-ssl" do
  source "default-site-ssl.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "apache2")
end
template "#{node[:apache][:dir]}/sites-available/mathaba" do
  source "mathaba.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "apache2")
end


# Mods
["php5", "rpaf", "status"].each do |mod|
  template "#{node[:apache][:dir]}/sites-available/#{mod}.conf" do
    source "mod_#{mod}.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies :restart, resources(:service => "apache2")
  end
end


directory "#{node[:apache][:dir]}/ssl" do
  action :create
  mode 0755
  owner "root"
  group "root"
end
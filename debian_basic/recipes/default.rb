#
# Cookbook Name:: debian_basic
# Recipe:: default
#

template "/etc/apt/sources.list" do
  mode 0644
  variables :code_name => node[:lsb][:codename]
  variables :country_mirror => node[:debian_basic][:country_mirror]
  case node[:platform]
  when "ubuntu"
    source "ubuntu.sources.list.erb"    
  when "debian"
    source "debian.sources.list.erb"
  end
end

execute "Updating system (apt-get update)" do
  command "apt-get update"
end
execute "Upgrading default system (apt-get full-upgrade)" do
  command "apt-get -y full-upgrade"
end

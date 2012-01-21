#
# Cookbook Name:: networking_basic
# Recipe:: default
#
#

case node[:platform]
  when "debian", "ubuntu"
    node[:debian][:install_list].each do |pkg|
      package pkg do
        action :install
        ignore_failure true
    end
  end
  when "rhel", "centos"
    node[:redhat][:install_list].each do |pkg|
      package pkg do
        action :install
        ignore_failure true
    end
  end
end

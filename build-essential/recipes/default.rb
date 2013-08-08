#
# Cookbook Name:: build-essential
# Recipe:: default
#

case node['platform_family']
when "debian"
  %w{build-essential binutils-doc}.each do |pkg|
    package pkg
  end
when "rhel","fedora"
  %w{gcc}.each do |pkg|
    package pkg
  end
end

%w{autoconf flex bison dialog}.each do |pkg|
  package pkg
end

#
# Cookbook Name:: utilities
# Recipe:: default
#
# Copyright 2010, Fred
#
# All rights reserved - Do Not Redistribute
#

case node[:platform]
when "ubuntu","debian"
  node[:packages].each do |pkg|
    package pkg do
      action :install
    end
  end
end
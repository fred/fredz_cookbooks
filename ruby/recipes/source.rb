#
# Cookbook Name:: ruby
# Recipe:: source
#
# Author:: Frederico Araujo (<fred@frederico-araujo.com>)
#
# Copyright 2008-2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "build-essential"

packages = [
  'libssl-dev',
  'libpcrecpp0',
  'libpcre3', 
  'libpcre3-dev', 
  'libssl-dev', 
  'libxml2-dev', 
  'libxml2', 
  'libreadline6-dev',
  'libreadline-dev'
]

packages.each do |pkg|
  package pkg
end

# Install Ruby now, and rubygems afterward
rubygems_version  = node[:ruby][:gem_version]
ruby_version      = node[:ruby][:version]
configure_flags   = node[:ruby][:configure_flags].join(" ")

# Getting this error on this code
# ERROR: Connection refused connecting to ftp.ruby-lang.org:21 for 
#   pub/ruby/1.9/ruby-1.9.1-p430.tar.gz/ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p430.tar.gz,
#   retry 1/5
# remote_file "/tmp/ruby-#{ruby_version}.tar.gz" do
#   source "ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-#{ruby_version}.tar.gz"
#   action :create_if_missing
# end


# bash "compile_ruby_source" do
#   cwd "/tmp"
#   code <<-EOH
#     rm -rf ruby-#{ruby_version}.tar.gz
#     wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-#{ruby_version}.tar.gz
#     tar xpf ruby-#{ruby_version}.tar.gz
#     cd ruby-#{ruby_version}
#     ./configure #{configure_flags}
#     make && make install
#   EOH
# end

# Installs rubygems 1.3.7
# remote_file "/tmp/rubygems-#{rubygems_version}.tgz" do
#   source "http://production.cf.rubygems.org/rubygems/rubygems-#{rubygems_version}.tgz"
#   action :create_if_missing
# end
bash "install_rubygems" do
  cwd "/tmp"
  code <<-EOH
    rm -rf rubygems-#{rubygems_version}.tar.gz
    wget -c http://production.cf.rubygems.org/rubygems/rubygems-#{rubygems_version}.tgz
    tar xpf rubygems-#{rubygems_version}.tgz
    cd rubygems-#{rubygems_version} 
    /usr/local/bin/ruby ./setup.rb
  EOH
end

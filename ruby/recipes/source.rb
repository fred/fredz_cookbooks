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

ruby_version      = node[:ruby][:version]
configure_flags   = node[:ruby][:configure_flags].join(" ")
install_path      = node[:ruby][:install_path]

remote_file "/tmp/ruby-#{ruby_version}.tar.gz" do
  source "ftp://ftp.ruby-lang.org/pub/ruby/#{ruby_version[0..2]}/ruby-#{ruby_version}.tar.gz"
  not_if { ::File.exists?("/tmp/ruby-#{ruby_version}.tar.gz") }
end


bash "Compile Ruby #{ruby_version} from source" do
  cwd "/tmp"
  code <<-EOH
    tar xpf ruby-#{ruby_version}.tar.gz
    cd ruby-#{ruby_version}
    ./configure #{configure_flags}
    make && make install
  EOH
  not_if do
    ::File.exists?("#{install_path}/bin/ruby") &&
    system("#{install_path}/bin/ruby --version | grep -q #{ruby_version.gsub('-','')}")
  end
end

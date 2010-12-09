#
# Author:: Frederico Araujo <fred@frederico-araujo.com>
# Cookbook Name:: rubygems
# Recipe:: default
#
# Copyright 2009-2010, Opscode, Inc.
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

rubygems_version = node[:rubygems][:version]
list = node[:rubygems][:install_list]
opts = node[:rubygems][:extra_opts]


# Installs rubygems from tgz download
remote_file "/tmp/rubygems-#{rubygems_version}.tgz" do
  source "http://production.cf.rubygems.org/rubygems/rubygems-#{rubygems_version}.tgz"
  not_if { ::File.exists?("/tmp/rubygems-#{rubygems_version}.tgz") }
end
bash "Install Rubygems from Source" do
  cwd "/tmp"
  code <<-EOH
    tar xpf rubygems-#{rubygems_version}.tgz
    cd rubygems-#{rubygems_version} 
    ruby ./setup.rb --no-format-executable
  EOH
  not_if do
    system("which gem >> /dev/null") &&
    system("gem --version | grep -q #{rubygems_version}")
  end
end

# Safe slow method. Install each gem one by one.
# if one fails, continue to install next.
list.each do |g|
  execute "gem instal #{g} #{opts}" do
    ignore_failure true
  end
end

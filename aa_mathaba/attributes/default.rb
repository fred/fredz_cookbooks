#
# Cookbook Name:: apache2
# Attributes:: apache
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

# Mathaba setting
# RPAF module
default[:apache][:proxy_ip] = "69.164.197.133"

# Apache Modules: 
default[:apache][:modules] = %w{auth_basic auth_plain alias auth_basic deflate dir env expires}

# Munin settings
default[:munin][:password] = "IRdpZq5l8nEng"
default[:monit][:password] = "IRdpZq5l8nEng"
default[:munin][:plugins] = [
  "apache_accesses", 
  "apache_processes", 
  "apache_volume", 
  "cpu", 
  "df", 
  "df_inode", 
  "entropy", 
  "forks", 
  "fw_conntrack", 
  "fw_forwarded_local", 
  "fw_packets", 
  "if_err_eth0", 
  "if_eth0", 
  "interrupts", 
  "iostat", 
  "irqstats", 
  "load", 
  "memory", 
  "mysql_bytes", 
  "mysql_queries", 
  "mysql_slowqueries", 
  "mysql_threads", 
  "netstat", 
  "open_files", 
  "open_inodes", 
  "processes", 
  "swap", 
  "uptime", 
  "users", 
  "vmstat"
]

case platform
when "redhat","centos","fedora","suse"
  set[:apache][:dir]     = "/etc/httpd"
  set[:apache][:log_dir] = "/var/log/httpd"
  set[:apache][:user]    = "apache"
  set[:apache][:binary]  = "/usr/sbin/httpd"
  set[:apache][:icondir] = "/var/www/icons/"
when "debian","ubuntu"
  set[:apache][:dir]     = "/etc/apache2"
  set[:apache][:log_dir] = "/var/log/apache2"
  set[:apache][:user]    = "www-data"
  set[:apache][:binary]  = "/usr/sbin/apache2"
  set[:apache][:icondir] = "/usr/share/apache2/icons"
else
  set[:apache][:dir]     = "/etc/apache2"
  set[:apache][:log_dir] = "/var/log/apache2"
  set[:apache][:user]    = "www-data"
  set[:apache][:binary]  = "/usr/sbin/apache2"
  set[:apache][:icondir] = "/usr/share/apache2/icons"
end

# General settings
default[:apache][:listen_http] = "80"
default[:apache][:listen_https] = "443"
default[:apache][:contact] = "webmaster@mathaba.net"
default[:apache][:timeout] = 300
default[:apache][:keepalive] = "Off"
default[:apache][:keepaliverequests] = 100
default[:apache][:keepalivetimeout] = 3
default[:apache][:loglevel] = "warn"
default[:apache][:error_log] = "/var/log/apache2/error.log"
default[:apache][:hostname_lookups] = "Off"

# Security
default[:apache][:servertokens] = "Prod"
default[:apache][:serversignature] = "Off"
default[:apache][:traceenable] = "Off"

# Prefork Attributes
default[:apache][:prefork][:startservers] = 12
default[:apache][:prefork][:minspareservers] = 16
default[:apache][:prefork][:maxspareservers] = 24
default[:apache][:prefork][:maxclients] = 64
default[:apache][:prefork][:maxrequestsperchild] = 1000

# Worker Attributes
default[:apache][:worker][:startservers] = 1
default[:apache][:worker][:maxclients] = 80
default[:apache][:worker][:minsparethreads] = 10
default[:apache][:worker][:maxsparethreads] = 20
default[:apache][:worker][:threadsperchild] = 20
default[:apache][:worker][:maxrequestsperchild] = 1000

# Default General settings:
# default[:apache][:listen_ports] = [ "80","443" ]
# default[:apache][:contact] = "ops@example.com"
# default[:apache][:timeout] = 300
# default[:apache][:keepalive] = "On"
# default[:apache][:keepaliverequests] = 100
# default[:apache][:keepalivetimeout] = 5
# 
# # Security
# default[:apache][:servertokens] = "Prod"
# default[:apache][:serversignature] = "On"
# default[:apache][:traceenable] = "On"
# 
# # mod_auth_openids
# default[:apache][:allowed_openids] = Array.new
# 
# # Prefork Attributes
# default[:apache][:prefork][:startservers] = 16
# default[:apache][:prefork][:minspareservers] = 16
# default[:apache][:prefork][:maxspareservers] = 32
# default[:apache][:prefork][:serverlimit] = 400
# default[:apache][:prefork][:maxclients] = 400
# default[:apache][:prefork][:maxrequestsperchild] = 10000
# 
# # Worker Attributes
# default[:apache][:worker][:startservers] = 4
# default[:apache][:worker][:maxclients] = 1024
# default[:apache][:worker][:minsparethreads] = 64
# default[:apache][:worker][:maxsparethreads] = 192
# default[:apache][:worker][:threadsperchild] = 64
# default[:apache][:worker][:maxrequestsperchild] = 0

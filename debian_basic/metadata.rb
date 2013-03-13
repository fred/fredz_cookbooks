maintainer       "fredz"
maintainer_email "fred.the.master@gmail.com"
license          "Apache 2.0"
description      "Boostrap a Debian and Ubuntu Servers with base /etc/apt/sources.list and run full-upgrade"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.3"

%w{ ubuntu debian }.each do |os|
  supports os
end

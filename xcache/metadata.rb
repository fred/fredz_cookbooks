maintainer       "Frederico Araujo"
maintainer_email "fred.the.master@gmail.com"
license          "All rights reserved"
description      "Installs and Configures xcache for debian and ubuntu"
version          "0.0.3"


%w{ ubuntu debian}.each do |os|
  supports os
end

attribute "mem_size",
  :display_name => "Xcache Memory",
  :description => "Xcache Memory",
  :type => "string",
  :default => "16M"

attribute "cpu_count",
  :display_name => "Cpu Count",
  :description => "Cpu Count",
  :type => "string",
  :default => "1"

attribute "slots",
  :display_name => "Variables Slots count",
  :description => "Variables Slots count",
  :type => "string",
  :default => "16K"

attribute "var_size",
  :display_name => "Variables Memory Size",
  :description => "Variables Memory Size",
  :type => "string",
  :default => "8M"

attribute "var_count",
  :display_name => "Variables Count",
  :description => "Variables Count",
  :type => "string",
  :default => "1"
  
attribute "var_slots",
  :display_name => "Variable Slots",
  :description => "Variables Slots",
  :type => "string",
  :default => "8K"

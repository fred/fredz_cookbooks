maintainer        "Frederico Araujo,"
maintainer_email  "fred@frederico-araujo.com"
license           "Apache 2.0"
description       "Installs ruby packages from bin deb. or source"
version           "0.9.0"

recipe "ruby", "Installs ruby bin deb. packages"
recipe "ruby::source", "Installs ruby from source"

%w{ ubuntu debian}.each do |os|
  supports os
end

attribute "ruby/version",
  :display_name => "Ruby Version",
  :description => "Main Ruby Version, including patch version. ie. 1.9.1-p430",
  :default => "1.9.1-p430"

attribute "ruby/gem_version",
  :display_name => "RubyGem Version",
  :description => "Rubygems version to download and install",
  :default => "1.3.7"

attribute "ruby/install_path",
  :display_name => "Installation Path",
  :description => "Location to install ruby from source",
  :default => "/usr/local"

attribute "ruby/configure_flags",
  :display_name => "Configure Flags",
  :description => "Configure Flags",
  :default => [
    "--prefix=[install_path]",
    "--enable-shared"
  ]
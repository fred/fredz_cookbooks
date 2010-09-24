# default[:ruby][:version]        = "1.9.2-p0"
default[:ruby][:version]          = "1.9.1-p430"
default[:ruby][:gem_version]      = "1.3.7"
default[:ruby][:install_path]     = "/usr/local"
default[:ruby][:configure_flags]  = [
  "--prefix=#{ruby[:install_path]}",
  "--enable-shared"
]

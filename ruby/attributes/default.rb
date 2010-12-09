default[:ruby][:version]          = "1.9.2-p0"
default[:ruby][:install_path]     = "/usr/local"
default[:ruby][:configure_flags]  = [
  "--prefix=#{ruby[install_path]}",
  "--enable-shared"
]

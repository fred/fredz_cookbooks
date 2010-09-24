users Mash.new unless attribute?("users")
groups Mash.new unless attribute?("groups")
ssh_keys Mash.new unless attribute?("ssh_keys")

groups[:admin] = {:gid => 7000}

# passwords must be in shadow password format with a salt. To generate: openssl passwd -1

users[:fred] = {:password => "$1$pvqmmeHj$xWFkSlTnOvbId/NK8dkxf0", :comment => "Fred", :uid => 7001, :group => :admin}
ssh_keys[:fred] = "key data"

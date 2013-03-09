cwd=$(cd $(dirname $0)/..;pwd)
cd $cwd

cat << EOF | sudo tee /tmp/solo.rb > /dev/null
file_cache_path "/tmp/chef-solo"
cookbook_path ["$cwd/chef-repo/site-cookbooks", "$cwd/chef-repo/cookbooks"]
role_path "$cwd/chef-repo/roles"
EOF
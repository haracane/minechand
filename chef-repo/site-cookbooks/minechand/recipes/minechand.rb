include_recipe "minechand::minechan"

user "minechan" do
  shell "/bin/bash"
end

[
  "etc/init.d/minechand"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
    variables(node[:variables])
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0755"
  end
end


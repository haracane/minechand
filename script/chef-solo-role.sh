cwd=$(cd $(dirname $0)/..; pwd)
cd $cwd

while true; do
  if [ "$1" = --list ]; then
    for role in $(cd $cwd/chef-repo/roles; ls | sed "s/\\.json\$//g"); do
      echo $role
    done
    exit 0
  else
    break
  fi
done

role=$1

sh ./script/update-chef.sh
if [ $? != 0 ]; then exit 1; fi

role_path=/var/chef-repo/roles/$role.json

if [ ! -f $role_path ]; then
  echo "(ERROR) $role_path does not exist"
  exit 1
fi

sudo chef-solo -c /tmp/solo.rb -j $role_path
if [ $? != 0 ]; then exit 1; fi

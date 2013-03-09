source $(dirname $0)/../conf/minechand-env.sh

while true; do
  if [ "$1" = --pid-path ]; then
    pid_path_option="$1 $2"
    shift 2
  else
    break
  fi
done

irc_channels_option=""

url="$REDMINE_URL/projects.json?key=$REDMINE_API_KEY"

project_json=$(curl -L $url)

for id_identifier in $(
  $PERL_CMD $SCRIPT_DIR/list-redmine-project-jsons.pl "$project_json" \
    | $PERL_CMD -MJSON -pe '$_=decode_json($_);$_=$_->{id}."/".$_->{identifier}."\n"'
  ); do
  id=${id_identifier%/*}
  identifier=${id_identifier#*/}
  irc_channels_option="$irc_channels_option --irc-channels {\"#$identifier\"=>{project_id=>$id}}"
done

$PERL_CMD -I$LIB_DIR/Redmine-Chan/lib $SCRIPT_DIR/minechan.pl \
  $pid_path_option $irc_channels_option \
  --redmine-url $REDMINE_URL --redmine-api-key $REDMINE_API_KEY

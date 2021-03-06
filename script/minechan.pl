use strict;
use warnings;
use utf8;
use Redmine::Chan;

my %params = (
  irc_server => "localhost",
  irc_port => 6667,
  irc_password => "",
  redmine_url => "http://localhost/alminium/"
);

my %irc_channels = ();

while(0 < @ARGV) {
  if ( $ARGV[0] eq "--irc-host" || $ARGV[0] eq "--irc-server" ) {
    shift(@ARGV);
    $params{irc_server} = shift(@ARGV);
  } elsif ( $ARGV[0] eq "--irc-port" ) {
    shift(@ARGV);
    $params{irc_port} = shift(@ARGV);
  } elsif ( $ARGV[0] eq "--irc-password" ) {
    shift(@ARGV);
    $params{irc_password} = shift(@ARGV);
  } elsif ( $ARGV[0] eq "--irc-channels" ) {
    shift(@ARGV);
    my $arg_irc_channels = eval(shift(@ARGV));
    while ( my ($key, $val) = each(%$arg_irc_channels) ){
      $val->{key} ||= "";
      $val->{charset} ||= "iso-2022-jp";
      $irc_channels{$key} = $val;
    }    
  } elsif ( $ARGV[0] eq "--pid-path" ) {
    shift(@ARGV);
    my $pid_path = shift(@ARGV);
    open(FILE, ">$pid_path");
    print FILE $$, "\n";
    close(FILE);
  } elsif ( $ARGV[0] eq "--redmine-url" ) {
    shift(@ARGV);
    $params{redmine_url} = shift(@ARGV);
  } elsif ( $ARGV[0] eq "--redmine-api-key" ) {
    shift(@ARGV);
    $params{redmine_api_key} = shift(@ARGV);
  } else {
    shift(@ARGV)
  }
}

print STDERR "IRC Server: ", $params{irc_server}, "\n";
print STDERR "IRC Port: ", $params{irc_port}, "\n";

while ( my ($key, $val) = each(%irc_channels) ){
  $val->{key} ||= "";
  $val->{charset} ||= "iso-2022-jp";
  $irc_channels{$key} = $val;
  print STDERR "IRC Channel: ", $key, "\n";
}

if($params{redmine_url} !~ /\/$/) {
  $params{redmine_url} .= "/";
}

print STDERR "Redmine URL: ", $params{redmine_url}, "\n";

$params{irc_channels} = \%irc_channels;

my $minechan = Redmine::Chan->new(%params);
$minechan->cook;

# - $uri->path("/issues/$issue->{id}");
# + $uri->path($uri->path . "issues/$issue->{id}");

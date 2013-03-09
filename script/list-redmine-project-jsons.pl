use strict;
use warnings;
use utf8;
use feature ':5.10';
use JSON qw/encode_json decode_json/;

my $projects_json = decode_json($ARGV[0]);

my $projects = $projects_json->{projects};

say(encode_json($_)) for @$projects;

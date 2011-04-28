use 5.010;
use strict;
use warnings;
use lib 'lib';
use Autologout qw/schema/;
use autodie;

my $rs = Autologout::schema()->resultset('Site');
open my $in, '<:encoding(UTF-8)', 'data/working.csv';
while (<$in>) {
    chomp;
    my ($site_name, $logout_url) = split /,/, $_, 2;
    $logout_url =~ m{^(https?://[^/]+(?:/|$))};
    my $site_url = $1;
    $rs->create({
            site_name   => $site_name,
            site_url    => $site_url,
            logout_url  => $logout_url,
            protected   => 0,
            approved    => 1,
            votes_yes   => 1,
    });
}
close $in;
open $in, '<:encoding(UTF-8)', 'data/protected.csv';
while (<$in>) {
    chomp;
    my ($name, $url) = split /,/;
    $rs->create({
            site_name   => $name,
            site_url    => $url,
            protected   => 1,
            approved    => 1,
    });
}


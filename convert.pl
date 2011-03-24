#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
use autodie;
binmode STDOUT, ':encoding(UTF-8)';
use utf8;

use HTML::Template::Compiled;
my $t = HTML::Template::Compiled->new(
    filename    => 'template/all.html',
    open_mode   => ':encoding(UTF-8)',
);

my @working;
open my $in, '<:encoding(UTF-8)', 'data/working.csv';
while (<$in>) {
    # TODO: use Text::CSV when necessary
    my ($site, $csrf_url) = split /,/, $_, 2;
    push @working, { site => $site, csrf_url => $csrf_url };
}
close $in;
$t->param(working => \@working);

open my $out, '>:encoding(UTF-8)', 'output/all.html';
# autodie can't handle print() :-(
print { $out } $t->output or die "Can't write to output file: $!";
close $out;

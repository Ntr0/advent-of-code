#!/usr/bin/env perl
use strict;
use warnings;

use File::Basename;
use lib dirname(__FILE__);
use day3;

open(INPUT, "<input.txt") or die "Couldn't open file";

my $content = "";
while (<INPUT>) {
    $content .= $_;
}
print(day3::Part1($content) . "\n");
print(day3::Part2($content) . "\n");

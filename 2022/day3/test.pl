#!/usr/bin/env perl
use strict;
use warnings;

use Test::Simple tests => 2;
use File::Basename;
use lib dirname(__FILE__);
use day3;

my $input = "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
";

my $got = day3::Part1($input);
ok($got == 157, "got $got, want 157");

ok(day3::Part2($input) == 70);
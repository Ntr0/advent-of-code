#!/usr/bin/env perl

use strict;
use warnings;
use POSIX;

package day3;

sub toPriorityScore {
    my $m = shift;
    if ($m =~ /[A-Z]/) {
        return ord($m) - 38;
    }
    else {
        return ord($m) - 96;
    }
}

sub Part1 {
    my $input = shift;
    my $sum = 0;
    for my $line (split(/\n/, $input)) {
        if ($line eq "") {
            last;
        }
        my $len = POSIX::ceil(length($line) / 2);
        my ($re) = $line =~ qr/(\w{$len})/;
        $line = substr($line, $len, length($line) - $len);
        my $pat = "([$re])";
        my @matches = $line =~ m/$pat/g;
        my %got;
        for my $m (@matches) {
            if (!exists $got{$m}) {
                $sum += toPriorityScore($m);
                $got{$m} = 1;
            }
        }
        print "$line: got " . join(",", @matches) . " with $pat => $sum\n";
    }
    return $sum;
}

sub Part2 {
    my $input = shift;
    my $sum = 0;
    my @lines = split(/\n/, $input);
    while (@lines) {
        my $re = "(.*)";
        for (my $i = 0; $i < 3; $i++) {
            my $line = shift(@lines);
            my $newRe = "";
            for my $m ($line =~ m/$re/g) {
                $newRe .= $m;
            }
            $re = "([$newRe])";
        }
        $sum += toPriorityScore(substr($re, 2, 1));
    }
    return $sum;
}
1;
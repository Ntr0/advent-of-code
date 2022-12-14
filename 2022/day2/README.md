# Advent of Code 2022 - Day 2 - Rockstar

Solution for [Day2](https://adventofcode.com/2022/day/2)

I decided to try a very interesting esoteric language: [Rockstar](https://github.com/RockstarLang/rockstar).

I heard of this first [here](https://youtu.be/6avJHaC3C2U?t=3179) and found it interesting :)

## Make it run

You'll need a rockstar transpiler. I tried rockstar-py first, but it was a waste of time as the transpiler was not 
up-to-date. I had more luck with the excellent Java implementation [rocky](https://github.com/gaborsch/rocky).
Just clone the repo and call the binary that is included there directly. Or use the installer if you plan to become
a full-time Rockstar developer. 

## How was the experience?

The algorithm was trivial, but the language was not. There are some missing features as it seems, e.g.
`Cast` or `Burn` can either parse a number from a string into a number, e.g. "123.45" becomes `123.45`, or 
cast a number into a character, e.g. `65` becomes "A", but getting the char code of a 
character is not possible. 

But the main part of the implementation I spend with refactoring. Once the algorithm worked, I could not
leave this without proper lyrics.
# Advent of Code 2022 - Day 4 - Prolog

Solution for [Day2](https://adventofcode.com/2022/day/4)

I created only one prolog program in 2005/2006 or so. It was a sudoku solver in a small number of lines. I found
it interesting, but did never manage to get back at it.

## How was it?

The first steps where easy (at least I thought so). Getting the task1 predicate was done fast (fun fact: 
greater or equal operator is `>=` but lesser or equal is `=>`), but understanding
how files are read took more time. How to read files completely even more :).

Eventually the test input was processed correctly, so I ran `solve("input.txt",N).`
which of course gave me a wrong result. Figuring out which result did not match was quite painful and 
probably could have been done in a better way, but eventually I found a problematic line: "20-20,20-20", 
which was counted twice. 
Then I learned about the [cut operator](https://cs.union.edu/~striegnk/learn-prolog-now/html/node88.html#sec.l10.cut). 

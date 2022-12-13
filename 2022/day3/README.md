# Advent of Code 2022 - Day 3 - Perl

So initially I thought about learning and then doing some nasty stuff with perl regexes.
Unfortunately I'm still far behind (it's the 10th already), so I'll just go with perl and simple
regex solution for this one, to get it of the plate.

## How did it went?

So, the last valid Perl I wrote was more than 7 years ago, and it showed :).
Furthermore, the regexes did not work as I remembered, so I had to change my initial idea.
Initially I wanted to capture the first half of the string, modify it and capture only matching
characters from the last string with a single regex. So the regex would have been composed of these parts:

1. First half of the string
2. Non-capturing group
2.1 Negated character class of 1. or
2.2 Capture Group with character class of 1.
2.3 repeat

Example for line abaxyzab:

```perl5regexp
/^abax(?:[^abax]|([abax]))*$/
```

So this did not play out, but I did not want to spend too much time here on research :)

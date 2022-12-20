# Advent of Code 2022 - Day 5 - Ballerina

Solution for [Day2](https://adventofcode.com/2022/day/5)

I heard of Ballerina at an Open Stack Summit some years ago. While the abstraction layer ballerina provides
is certainly of interest, I still wasn't hooked up, as it was Java at the end :)

So, I thought it would make totally sense, to create a ridiculous microservice architecture to solve day 5 with
ballerina.

## How to exec

Get ballerina, then 

```bash
cd day5/SolvingService
bal run CrateService &
bal run RepositoryService &
bal run MainService &
curl -X POST localhost:8080/solve?preserve=true --data-binary @../test.txt
```

## How was it?

First thing that hit me, is that naming of RPCs is limited by the ballerina compiler. E.g. do not name
an RPC "init", as this is a protected function. OOP ftw. 

Next issue is the (grpc) code generator that also has some limited capabilities. It will always create 2 files, 
overwriting the existing ones. This could be ok, but the code of the stub is not working out of the box. 
So if you want to use that, you'll move it, otherwise you delete it as it interferes with existing code.

They have a funny range operator: `..<`. 

I do not like that there is no simple for(init;cond;exec). 

I did like that the service creation was really simple. Also, there is some cloud integration, so I could theoretically 
get some k8s artifacts to deploy the stuff directly. Which is also great. 
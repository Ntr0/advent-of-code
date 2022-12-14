#!/bin/sh
#
length=$1

sqlite-utils memory input.tsv "
	with recursive split(char, pos, rest) AS (
		values ('', 0, (
			select data from input where id == 1)
		) 
		union all 
		select 
			substr(rest,1,1), 
			(select length(data) from input where id == 1) - length(substr(rest,2)),
			substr(rest,2) 
		from split 
		where rest <> '' 
	), 
	positions(char, pos, distance) as (
		select 
			a.char, 
			a.pos, 
			b.pos - a.pos
		from split as a 
		join split as b 
		on
			a.char = b.char
		where 	
		b.pos = (select min(c.pos) from split as c where c.pos > a.pos and c.char == a.char)
		)
		select min(startpos)
    from (
      select
        a.pos,
        count(*) as cnt,
        a.distance,
        a.pos + $length - 1 as startpos
      from positions as a
      join positions b on
        a.pos + $length > b.pos and
        b.distance + b.pos > a.pos + $length - 1 and
        a.pos <= b.pos and
        b.char <> ''
      where a.distance >= $length
      group by a.pos
    )
    where cnt == $length
"
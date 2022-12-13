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
			length(substr(rest,2)), 
			substr(rest,2) 
		from split 
		where rest <> '' 
	), 
	positions(char, pos) as (
		select 
			a.char, a.pos 
		from split as a 
		where 
			a.pos - $length > (
	       			select 
					max(b.pos) 
				from split as b 
				where a.char = b.char and a.pos > b.pos
			) or 
			0 = ( 
				select count(*) 
				from split b 
				where b.char = a.char and b.pos < a.pos
			) 
	)  
	select min(startpos)
	from (
		select 
			a.pos, 
			count(*) as cnt, 
			length(input.data) - a.pos - 1 + count(*) as startpos 
		from positions as a 
		join positions b on 
			a.pos - $length < b.pos and 
			a.pos >= b.pos and 
			b.char <> '' 
		join input on ID == 1 
		group by a.pos 
		) 
	where cnt == $length;" 

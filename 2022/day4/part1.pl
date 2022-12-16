%% Yey prolog

contains(A,B,X,Y) :-
	(A > X , B < Y) ; (A < X , B > Y).


set_pair([A,B,X,Y]):-
	pair(A,B,X,Y).

%% Copy Pasta'n'adopt Stack Overflow	
getLines(file):-
	setup_call_cleanup(
		open(file, read, In),
		readData(In),
		close(In)
	).

readData(In):-
	read_term(In, Term, []),
	(	Term == end_of_file
	-> true 
	;	split_string(Term,"-",",",L), set_pair(L)
	).

%% End Copy Pasta
%


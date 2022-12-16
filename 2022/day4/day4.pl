%% Correct answer is 511.
task1([A,B,X,Y]):-
    pair([A,B],[X,Y]),
    number_string(NA,A),
    number_string(NB,B),
    number_string(NX,X),
    number_string(NY,Y),
    contains(NA,NB,NX,NY).


contains(NA,NB,NX,NY):-
        (
            NA =< NX,
            NB >= NY,
            !
        );(
            NX =< NA,
            NY >= NB
        ).


set_pair([A,B]):-
    split_string(A,"-","",AS),
    split_string(B,"-","",BS),
    asserta(pair(AS,BS)).

read_lines(In):-
    read_line_to_string(In,Line),
    (
        at_end_of_stream(In) -> true;
            split_string(Line,",","",L),
            set_pair(L),
            read_lines(In)
    ).

read_file(File):-
    setup_call_cleanup(
        open(File, read, In),
        read_lines(In),
        close(In)
    ).

solve(File, N):-
    read_file(File),
    aggregate_all(count,task1([A,B,C,D]),N).
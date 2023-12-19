maxuniq(Lst, Max) :-
    findall(Part, partition(Lst, Part), Partitions),
    max_unique_sublists(Partitions, 0, Max).

max_unique_sublists([], Max, Max).
max_unique_sublists([P|Ps], CurrentMax, Max) :-
    (unique_sublists(P), length(P, L), L > CurrentMax ->
        max_unique_sublists(Ps, L, Max)
    ;
        max_unique_sublists(Ps, CurrentMax, Max)
    ).

unique_sublists(Partition) :-
    sort(Partition, Sorted),
    length(Partition, Len),
    length(Sorted, Len).

partition([], []).
partition([H|T], [[H|Sublist]|Rest]) :-
    append(Sublist, Remaining, T),
    partition(Remaining, Rest).
partition([H|T], [[H]|Rest]) :-
maxuniq(Lst, Max) :-
    maxuniq_helper(Lst, [], 0, Max).

maxuniq_helper([], _, Max, Max).
maxuniq_helper(RemainingList, CurrentPartition, CurrentMax, Max) :-
    append(Sublist, Rest, RemainingList),
    Sublist \= [],
    \+ member(Sublist, CurrentPartition),
    length([Sublist|CurrentPartition], NewLength),
    NewMax is max(NewLength, CurrentMax),
    maxuniq_helper(Rest, [Sublist|CurrentPartition], NewMax, Max).

max(X, Y, X) :- X >= Y, !.
max(_, Y, Y).

repeat3(Lst, X) :-
    sublist(X, Lst),
    X \= [],
    count_occurrences(Lst, X, 0, 3).

count_occurrences([], _, Count, Count).
count_occurrences(Lst, X, Acc, Count) :-
    append(X, Rest, Lst),
    !,
    NewAcc is Acc + 1,
    count_occurrences(Rest, X, NewAcc, Count).
count_occurrences([_|T], X, Acc, Count) :-
    count_occurrences(T, X, Acc, Count).

sublist(SubLst, Lst) :-
    append(_, Rest, Lst),
    append(SubLst, _, Rest).
repeat3(Lst, X) :-
    append([_, X, Rest], Lst),
    X \= [],
    append([_, X, Rest2], Rest),
    append([_, X, _], Rest2).

non_empty_unique(Prefix, X, Middle, Suffix) :-
    X \= [],
    \+ sublist(X, Prefix),
    \+ sublist(X, Middle),
    \+ sublist(X, Suffix).

sublist(Sub, List) :-
    append([_, Sub, _], List).
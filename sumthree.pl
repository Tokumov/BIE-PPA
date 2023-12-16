sumThree(Values, K) :-
    select(X, Values, Rest1),
    select(Y, Rest1, Rest2),
    select(Z, Rest2, _),
    K is X + Y + Z.
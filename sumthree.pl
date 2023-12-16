sumThree(Values, K) :-
    member(X, Values),
    member(Y, Values),
    member(Z, Values),
    X \= Y, Y \= Z, X \= Z,
    K is X + Y + Z.
numbers(Lst, Target) :-
    member(Target, Lst);
    select(X, Lst, Rest),
    numbers(Rest, Y),
    (
        (Target is X + Y);
        (Target is X - Y, Target > 0);
        (Target is Y - X, Target > 0);
        (Target is X * Y);
        (X mod Y =:= 0, Target is X // Y);
        (Y mod X =:= 0, Target is Y // X)
    ).

numbers([], _) :- fail.
less_than(_, empty).
less_than(Value, btree(V, L, R)) :-
    V < Value,
    less_than(Value, L),
    less_than(Value, R).

greater_than(_, empty).
greater_than(Value, btree(V, L, R)) :-
    V > Value,
    greater_than(Value, L),
    greater_than(Value, R).

isBst(empty).
isBst(btree(V, L, R)) :-
    less_than(V, L),
    greater_than(V, R),
    isBst(L),
    isBst(R).

isBst(_) :- false.
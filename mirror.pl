mirror(empty, empty).

mirror(btree(V, L1, R1), btree(V, L2, R2)) :-
    mirror(L1, R2),
    mirror(R1, L2).

mirror(_, _) :-
    false.
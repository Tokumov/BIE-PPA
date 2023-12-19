maxuniq(Seq, Result) :-
    findall(SubSeq, divide(Seq, SubSeq), AllSubSeqs),
    searchMaxDistinctSubSeqs(AllSubSeqs, 0, Result).
searchMaxDistinctSubSeqs([], MaxLen, MaxLen).
searchMaxDistinctSubSeqs([First|Rest], CurrMaxLen, MaxLen) :-
    length(First, Len),
    (checkDistinct(First) -> 
        (Len > CurrMaxLen -> UpdatedMaxLen = Len; UpdatedMaxLen = CurrMaxLen)
    ; UpdatedMaxLen = CurrMaxLen),
    searchMaxDistinctSubSeqs(Rest, UpdatedMaxLen, MaxLen).
checkDistinct(Seq) :-
    sort(Seq, SortedSeq),
    length(Seq, OrigLen),
    length(SortedSeq, SortedLen),
    OrigLen == SortedLen.
divide([], []).
divide([Head|Tail], [[Head|Tail2]|Other]) :-
    append(Tail2, Remain, Tail),
    divide(Remain, Other).
divide([Head|Tail], [[Head]|Other]) :-
    divide(Tail, Other).

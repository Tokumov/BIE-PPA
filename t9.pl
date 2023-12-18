digit_to_let(2, [a,b,c]).
digit_to_let(3, [d,e,f]).
digit_to_let(4, [g,h,i]).
digit_to_let(5, [j,k,l]).
digit_to_let(6, [m,n,o]).
digit_to_let(7, [p,q,r,s]).
digit_to_let(8, [t,u,v]).
digit_to_let(9, [w,x,y,z]).

t9(Number, Word) :-
    number_codes(Number, Digits),
    maplist(digit_to_let, Digits, Word).

digit_to_letter(DigitCode, Letter) :-
    CodeOffset is DigitCode - 48,
    digit_to_let(CodeOffset, Letters),
    member(Letter, Letters).

t9(Number, _) :-
    (Number == 0; Number == 1),
    !, fail.
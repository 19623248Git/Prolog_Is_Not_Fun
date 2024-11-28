/* Bagian 1 */

/* Deklarasi Fakta */

/* Pria */
pria(qika).
pria(shelby).
pria(barok).
pria(francesco).
pria(panji).
pria(eriq).

/* Wanita */
wanita(hinatsuru).
wanita(suma).
wanita(yennefer).
wanita(makio).
wanita(roxy).
wanita(suzy).
wanita(eve).
wanita(frieren).
wanita(aqua).
wanita(ruby).
wanita(aihoshino).

/* Usia */
usia(qika, 109).
usia(hinatsuru, 105).
usia(suma, 86).
usia(yennefer, 61).
usia(shelby, 42).
usia(makio, 96).
usia(barok, 59).
usia(roxy, 70).
usia(suzy, 23).
usia(francesco, 25).
usia(eve, 5).
usia(panji, 124).
usia(frieren, 90).
usia(aqua, 66).
usia(ruby, 63).
usia(eriq, 69).
usia(aihoshino, 48).

/* Anak */
anak(yennefer, qika).
anak(yennefer, hinatsuru).
anak(shelby, qika).
anak(shelby, hinatsuru).
anak(barok, makio).
anak(barok, qika).
anak(suzy, roxy).
anak(suzy, barok).
anak(eve, francesco).
anak(eve, suzy).
anak(aqua, panji).
anak(aqua, frieren).
anak(ruby, panji).
anak(ruby, frieren).
anak(aihoshino, ruby).
anak(aihoshino, eriq).

/* Menikah */
menikah(suma,qika).
menikah(qika,suma).
menikah(qika, hinatsuru).
menikah(hinatsuru, qika).
menikah(qika, makio).
menikah(makio, qika).
menikah(roxy, barok).
menikah(barok, roxy).
menikah(francesco, suzy).
menikah(suzy, francesco).
menikah(panji, frieren).
menikah(frieren, panji).
menikah(ruby, eriq).
menikah(eriq, ruby).


/* Deklarasi Rules */
saudara(X,Y) :- anak(X,Z), anak(Y,Z), X\=Y.

saudaratiri(X,Y) :-  
    anak(X,Z), anak(Y,Z),
    X\=Y,
    anak(X,A), anak(Y,B),
    Z\=A, Z\=B,
    A\=B.

kakak(X,Y) :- 
    usia(X,A), usia(Y,B), 
    A>B, 
    saudara(X,Y).

keponakan(X,Y) :- anak(X,Z), saudara(Z,Y).

mertua(X,Y) :- menikah(Y,Z), anak(Z,X).

nenek(X,Y) :- wanita(X), anak(Z,X), anak(Y,Z).

keturunan(X,Y) :- anak(X,Y).
keturunan(X,Y) :- anak(X,Z), keturunan(Z,Y).

lajang(X) :- (pria(X); wanita(X)), \+ menikah(X, _). 

anakbungsu(X) :-
    anak(X, Parent),           
    usia(X, UsiaX),            
    \+ (
        anak(Y, Parent),       
        Y \= X,                
        usia(Y, UsiaY),        
        UsiaY < UsiaX          
    ).

anaksulung(X) :-
    anak(X, Parent),
    usia(X, UsiaX),
    \+ (
        anak(Y,Parent),
        Y \= X,
        usia(Y,UsiaY),
        UsiaY > UsiaX
    ).

yatimpiatu(X) :- (pria(X); wanita(X)), \+ anak(X,_).



/* Bagian 2 */

/* Soal 1 */
/* Deklarasi Fakta */
exponent(_, 0, 1).

/* Deklarasi Rules */
exponent(A, B, X) :- 
    B > 0,
    B1 is B - 1,
    exponent(A, B1, X1),
    X is A * X1.


/* Soal 2 */
/* Deklarasi Rules */
is_divisible(N, D) :-
    D * D =< N,         
    N mod D =:= 0.  

is_divisible(N, D) :-
    D * D =< N,
    D1 is D + 1,             
    is_divisible(N, D1).

is_prime(1) :- !, fail.
is_prime(2) :- !.
is_prime(X) :- X > 2, \+ is_divisible(X, 2).

growth(I,_,_,0,X) :- X is I.
growth(I, G, H, T, X) :- 
    T > 0,
    T1 is T - 1,
    growth(I, G, H, T1, X1),
    (is_prime(T) -> X is X1 + G; X is X1 - H).

/* Soal 3 */
/* Deklarasi Fakta */
harvestFruits(_, Fruits, _, FinalFruits) :-
    Fruits =< 0,
    write('Si Imut pulang sambil menangis :('), nl,
    FinalFruits is 0,
    !.

harvestFruits(N, Fruits, TreeNumber, FinalFruits) :-
    % write(TreeNumber), nl,
    % write(N =< TreeNumber), nl,
    N < TreeNumber,
    % write(N), nl,
    % write('Si Imut Menang???'), nl,
    FinalFruits is Fruits,
    !.


/* Deklarasi Rules */
harvestFruits(N, Fruits, TreeNumber, FinalFruits) :-
    (0 is TreeNumber mod 3 -> Fruits1 is Fruits + 2 ; Fruits1 is Fruits),
    (0 is TreeNumber mod 4 -> Fruits2 is Fruits1 - 5 ; Fruits2 is Fruits1),
    (0 is TreeNumber mod 5 -> Fruits3 is Fruits2 + 3 ; Fruits3 is Fruits2),
    (is_prime(TreeNumber) -> Fruits4 is Fruits3 - 10 ; Fruits4 is Fruits3),
    NextTreeNumber is TreeNumber + 1,
    harvestFruits(N, Fruits4, NextTreeNumber, FinalFruits).

/* Soal 4 */
/* Deklarasi Fakta */

/* Deklarasi Rules */
fpb(A, 0, X) :-
    X is A, 
    !.
fpb(A, B, X) :- 
    B > 0, 
    A1 is A mod B, 
    fpb(B, A1, X).

kpk(A, B, X) :- 
    fpb(A, B, FPB), 
    X is (A * B) / FPB.

/* Soal 5 */
/* Deklarasi Fakta */
factorial(0, 1) :- !.

/* Deklarasi Rules */
factorial(N, X) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, X1),
    X is N * X1.

/* Soal 6 */
/* Deklarasi Fakta */

/* Deklarasi Rules */
printRow(_, _, _, -1) :- !.
/* menggunakan concentric distance */
printRow(N, Curr, Size, Y) :-
    Min is min(N, Y),
    NewComp is Size - 1 - N,
    Min2 is min(NewComp, Min),
    NewComp2 is Size - 1 - Y,
    Min3 is min(NewComp2, Min2),
    Min4 is Min3 + 1,
    write(Min4),
    NewCurr is Curr + 1, 
    NewY is Y - 1,
    printRow(N, NewCurr, Size, NewY).


printRows(0, _) :- !.
printRows(N, J) :-
    printRow(N-1, 1, J, J-1),
    nl, 
    NewN is N - 1,
    printRows(NewN, J).


makePattern(0) :- !.
makePattern(X) :-
    printRows(X, X).


/* Bagian 3 */
/* Soal 1*/
/* Deklarasi Fakta */

/* Deklarasi Rules */
min([X],X) :- !.
min([Head|Tail],Min):-
    min(Tail,Min1),
    Min1 < Head -> Min is Min1; Min is Head.

max([X],X) :- !.
max([Head|Tail],Min):-
    max(Tail,Min1),
    Min1 > Head -> Min is Min1; Min is Head.

range(List,Range) :-
    min(List,Min),
    max(List,Max),
    Range is Max - Min. 

count([_],1) :- !.
count([_|Tail],Count):-
    count(Tail,Count1),
    Count is Count1 + 1.

sum([],0) :- !.
sum([Head|Tail],Sum):-
    sum(Tail,Sum1),
    Sum is Sum1 + Head.

/* Soal 2.a */
/* Deklarasi Fakta */
mergeSort([],[X],[X]) :- !.
mergeSort([X],[],[X]) :- !.
/* Deklarasi Rules */
mergeSort([Head1|Tail1],[Head2|Tail2],Result) :- 
    Head1 < Head2 -> 
    mergeSort(Tail1,[Head2|Tail2],Result1),
    Result = [Head1|Result1];
    mergeSort([Head1|Tail1],Tail2,Result1),
    Result = [Head2|Result1].

/* Soal 2.b */
/* Deklarasi Fakta */
filterArray([],_,_,[]) :- !.
/* Deklarasi Rules */
filterArray([Head|Tail],Elmt1,Elmt2,Result) :-
    (Head > Elmt1, 0 is Head mod Elmt2) -> 
    filterArray(Tail,Elmt1,Elmt2,Result1),
    Result = [Head|Result1];
    filterArray(Tail,Elmt1,Elmt2,Result1),
    Result = Result1.

/* Soal 2.c */
/* Deklarasi Fakta */
reverse([],[]) :- !.
/* Deklarasi Rules */
reverse([Head|Tail],Reverse) :-
    reverse(Tail,Reverse1),
    Reverse = [Head|Reverse1].

/* Soal 2.d */
/* Deklarasi Fakta */

/* Deklarasi Rules */
is_palindrom([],[]) :- !.
is_palindrom([Head1|Tail1],[Head2|Tail2]) :-
    Head1 = Head2,
    is_palindrom(Tail1,Tail2).
cekPalindrom(List) :-
    reverse(List, List2),
    is_palindrom(List,List2).

/* Soal 2.e */
/* Deklarasi Fakta */

/* Deklarasi Rules */
myAppend([],List,List) :- !.
myAppend([Head|Tail],List,Result) :-
    myAppend(Tail,List,Result1),
    Result = [Head|Result1].

rotate_list(Result,0,Result) :- !.
rotate_list([Head|Tail], N, Result) :-
    N > 0,
    N1 is N - 1,
    myAppend(Tail,[Head],Result1),
    rotate_list(Result1,N1,Result).

rotate([], _, []) :- !.
rotate(List, N, Result) :- 
    count(List, Count),
    N1 is N mod Count,
    rotate_list(List, N1, Result).


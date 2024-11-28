/*Untuk File .pl*/

/* Bagian <2> */
/* Deklarasi Fakta */

/*=================*/
/*        2        */
/* SOAL GROWTH */
/* Deklarasi Rules */

has_divisor(N, D) :-
    D * D =< N,         
    N mod D =:= 0.  

has_divisor(N, D) :-
    D * D =< N,
    D1 is D + 1,             
    has_divisor(N, D1).

% cek bilangan prima
is_prime(1) :- !, fail.
is_prime(2) :- !.
is_prime(X) :- X > 2, \+ has_divisor(X, 2).

growth(I, _, _, 0, I) :- !.  

growth(I, G, H, T, X) :-
    T > 0, 
    T1 is T - 1, 
    growth(I, G, H, T1, X1),
    (is_prime(T) -> X is X1 + G; X is X1 - H).

/* ==============*/
/* SOAL SI IMUT */
/*        3        */
/* Deklarasi Rules */
% ['bagian2.pl'].

/* Kasus: Buah habis atau kurang */
harvestFruits(_, Fruits, _, FinalFruits) :-
    Fruits =< 0,  % Jika buah sudah habis atau kurang
    write('Si Imut pulang sambil menangis'), nl,
    FinalFruits is 0,
    !.

/* Kasus: Pohon terakhir */
harvestFruits(N, Fruits, TreeNumber, FinalFruits) :-
    TreeNumber > N,  % Jika sudah melewati pohon terakhir
    FinalFruits is Fruits,
    !.

harvestFruits(N, Fruits, TreeNumber, FinalFruits) :-
    Fruits > 0,
    TreeNumber =< N,
    apply_effects(TreeNumber, Fruits, UpdatedFruits),  % Terapkan efek pohon saat ini
    NextTree is TreeNumber + 1,  % Pohon berikutnya
    harvestFruits(N, UpdatedFruits, NextTree, FinalFruits).
    
    /* Aturan untuk menerapkan efek pada jumlah buah */
apply_effects(TreeNumber, Fruits, UpdatedFruits) :-
    (   TreeNumber mod 3 =:= 0  % Jika habis dibagi 3
        -> UpdatedFruits is Fruits + 2
    ;   TreeNumber mod 4 =:= 0  % Jika habis dibagi 4
        -> UpdatedFruits is Fruits - 5
    ;   TreeNumber mod 5 =:= 0  % Jika habis dibagi 5
        -> UpdatedFruits is Fruits + 3
    ;   is_prime(TreeNumber)  % Jika bilangan prima
        -> UpdatedFruits is Fruits - 10
    ;   UpdatedFruits is Fruits  % Tidak ada kondisi yang terpenuhi
    ).

/*=================*/
/* SOAL Kpk */
/*        4        */
/* Deklarasi Rules */
% ['bagian2.pl'].
%euclidian algorithm

fpb(A, 0, A) :- !.
fpb(A, B, X) :-
    R is A mod B,
    fpb(B, R, X).

kpk(A, B, X) :-
    fpb(A, B, FPB),       
    X is (A * B) // FPB.  


/*=================*/
/* SOAL FACTORIAL */
/*        5        */
/* Deklarasi Rules */
% ['bagian2.pl'].

factorial(0, 1) :- !.
factorial(1,1) :-  !.
factorial(N,X) :- 
    N > 0, 
    N1 is N, 
    N2 is N - 1,
    factorial(N2, Y),
    X is N1 * Y.


/*=================*/
/* SOAL Make Pattern */
/*        6        */
/* Deklarasi Rules */
% ['bagian2.pl'].

/* Fungsi utama */
makePattern(N) :-
    printRows(1, N),!.

printRows(Row, N) :-
    Row =< N,
    printColumns(Row, 1, N),
    nl,
    NextRow is Row + 1,
    printRows(NextRow, N).
printRows(_, _).

printColumns(Row, Col, N) :-
    Col =< N,
    depth(Row, Col, N, Depth),
    write(Depth), write(' '),
    NextCol is Col + 1,
    printColumns(Row, NextCol, N).
printColumns(_, _, _).

depth(Row, Col, N, Depth) :-
    MinRow is min(Row - 1, N - Row),
    MinCol is min(Col - 1, N - Col),
    Depth is 1 + min(MinRow, MinCol).




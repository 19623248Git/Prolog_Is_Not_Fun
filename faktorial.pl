% Basis
faktorial(0, 1).

% Rekurens
faktorial(N, Y) :-
    N > 0,
    N1 is N - 1,
    faktorial(N1, Y1),
    Y is N * Y1.

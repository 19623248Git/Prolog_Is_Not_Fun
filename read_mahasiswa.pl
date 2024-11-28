% Predikat untuk baca file mahasiswa.txt
read_mahasiswa :-
    open('mahasiswa.txt', read, Stream),
    read_names(Stream, Names),
    close(Stream),
    write('Daftar Nama Mahasiswa: '), nl,
    write(Names), nl.

% predikat rekursif untuk membaca nama dalam file
% Basis: 
read_names(Stream, []) :-
    at_end_of_stream(Stream). 

% Rekurens:
read_names(Stream, [Name|Rest]) :-
    \+ at_end_of_stream(Stream), 
    read(Stream, Name),    
    read_names(Stream, Rest).

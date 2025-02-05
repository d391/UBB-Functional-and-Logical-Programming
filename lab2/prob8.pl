% noEven(List L, Int C, Int R)
% (i, i, o)

noEven([], C, R):- R is C.
noEven([H|T], C, R):- C=:=0, NC is C+1, noEven(T, NC, R).
noEven([H|T], C, R):- C=:=1, NC is C-1, noEven(T, NC, R).

%getMin(List L, Int MIN, Int R)
%(i, i, o)

getMin([], MIN, R):- R is MIN.
getMin([H|T], MIN, R):- MIN<H, getMin(T, MIN, R).
getMin([H|T], MIN, R):- H<MIN, getMin(T, H, R).
getMin([H|T], MIN, R):- MIN=:=H, getMin(T, MIN, R).

%deleteFirstOcc(List L, List CL, Int ALDEL, List RL)
%(i, i, i, o)
deleteFirstOcc([], CL, []).
deleteFirstOcc([H|T], CL, RL):- getMin(CL, 99, R), R=:=H, RL=T.
deleteFirstOcc([H|T], CL, RL):- getMin(CL, 99, R), R=\=H, deleteFirstOcc(T, CL, RLT), RL=[H|RLT].


delete1(_,[],[]).
delete1(E, [H|T], R):- H=:=E, R=T.
delete1(E, [H|T], R):- H=\=E, delete1(E,T,RT), R=[H|RT].












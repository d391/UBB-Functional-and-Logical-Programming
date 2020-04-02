%a
%makeNr(L - list, NR - int, R - int)
%(i,i,o)

makeNr([], NR, NR).
makeNr([H|T],NR,R):- NR1 is NR*10 + H, makeNr(T, NR1,R).

%makeList(NR - int, RL - list, R - list)
%(i,i,o)
makeList(0,RL, RL).
makeList(NR, RL, R):- C is NR mod 10, RL1 = [C|RL], NR1 is NR div 10, makeList(NR1, RL1, R).

%product(L - list, NR - int, RL - list)
%(i,i,o)
product([],_,0).
product([H|T], NR, RL):- makeNr([H|T], 0, R), R1 is R*NR, makeList(R1, [], RL).

%b
%getMax(L - list, MAX - int, R - int)
%(i,i,o)
getMax([],MAX,MAX).
getMax([H|T], MAX, R):- H>=MAX, getMax(T,H,R).
getMax([H|T], MAX, R):- H=<MAX, getMax(T,MAX,R).

%replaceMaxPos(L - list, MAX - int, POS - int, CL - list, RL -list)
%(i,i,i,i,o)
replaceMaxPos([], _, _, CL,CL).
replaceMaxPos([H|T], MAX, POS, CL, RL):- H=:=MAX, CL1 = [POS|CL], POS1 is POS+1, replaceMaxPos(T, MAX, POS1, CL1, RL).
replaceMaxPos([H|T], MAX, POS, CL, RL):- H=\=MAX, CL1 = [H|CL], POS1 is POS+1, replaceMaxPos(T, MAX, POS1, CL1, RL).

%reverseList(L - list, CL - list, RL - list)
%(i,i,o)
reverseList([],CL,CL).
reverseList([H|T],CL,RL):- CL1 = [H|CL], reverseList(T, CL1, RL).

%replaceList(L - list, CL - list, RL - list)
%(i,i,o)
replaceList([],CL,RL):- reverseList(CL, [], RL1), RL = RL1.
replaceList([H|T], CL, RL):- is_list(H), getMax(H,-1,MAX), replaceMaxPos(H, MAX, 1, [], RLMAX), reverseList(RLMAX,[],RLF), CL1 = [RLF|CL], replaceList(T,CL1,RL).
replaceList([H|T], CL, RL):- number(H), CL1 = [H|CL], replaceList(T,CL1,RL).


%Write a predicate to generate the list of all subsets with all elements
% of a given %list.
%Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]

% generateSubsets(L - list, N - length of subset, CN - length of
% current subset, CL - current subset, R - result)
%(i,i,i,i,o)

generateSubsets(_,N,CN,CL,CL):- N=:=CN.
generateSubsets([H|T],N,CN,CL,R):- CN1 is CN+1, generateSubsets(T,N,CN1,CL1,R), CL1 = [H|CL].
generateSubsets([H|T],N,CN,CL,R):- CN<N,generateSubsets(T,N,CN,CL,R).

%tests:
%findall(R,generateSubsets([],0,0,[],R),REZ)
%findall(R,generateSubsets([2,3,4],2,0,[],R),REZ).
%findall(R,generateSubsets([2,3,4],3,0,[],R),REZ).
%findall(R,generateSubsets([2],1,0,[],R),REZ).

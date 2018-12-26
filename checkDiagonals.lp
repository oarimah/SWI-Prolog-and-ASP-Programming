Question 2

%My solution for 8 Queens
eightQueens(Board) :- permutation([1,2,3,4,5,6,7,8],Board) , checkDiagonals(Board).

%checkDiagonals%
%1st line -- base case for 8 Queens
%2nd line -- 8 Queens (shrinks board from the left)
checkDiagonals([]).
checkDiagonals([H|T]) :- chkDiagUp(H,T) , chkDiagDown(H,T) , checkDiagonals(T).

%NOTE: chkDiagUp and chkDiagDown only need to check the diagonals to the right
%.    because if there is an attacking queen to the left, checkDiagonals would have already failed
%chkDiagUp%
%1st line -- base case
%2nd line -- go beyond top of the board without problem
%3rd line -- don't go beyond top of board
%         -- NOTE: top of board is always 1
chkDiagUp(_,[]).
%chkDiagUp(H1,[H2|T]) :- R is H1-1 , R =\= H2 , chkDiagUp(R,T).
chkDiagUp(H1,[H2|T]) :- R is H1-1 , (R > 0 -> R =\= H2 , chkDiagUp(R,T) ; true).

%chkDiagDown%
%1st line -- base case for 8 Queens
%2nd line -- go beyond bottom of the board without problem
%3rd line -- don't go beyond bottom of board for 8 Queens
%         -- NOTE: bottom of board is always 8
chkDiagDown(_,[]).
%chkDiagDown(H1,[H2|T]) :- R is H1+1 , R =\= H2 , chkDiagDown(R,T).
chkDiagDown(H1,[H2|T]) :- R is H1+1 , (R < 9 -> R =\= H2 , chkDiagDown(R,T) ; true).


%My solution for n Queens
nQueens(N,Board) :- numlist(1,N,List) , permutation(List,Board) , checkDiagonals(N,Board).

%checkDiagonals%
%1st line -- base case for N Queens (function definition needs extra parameter)
%2nd line -- N Queens (function definition needs N)
checkDiagonals(_,[]).
checkDiagonals(N,[H|T]) :- chkDiagUp(H,T) , chkDiagDown(N,H,T) , checkDiagonals(N,T).

%chkDiagUp%
%1st line -- base case
%2nd line -- go beyond top of the board without problem
%3rd line -- don't go beyond top of board
%         -- NOTE: top of board is always 1
chkDiagUp(_,[]).
%chkDiagUp(H1,[H2|T]) :- R is H1-1 , R =\= H2 , chkDiagUp(R,T).
chkDiagUp(H1,[H2|T]) :- R is H1-1 , (R > 0 -> R =\= H2 , chkDiagUp(R,T) ; true).

%chkDiagDown%
%1st line -- base case for N Queens (function definition needs extra parameter)
%2nd line -- go beyond bottom of the board without problem
%3rd line -- don't go beyond bottom of board for N Queens
%         -- NOTE: bottom of board depends on N (function definition needs N)
chkDiagDown(_,_,[]).
%chkDiagDown(H1,[H2|T]) :- R is H1+1 , R =\= H2 , chkDiagDown(R,T).
chkDiagDown(N,H1,[H2|T]) :- R is H1+1 , (R < N+1 -> R =\= H2 , chkDiagDown(N,R,T) ; true).

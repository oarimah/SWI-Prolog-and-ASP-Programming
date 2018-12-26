Question 3

%Place n queens on the board
%NOTE: I gave the 3 lines below in the assignment and then changed it
%      to the 4th line below
%      Reference to columns and rows below refer to the structure in the 3rd line
row(1..n).
col(1..n).
n {queen(I,J) : col(I),row(J)} n.
%n {queen(1..n,1..n) } n.

%Integrity Constraints
%Disallow models which have queens in the same column
:- queen(I,J1), queen(I,J2), J1 != J2.
%Disallow models which have queens in the same row
:- queen(I1,J), queen(I2,J), I1 != I2.

%Diagonals
%The following idea is used in the two integrity constraints below:
%   The board positions that form diagonals have a simple arithmetic constraint:
%   Diagonals going from lower left to upper right direction: adding the column
%   and row gives the same number
%   Diagonals going from upper left to lower right direction: subtracting the column
%   and row (in either direction) gives the same number
%   Example (1,2) (2,3) (3,4) gives 1 (or -1)
%           (1,4) (2,3) (3,2) gives 5
%Disallow models which have queens in the same diagonal (upper left to
%   lower right direction)
%  Refering to two queens, not the same board position, subtracting column and
%   row---is it the same number
:- queen(I,J), queen(II,JJ), (I,J) != (II,JJ), I-J == II-JJ.
%Disallow models which have queens in the same diagonal(lower left to
%   upper right direction)
%  Refering to two queens, not the same board position, adding column and
%   row---is it the same number
:- queen(I,J), queen(II,JJ), (I,J) != (II,JJ), I+J == II+JJ.

%Output
%Show just the queen positions that are in the stable models
#show queen/2.

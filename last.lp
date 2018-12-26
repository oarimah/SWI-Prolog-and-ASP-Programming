Question 1

%1st line: base case: one atom in list---this is the last item
%2nd line: last item in the list is the last item in the tail of the list
last([A],A).
last([_|T],A) :- last(T,A).

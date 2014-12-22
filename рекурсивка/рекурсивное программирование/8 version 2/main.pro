implement main
open core, console

class predicates
reverse: (integer*) -> integer*.
reverse: (integer*, integer*) -> integer*.
сheck: (integer*,integer*, string) nondeterm (i,i,o).

clauses
reverse(L) = reverse(L, []).

reverse([], L) = L.
reverse([A | L], L1) = reverse(L, [A | L1]).
сheck(A,B,S) :- A=B, S="is".
сheck(A,B,S) :- not(A=B), S="isn't".

run():-
A=[1, 6, 4, 2, 1],
B=reverse(A),
сheck(A,B,S),
write("originalA= ",A),nl,
write("reverseA= ",B),nl,
write("A ", S ," palindrome."),
fail;
_ = readLine().

end implement main

goal
mainExe::run(main::run).
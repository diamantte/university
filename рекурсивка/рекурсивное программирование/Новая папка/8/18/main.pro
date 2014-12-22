% Copyright

implement main
    open core, console

class predicates
    reverse: (A*) -> A*.
    reverse: (A*, A*) -> A*.
clauses
    reverse(L) = reverse(L, []).

    reverse([], L) = L.
    reverse([A | L], L1) = reverse(L, [A | L1]).

    run():-
   B=[1,2,1,4,5,4,1,2,1],
   if B=reverse(B) then
   write("Список  ",B, "  является полиндромом")
   else
    write("Список  ",B, "  не является полиндромом")
    end if,

    _ = readLine().
end implement main

goal

mainExe::run(main::run).
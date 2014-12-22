% Copyright

implement main
  open core, console, string, list

class predicates
    proposition: (integer, integer, integer) nondeterm.
    indicator: (integer Индикатор [out]) multi.
    solution: (integer, integer, integer)
        nondeterm (o,o,o).
clauses
    indicator(0).     % не правда
    indicator(1).      % правда
    indicator(2).    % 50\50


    proposition(1, А, Б):- А = 1, Б =2; А = 0,Б=2.

    proposition(2, Б, В):- Б = 2, В = 1;Б=0, В=1.

    proposition(3,А , В):- А = 1, В = 0; А = 0, В = 1.


    solution(А, Б, В):-
        indicator(А), indicator(Б),
        proposition(1, А, Б),
        indicator(В),
        proposition(2, Б, В),
 proposition(3, А, В).


    run():-
        solution(А, Б, В),
            write("A=", А, ", B=", Б, ", C=", В), nl,
        fail;
        _ = readLine().
end implement main

goal
%    console::runUtf8(main::run).
    mainExe::run(main::run).
% Copyright

implement main
    open core, console

clauses
   class facts - relatives
    parent: (string Родитель, string Ребенок).
    spouse: (string Муж, string Жена).
    male: (string).
    female: (string).

class predicates
    father: (string Отец, string Ребенок) nondeterm anyflow.
    mother: (string Мать, string Ребенок) nondeterm (o,o).

clauses
    father(X, Y):-
        parent(X, Y),
        male(X).

    mother(X, Y):-
        parent(X, Y),
        female(X).



    run():-
        init(),
        file::consult("family.txt", relatives),
        father(X, Y),
            write("отец - ", X, ", ребенок - ", Y), nl,
        fail;
        mother(X, Y),
            write("мать - ", X, ", ребенок - ", Y), nl,
        fail;
        if father("Иван", "Петр") then
            write("\nИван является отцом Петра","\n")
        else
            write("\nИван не является отцом Петра","\n")
        end if,
        write("\n", "Все мужчины:","\n"),
       male(X),
       write("\n", X),

       fail;
        write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
 write("\n"),
 write("\n","Сыновья Марии:","\n"),
 write("\n"),
 mother(X, Y),
        parent(X, Y),
        female(X),
        male(Y),

        write(Y,"\n"),
fail;
write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
write("\n","Замужем:","\n"),
spouse(_,Y),
write("\n",Y),
fail;
write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
        parent(X,Y),
        parent(Y,Z),
        male(X),

        write("\n",X," Дед ",Z,"\n"),

fail;
write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
  parent(X,Y),
        parent(Y,Z),
        female(X),

        write("\n",X," Бабушка ",Z,"\n"),

fail;
write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
  parent(X,Y),
        parent(Y,Z),
        male(X),
        male(Z),

        write("\n",Z," Внук ",X,"\n"),

fail;
write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
  parent(X,Y),
        parent(Y,Z),

        female(Z),

        write("\n",Z," Внучка ",X,"\n"),

fail;
write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
parent(X,Y),
male(Y),
  write("\n",Y," Сын ",X,"\n"),

fail;
write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
parent(X,Y),
female(Y),
  write("\n",Y," Дочь ",X,"\n"),

fail;
write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
parent(X,Y),
parent(X,Z),
male(Y),

if (Z=Y) then
 write("\n")
 else
 write("\n",Y," Брат ",Z,"\n")
 end if,

fail;
write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
parent(X,Y),
parent(X,Z),
female(Y),

if (Z=Y) then
 write("\n")
 else
 write("\n",Y," Сестра ",Z,"\n")
 end if,

fail;
write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
spouse(X,Y),
 write("\n",X," Муж ",Y,"\n"),
fail;
write("\n","\n","\n","//////////////////////////////////////////////////////////////""\n"),
spouse(X,Y),
 write("\n",Y," Жена ",X,"\n"),
fail;

        _ = readLine().

end implement main

goal

mainExe::run(main::run).
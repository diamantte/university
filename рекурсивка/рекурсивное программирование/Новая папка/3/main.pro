% Copyright

implement main
      open core, console

clauses
domains
 publication = book (author, string Название, edition Издание);
        magazine(string Название, integer Номер, integer Год).
 author = author(string Фамилия, string Имя, string Отчество).
    edition = edition(string Место, string Издательство, integer Год).


class facts
    library: (publication).
clauses
    library(magazine("Компьютерра", 2, 2013)).
    library(magazine("Наука и жизнь", 11, 2012)).
    library(book(author("Чехов", "Антон", "Павлович"),
        "Избранное", edition("Москва", "АСТ, Астрель", 2003))).
    library(book(author("Великова", "Людмила", "Викторовна"),
        "Русский язык", edition("Москва", "МЦНМО", 2003))).
        library(book(author("Чижикова", "Людмила", "Петровна"),
        "Стихи", edition("СПБ", "АСК", 2007))).

    run():-
        % Что есть в библиотеке?
        library(X),
            write(X), nl,
        fail;
        write("\n","\n","\n",".........................................."),
        write("\n","Книги изданные в 2003г"),
        % Названия книг, изданных в 2003 году
        library(book(_, Title, edition(_, _, 2003))),
            write("\n",Title), nl,
        fail;
write("\n","\n","\n",".........................................."),
        write("\n","Журналы имеются за года:"), nl,
library(magazine(_, _, God)),
write("\n",God), nl,
        fail;
write("\n","\n","\n",".........................................."),
 write("\n","Книги изданные в Москве:"), nl,
        library(book(author(F,I,O), Title, edition("Москва", _, _))),
        write("\n",F," ",I," ",O," ",Title), nl,
        fail;
write("\n","\n","\n",".........................................."),
        write("\n","Книги изданные в СПБ:"), nl,
        library(book(author(F,I,O), Title, edition("СПБ", _, _))),
        write("\n",F," ",I," ",O," ",Title), nl,
        fail;
write("\n","\n","\n",".........................................."),
write("\n","Журналы выпущенные за прошедший год: "), nl,
        CurTime = time::new(),
    CurTime:getDate(G1, _, _),
    G12=G1-1,
    library(magazine(N1, V, G12)),
 write("\n","Наиминование ",N1," Выпуск ",V," Год " ,G12), nl,

        fail;


        fail;
        _ = readLine().


end implement main

goal
    mainExe::run(main::run).
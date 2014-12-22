% Copyright

implement main
  open core, console, string, list

class facts - db
    rule: (positive, string, string, positive*).
    cond: (positive, string, string).
    topic: (string).

class facts
    answer: (positive, integer).

class predicates
    expert: (string).
    ask: (positive, positive*) determ.
    ask: (integer, positive, positive*) determ.
    explanation: (positive).
    getAnswer: () -> integer.
    getAnswer: (char) -> integer determ.
    correct: (positive*) determ.
clauses
    expert(Topic):-
        rule(K, Topic, Goal, QList),
        ask(K, QList),
        correct(QList),
        !,
        writef("Заключение: % - %.", Topic, Goal).
    expert(Topic):-
        writef("Не хватает сведений, чтобы определить %.", Topic).

    ask(_, [N | _]):-
        answer(N, 0),     % если признак отсутствует,
        !,     % то это направление не подходит
        fail.
    ask(K, [N | QList]):-
        answer(N, 1),    % если признак присутствует,
        !,      % то следующий вопрос
        ask(K, QList).
    ask(K, [N | QList]):-
        cond(N, X, Y),     % задается вопрос о признаке
        writef("Верно ли, что % - %? (да/нет/?): > ", X, Y),
        A = getAnswer(),    % ответ от пользователя
        !,
        ask(A, K, [N | QList]).   % реакция на ответ
    ask(_, []).

    ask(2, K, QList):- !,    % если введен знак ?, то
        explanation(K),     % выдается объяснение,
        ask(K, QList).     % опрос продолжается
    ask(A, _, [N | _]):-
        assert(answer(N, A)),   % ответ запоминается в БД
        fail.
    ask(1, K, [_ | QList]):-     % если ответ положительный,
        ask(K, QList).     % то опрос продолжается

    explanation(K):-
        rule(K, Topic, Goal, QList),
        writef("Проверяется гипотеза, что % - %. Это так, если\n",
            Topic, Goal),
        F = {(I):- cond(I, X, Y), !, writef("\t% - %\n", X, Y); succeed},
        forAll(QList, F),
        L = [N || answer(N, 1), isMember(N, QList)],
        L <> [],
        !,
        write("Известно, что\n"),
        forAll(L, F).
    explanation(_).

    correct(QList):-
        answer(N, 1),      % если есть признак,
        not(isMember(N, QList)),     % которого не должно быть,
        !,      % то н не подходит
        fail;
        succeed().

    getAnswer() = R:-
        S = frontChar(toLowerCase(trim(readLine()))),
        R = getAnswer(S),
        !.
    getAnswer() = 0.

    getAnswer(S) = 1:-       % положительный ответ
        (S = 'д'; S = 'y'; S = 'l'),     % не зависит от раскладки
        !.
    getAnswer('?') = 2.

    run():-
        file::consult("monsters.txt", db),
        topic(Topic),
        expert(Topic),
        !,
        _ = readLine();
        succeed().

end implement main

goal
%    console::runUtf8(main::run).

    mainExe::run(main::run).
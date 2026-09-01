% ==========================================
% FAMILY TREE IN PROLOG
% ==========================================

% ---------- FACTS ----------

male(john).
male(robert).
male(michael).
male(david).
male(james).

female(mary).
female(linda).
female(susan).
female(karen).
female(emily).


% ---------- PARENT RELATION ----------

parent(john, robert).
parent(mary, robert).

parent(john, linda).
parent(mary, linda).

parent(robert, michael).
parent(susan, michael).

parent(robert, karen).
parent(susan, karen).

parent(linda, david).
parent(james, david).

parent(linda, emily).
parent(james, emily).


% ==========================================
% RELATIONSHIP RULES
% ==========================================

% Father
father(X, Y) :-
    male(X),
    parent(X, Y).

% Mother
mother(X, Y) :-
    female(X),
    parent(X, Y).

% Parent
parent_of(X, Y) :-
    parent(X, Y).

% Child
child(X, Y) :-
    parent(Y, X).

% Son
son(X, Y) :-
    male(X),
    parent(Y, X).

% Daughter
daughter(X, Y) :-
    female(X),
    parent(Y, X).


% ==========================================
% SIBLING
% ==========================================

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Brother
brother(X, Y) :-
    male(X),
    sibling(X, Y).

% Sister
sister(X, Y) :-
    female(X),
    sibling(X, Y).


% ==========================================
% GRANDPARENT
% ==========================================

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Grandfather
grandfather(X, Y) :-
    male(X),
    grandparent(X, Y).

% Grandmother
grandmother(X, Y) :-
    female(X),
    grandparent(X, Y).

% Grandchild
grandchild(X, Y) :-
    grandparent(Y, X).

% Grandson
grandson(X, Y) :-
    male(X),
    grandchild(X, Y).

% Granddaughter
granddaughter(X, Y) :-
    female(X),
    grandchild(X, Y).


% ==========================================
% UNCLE AND AUNT
% ==========================================

uncle(X, Y) :-
    male(X),
    sibling(X, P),
    parent(P, Y).

aunt(X, Y) :-
    female(X),
    sibling(X, P),
    parent(P, Y).


% ==========================================
% NEPHEW AND NIECE
% ==========================================

nephew(X, Y) :-
    male(X),
    sibling(Y, P),
    parent(P, X).

niece(X, Y) :-
    female(X),
    sibling(Y, P),
    parent(P, X).


% ==========================================
% COUSIN
% ==========================================

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.


% ==========================================
% AUTOMATIC RELATIONSHIP FINDER
% ==========================================

relation(X, Y) :-
    father(X, Y),
    write(X), write(' is father of '), write(Y).

relation(X, Y) :-
    mother(X, Y),
    write(X), write(' is mother of '), write(Y).

relation(X, Y) :-
    son(X, Y),
    write(X), write(' is son of '), write(Y).

relation(X, Y) :-
    daughter(X, Y),
    write(X), write(' is daughter of '), write(Y).

relation(X, Y) :-
    brother(X, Y),
    write(X), write(' is brother of '), write(Y).

relation(X, Y) :-
    sister(X, Y),
    write(X), write(' is sister of '), write(Y).

relation(X, Y) :-
    grandfather(X, Y),
    write(X), write(' is grandfather of '), write(Y).

relation(X, Y) :-
    grandmother(X, Y),
    write(X), write(' is grandmother of '), write(Y).

relation(X, Y) :-
    grandson(X, Y),
    write(X), write(' is grandson of '), write(Y).

relation(X, Y) :-
    granddaughter(X, Y),
    write(X), write(' is granddaughter of '), write(Y).

relation(X, Y) :-
    uncle(X, Y),
    write(X), write(' is uncle of '), write(Y).

relation(X, Y) :-
    aunt(X, Y),
    write(X), write(' is aunt of '), write(Y).

relation(X, Y) :-
    nephew(X, Y),
    write(X), write(' is nephew of '), write(Y).

relation(X, Y) :-
    niece(X, Y),
    write(X), write(' is niece of '), write(Y).

relation(X, Y) :-
    cousin(X, Y),
    write(X), write(' is cousin of '), write(Y).

relation(X, Y) :-
    sibling(X, Y),
    write(X), write(' is sibling of '), write(Y).

relation(X, Y) :-
    X = Y,
    write(X), write(' and '), write(Y), write(' are the same person').

relation(X, Y) :-
    \+ father(X,Y),
    \+ mother(X,Y),
    \+ son(X,Y),
    \+ daughter(X,Y),
    \+ brother(X,Y),
    \+ sister(X,Y),
    \+ grandfather(X,Y),
    \+ grandmother(X,Y),
    \+ grandson(X,Y),
    \+ granddaughter(X,Y),
    \+ uncle(X,Y),
    \+ aunt(X,Y),
    \+ nephew(X,Y),
    \+ niece(X,Y),
    \+ cousin(X,Y),
    \+ sibling(X,Y),
    X \= Y,
    write('No direct relationship found between '),
    write(X),
    write(' and '),
    write(Y).

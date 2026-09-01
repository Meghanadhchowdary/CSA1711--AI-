% Bird database

bird(parrot).
bird(eagle).
bird(pigeon).
bird(ostrich).
bird(penguin).

% Birds that cannot fly
cannot_fly(ostrich).
cannot_fly(penguin).

% A bird can fly if it is a bird and is not in cannot_fly list
can_fly(X) :-
    bird(X),
    \+ cannot_fly(X).

% Check whether a bird can fly or not
fly(X) :-
    can_fly(X),
    write(X), write(' can fly').

fly(X) :-
    cannot_fly(X),
    write(X), write(' cannot fly').

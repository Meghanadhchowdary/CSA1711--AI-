% Planets Database

planet(mercury).
planet(venus).
planet(earth).
planet(mars).
planet(jupiter).
planet(saturn).
planet(uranus).
planet(neptune).

% Display all planets
show_planets :-
    planet(X),
    write(X), nl,
    fail.

show_planets.

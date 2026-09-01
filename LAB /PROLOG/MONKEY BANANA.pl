% Monkey Banana Problem

% State: state(MonkeyPosition, BoxPosition, BananaPosition, HasBanana)

% Initial state
initial_state(state(door, window, middle, no)).

% Goal state
goal_state(state(_, _, _, yes)).

% Move monkey from one position to another
move(state(M, B, Banana, H),
     state(NewM, B, Banana, H),
     walk(M, NewM)) :-
    M \= NewM.

% Push the box when monkey and box are at same position
move(state(M, M, Banana, H),
     state(NewPos, NewPos, Banana, H),
     push_box(M, NewPos)) :-
    M \= NewPos.

% Monkey climbs on the box
move(state(Pos, Pos, Banana, no),
     state(on_box, Pos, Banana, no),
     climb).

% Monkey takes the banana
move(state(on_box, middle, middle, no),
     state(on_box, middle, middle, yes),
     grab_banana).

% Solve the problem
solve(State, []) :-
    goal_state(State).

solve(State, [Action | Actions]) :-
    move(State, NewState, Action),
    solve(NewState, Actions).

% Database: Name and Date of Birth

person(john, '10-05-2002').
person(mary, '15-08-2001').
person(david, '20-12-2003').
person(smith, '05-03-2000').

% Find DOB using Name
find_dob(Name, DOB) :-
    person(Name, DOB).

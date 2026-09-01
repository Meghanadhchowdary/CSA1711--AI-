% Student - Teacher - Subject Code Database

student_teacher_subcode(john, ravi, cs101).
student_teacher_subcode(mary, kumar, cs102).
student_teacher_subcode(david, anil, cs103).
student_teacher_subcode(smith, priya, cs104).

% Find teacher and subject code using student name
find_details(Student, Teacher, SubjectCode) :-
    student_teacher_subcode(Student, Teacher, SubjectCode).

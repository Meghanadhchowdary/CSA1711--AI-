% Diet Suggestion System Based on Disease

diet(diabetes, 'Low sugar diet').
diet(blood_pressure, 'Low salt diet').
diet(obesity, 'Low calorie diet').
diet(heart_disease, 'Low fat diet').
diet(anemia, 'Iron rich diet').

% Suggest diet
suggest_diet(Disease, Diet) :-
    diet(Disease, Diet).

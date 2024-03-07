SELECT schools.name, city, schools.state, unsatisfactory FROM schools
JOIN staff_evaluations ON schools.district_id = staff_evaluations.district_id
ORDER BY unsatisfactory DESC
LIMIT 10;

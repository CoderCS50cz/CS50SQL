CREATE INDEX enrollments_index
ON enrollments (student_id);

CREATE INDEX enrollments_index_2
ON enrollments (student_id, course_id);

CREATE INDEX semestr_index
ON courses (semester)
WHERE semester = "Fall 2023";

CREATE INDEX courses_index
ON courses (department, semester)
WHERE department = "Computer Science" AND semester = "Spring 2024";

CREATE INDEX satisfies_index
ON satisfies (course_id);

SELECT students.name AS student,
AVG(assignment_submissions.duration) AS average_assignment_duration,
AVG(assignments.duration) AS average_estimated_duration

FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE end_date IS NULL
GROUP BY student
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_assignment_duration ASC;




-- SELECT students.name as student, 
-- avg(assignment_submissions.duration) as average_assignment_duration, 
-- avg(assignments.duration) as average_estimated_duration

-- FROM students
-- JOIN assignment_submissions ON student_id = students.id
-- JOIN assignments ON assignments.id = assignment_id
-- WHERE end_date IS NULL
-- GROUP BY student
-- HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
-- ORDER BY average_assignment_duration;

SELECT name, CONCAT(ROUND(100*(population / (
                                              SELECT population
                                              FROM world
                                              WHERE name = 'Germany'))
                                              ,'%') AS percentage

FROM world
WHERE continent = 'Europe'
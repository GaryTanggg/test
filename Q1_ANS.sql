USE `test`;
SELECT c.no AS course_name,
       s.name AS student_name,
       c.score
FROM course c JOIN student s ON c.student_id = s.id ORDER BY c.no DESC, c.score DESC;
       
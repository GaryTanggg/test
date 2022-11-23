USE `test`;
-- Q4
SET SQL_SAFE_UPDATES=0;
UPDATE course c SET c.score=100 WHERE c.student_id=(SELECT s.id FROM student s WHERE s.name='大雄' AND c.no ='english');
SELECT * FROM COURSE;

-- Q5
DELETE FROM course c WHERE c.student_id=(SELECT s.id FROM student s WHERE s.name='小夫');
DELETE FROM student s WHERE s.name='小夫';
SELECT * FROM student;
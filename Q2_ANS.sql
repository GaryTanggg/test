USE `test`;
SELECT c.no,
COUNT(student_id) AS student_count,
MAX(IFNULL(score,0)) AS max_score,
MIN(IFNULL(score,0)) AS min_score,
ROUND(AVG(IFNULL(score,0)),2) AS avg_score
FROM course c JOIN student s ON s.id=c.student_id GROUP BY c.no;



-- Q3
SELECT X.no,
       x.student_count,
       x.max_score,
       x.min_score,
       (SELECT GROUP_CONCAT(xs.name ORDER BY xs.id DESC) FROM course xc JOIN student xs ON xs.id=xc.student_id
       WHERE xc.score=x.max_score AND x.no=xc.no) AS max_score_student_name,
              (SELECT GROUP_CONCAT(xs.name ORDER BY xs.id DESC) FROM course xc JOIN student xs ON xs.id=xc.student_id
       WHERE xc.score=x.min_score AND x.no=xc.no) AS min_score_student_name
FROM
(SELECT c.no,
COUNT(student_id) AS student_count,
MAX(IFNULL(score,0)) AS max_score,
MIN(IFNULL(score,0)) AS min_score
FROM course c JOIN student s ON s.id=c.student_id GROUP BY c.no)X;
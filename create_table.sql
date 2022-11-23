SHOW databases;
CREATE database `test`;
USE `test`;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS student;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE student(
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'流水編號',
`name` VARCHAR(50) character SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT'姓名'
)ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT'學生資料';

DROP TABLE if exists `course`;
CREATE TABLE course(
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'流水編號',
`no` VARCHAR(50) character SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT'科目代號',
`student_id` INT COMMENT '學生ID',
`score` INT COMMENT'分數',
foreign key course(student_id) REFERENCES student(id)
)ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT'成績單';

SELECT* FROM STUDENT;
SELECT* FROM course;

START transaction;
INSERT INTO student(name) VALUES ('大雄');
INSERT INTO student(name) VALUES ('技安');
INSERT INTO student(name) VALUES ('小夫');
INSERT INTO student(name) VALUES ('小叮噹');
INSERT INTO student(name) VALUES ('宜靜');
COMMIT;

INSERT INTO course(no,student_id,score)VALUES('math',(SELECT s.id FROM student s WHERE s.name='小夫'),80);
INSERT INTO course(no,student_id,score)VALUES('math',(SELECT s.id FROM student s WHERE s.name='宜靜'),62);
INSERT INTO course(no,student_id,score)VALUES('math',(SELECT s.id FROM student s WHERE s.name='小叮噹'),3);
INSERT INTO course(no,student_id,score)VALUES('english',(SELECT s.id FROM student s WHERE s.name='小夫'),97);
INSERT INTO course(no,student_id,score)VALUES('english',(SELECT s.id FROM student s WHERE s.name='技安'),12);
INSERT INTO course(no,student_id,score)VALUES('english',(SELECT s.id FROM student s WHERE s.name='大雄'),0);
INSERT INTO course(no,student_id,score)VALUES('sport',NULL,NULL);
COMMIT;



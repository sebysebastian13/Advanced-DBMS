#1
CREATE TABLE STUDENT_INFO 
(
SID INT UNIQUE,
STUD_NAME VARCHAR(25) NOT NULL,
STUDE_SCORE INT DEFAULT 20
);

/*DESCRIBE STUDENT_INFO;*/

ALTER TABLE STUDENT_INFO
CHANGE SID STUD_ID INT PRIMARY KEY;

/*ALTER TABLE STUDENT_INFO
DROP SID; 
ALTER TABLE STUDENT_INFO
ADD COLUMN SID INT PRIMARY KEY;*/

UPDATE STUDENT_INFO SET STUDE_SCORE =STUDE_SCORE + 5 WHERE STUDE_SCORE > 150;

#2
CREATE TABLE WORKER
(
WORKER_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY INT,
JOINING_DATE DATE,
DEPARTMENT VARCHAR(25)
);
DROP TABLE WORKER;
/*  DESCRIBE WORKER;*/
  
CREATE TABLE BONUS
(
WORKER_ID INT, 
BONUS_DATE DATE, 
BONUS_AMOUNT INT,
CONSTRAINT FK FOREIGN KEY(WORKER_ID) REFERENCES WORKER(WORKER_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE BONUS;
DESCRIBE BONUS;

#2
INSERT INTO WORKER(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(1,'MONIKA','ARORA',100000,'2014-02-20','HR'),
(2,'NIHARIKA','VERMA',80000, '2014-06-11','ADMIN'),
(3,'VISHAL', 'SINGHAL', '300000', '2014-02-20', 'HR'),
(4,'AMITABH', 'SINGH', '500000', '2014-02-20', 'ADMIN'),
(5,'VIVEK', 'BHATI', '500000', '2014-06-11', 'ADMIN'),
(6,'VIPUL','DIWAN', '200000', '2014-06-11', 'ACCOUNT'),
(7,'SATISH', 'KUMAR', '75000', '2014-01-20', 'ACCOUNT'),
(8,'GEETIKA', 'CHAUHAN', '90000', '2014-04-11', 'ADMIN');

SELECT * FROM WORKER;

#3
INSERT INTO BONUS(WORKER_ID,BONUS_DATE,BONUS_AMOUNT) VALUES
(1,'2016-02-20',5000),
(2,'2016-06-11',3000),
(3,'2016-02-20',4000),
(1,'2016-02-20',4500),
(2,'2016-06-11',3500);

SELECT *FROM BONUS;

#4
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;

#5
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC;

#6
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ('VIPUL','SATISH');

#7
SELECT * FROM WORKER WHERE DEPARTMENT='ADMIN';

#8
SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;

#9
SELECT UPPER(FIRST_NAME) FROM WORKER;

#10
SELECT DISTINCT DEPARTMENT FROM WORKER;

#11
SELECT SUBSTRING(FIRST_NAME,1,3) FROM WORKER;

#12
SELECT RTRIM(FIRST_NAME) FROM WORKER;

#13
SELECT LTRIM(FIRST_NAME) FROM WORKER;

#14
SELECT DISTINCT LENGTH(DEPARTMENT) FROM WORKER;

#15
SELECT REPLACE(FIRST_NAME,'a','A') FROM WORKER;

#16
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT,SALARY,BONUS_AMOUNT FROM WORKER,BONUS
WHERE WORKER.WORKER_ID = BONUS.WORKER_ID AND BONUS_AMOUNT> 4000 ;

#17
DELETE FROM WORKER WHERE WORKER_ID=7;
SELECT * FROM WORKER;
SELECT * FROM BONUS;

#18
ALTER TABLE BONUS
DROP CONSTRAINT FK;

ALTER TABLE BONUS ADD CONSTRAINT FK_NEW FOREIGN KEY(WORKER_ID) 
REFERENCES WORKER(WORKER_ID) ON UPDATE NO ACTION ON DELETE NO ACTION ;

#19
DELETE FROM WORKER WHERE WORKER_ID=8;
SELECT * FROM WORKER;
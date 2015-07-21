PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Students (
first_name VARCHAR(30),
last_name VARCHAR(30),
github VARCHAR(30)
);
INSERT INTO "Students" VALUES('Jane','Hacker','jhacks');
INSERT INTO "Students" VALUES('Sarah','Developer','sdevelops');
CREATE TABLE Projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(30),
    description TEXT,
    max_grade INTEGER);
INSERT INTO "Projects" VALUES(1,'Markov','Tweets generated from Markov chains',50);
INSERT INTO "Projects" VALUES(2,'Blockly','Programmatic Logic Puzzle Game',10);
INSERT INTO "Projects" VALUES(3,'Twitter Nonsense','Just some stuff from Twitter, really, put together into other things',15);
INSERT INTO "Projects" VALUES(4,'Show off SQL','Gifs of how great i am at SQL',20);
INSERT INTO "Projects" VALUES(5,'Computer Levitation','We tell the computer how to float, and it does it, seriously',100);
CREATE TABLE Grades (
student_github VARCHAR(30),
project_title VARCHAR(30) NOT NULL,
student_grade INTEGER NOT NULL);
INSERT INTO "Grades" VALUES('jhacks','Markov',10);
INSERT INTO "Grades" VALUES('jhacks','Blockly',2);
INSERT INTO "Grades" VALUES('sdevelops','Markov',50);
INSERT INTO "Grades" VALUES('sdevelops','Blockly',100);
INSERT INTO "Grades" VALUES('jhacks','War Games',25);
INSERT INTO "Grades" VALUES('sdevelops','War Games',400);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('Projects',5);
CREATE VIEW ReportCardView AS 
SELECT Students.first_name, 
Students.last_name,
Projects.title,
Projects.max_grade,
Grades.student_grade
FROM Students
JOIN Grades ON (Students.github = Grades.student_github)
JOIN Projects ON (Projects.title = Grades.project_title);
COMMIT;

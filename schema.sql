CREATE DATABASE college_management;
USE college_management;

CREATE TABLE students(
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
city VARCHAR(50),
age INT
);

CREATE TABLE courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(50),
fees INT
);

CREATE TABLE enrollments(
enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE
);

CREATE TABLE exams(
exam_id INT PRIMARY KEY,
student_id INT,
course_id INT,
marks INT
);

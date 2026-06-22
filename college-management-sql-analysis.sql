CREATE DATABASE college_management;
USE college_management;
create table students(student_id int primary key ,student_name varchar(50) ,city varchar(50) , age int );
create table courses(course_id int primary key ,course_name varchar (50) ,fees int);
create table enrollments(enrollment_id int primary key ,student_id int ,course_id int , enrollment_date Date);
create table exams(exam_id int primary key ,student_id int ,course_id int , marks int);

#show all the students

select* from students;

#show students from lucknow

select * from students 
where city = "lucknow";

#show students older then 20

select * from students
where age > 20;

#Courses with fees > 10000

select course_name from courses
where fees > 10000;

#Average marks

select avg(marks) 
from exams;

#highest marks

select max(marks)
from exams;

#lowest marks

select min(marks)
from exams;

#Total students enrolled

select count(student_id) 
from enrollments;

#Number of students in each city

select city , count(student_id) 
from students
group by city;

#Average marks by city

select city , avg(marks) 
from students
join exams
on students.student_id = exams.student_id 
group by city;

#Number of students in each course

select course_name , count(student_id)
from courses 
join enrollments
on courses.course_id = enrollments.course_id
group by course_name;

#Courses having more than 2 students

select course_name , count(student_id)
from courses 
join enrollments
on courses.course_id = enrollments.course_id
group by course_name
having count(student_id) > 2;

#Show student name with course name

select student_name , course_name
from students
join enrollments
on students.student_id = enrollments.student_id
join courses
on courses.course_id = enrollments.course_id;

#Show student names with marks
select student_name ,marks
from students
join exams
on students.student_id = exams.student_id;

#Show student name, course name, and marks
select student_name , course_name, marks
from students
join exams
on students.student_id = exams.student_id
join courses
on courses.course_id = exams.course_id;

#Show all students even if they have not taken exams
select student_name , marks
from students
left join exams
on students.student_id = exams.student_id;

#Students scoring above average marks
select student_name , marks
from students
join exams 
on students.student_id = exams .student_id
where marks > (select avg(marks) from exams);

#Student with highest marks
select student_name , marks
from students
join exams
on students.student_id = exams.student_id
order by marks desc
limit 1;

#Courses above average fees

select course_name , fees
from courses 
where fees > (select avg(fees) from courses);

#Student enrolled in the most expensive course

select student_name , course_name , fees
from students
join enrollments
on students.student_id = enrollments.student_id
join courses
on courses.course_id = enrollments.course_id
where fees = (select max(fees) from courses);

#Top 5 students by marks

select student_name , marks
from students 
join exams
on students.student_id = exams.student_id
order by marks desc
limit 5;

#Course generating highest revenue
select course_name , fees * count(student_id) as revenue
from courses 
join enrollments
on courses.course_id = enrollments.course_id
group by course_name , fees
order by revenue desc
limit 1;

#City with highest average marks

select city , avg(marks)
from students
join exams
on students.student_id = exams.student_id
group by city 
order by avg(marks) desc
limit 1;

#Student enrolled in maximum courses

select student_name , count(course_id) as total_courses
from students
join enrollments
on students.student_id = enrollments.student_id
group by student_name
order by total_courses desc
limit 1;

#Course with maximum students

select course_name , count(student_id) 
from courses
join enrollments
on courses.course_id = enrollments.course_id
group by course_name
order by count(student_id) desc
limit 1;

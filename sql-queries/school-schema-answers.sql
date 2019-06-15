/* SQL Exercise Set 1 - School */
use school;
/* Section 1 */
/* 1 */
select distinct city from student;
/* 2 */
select * from student where city = 'Laval' and gender = 'f';
/* 3 */
select * from student where city like '%l';
/* 4 */
select distinct city from student where city not like '%a%';
/* 5 */
select distinct department from course where advanced=1;
/* 6 */
select * from course where department in ('MAD', 'CST') order by number desc;
/* 7 */
select * from course where advanced=1 and department != 'MAD' order by number asc limit 4;
/* 8 */
select max(grade), min(grade) from took;
/* 9 */
select max(grade) from took where grade not in (select max(grade) from took);
select max(grade) from took where grade < (select max(grade) from took);
/* 10 */
select count(*) from student where gender = 'm';
/* 11 */
select avg(grade) from took;
/* 12 */
select count(grade), sum(grade), avg(grade) from took where grade >= 50;
/* 13 */
select * from student where (first_name like 'A%' or last_name like '%e') and not (first_name like 'A%' and last_name like '%e');
/* 14 */
select distinct city from student where city like "_o%";
/* 15 */
select c.department, c.number, c.advanced from course as c
join offering as o on c.id = o.course_id
where o.season = 'Fall' and o.year = 2017 and c.advanced = 1;
/* 16 */
select department, count(*) from course group by department;
/* 17 */
select department, count(*) from offering
join course on offering.course_id = course.id
where offering.year = 2018
group by course.department;
/* 18 */
select department, count(*) from offering
join course on offering.course_id = course.id
where offering.year = 2019
group by course.department
having count(*) > 1;
/* 19 */
select c.department, c.number, max(grade)
from course as c
join offering as o on o.course_id = c.id
join took as t on t.oid = o.id
group by c.department, c.number;
/* 20 */
select s.id, avg(t.grade)
from student as s
join took as t on s.id = t.sid
where s.gender = 'm'
group by s.id
having avg(t.grade)>50;
/* 21 */
select gender, avg(grade)
from student as s
join took as t on t.sid = s.id
group by gender;
/* SQL Exercise Set 1 - School */

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


/* uncomment this if you want to make modifications */
# drop database school;
create database school;
use school;

/* gender is an enum('f', 'm'), meaning only f and m are valid values.
 City is chosen from this list: Montreal | Laval | Brossard | Lasalle | Verdun | Anjou */
create table student(
	id int primary key auto_increment,
	first_name nvarchar(64) not null,
    last_name nvarchar(64) not null,
    gender enum('f', 'm') not null,
    city nvarchar(64) not null
);

/* A course is described by its department + code, ie ABC123 or XYZ999 */
/* advanced is a boolean, but it is represented by 0 and 1 */
create table course (
	id int primary key auto_increment,
	department nvarchar(3),
    number int,
    advanced boolean,
    constraint chk_number check (number >= 100 AND number <= 999)
);

/* We want the combination of department and number to be unique, wihtout being the primary key */
CREATE UNIQUE INDEX unique_course
ON course(department, number);

/* years are limited to 2016 to 2019 */
create table offering(
	id int primary key auto_increment,
	department nvarchar(3),
    number int,
    season enum('Winter', 'Summer', 'Fall', 'Spring') not null,
    year year not null
);

/* a grade is a number between 0 and 100. The passing grade is 50 */
create table took(
	sid int,
	oid int,
    grade int not null,
    constraint chk_grade check (grade >= 0 AND grade <= 100),
    constraint pk_took primary key (sid, oid),
    foreign key (sid) references student(id),
    foreign key (oid) references offering(id)
);

/* insert statements generated from www.generatedata.com */
/* insert 40 students */
INSERT INTO student (first_name,last_name,gender,city) VALUES ("Hayley","Turner","f","Roxboro"),("Joy","Lynch","m","Roxboro"),("Owen","Wood","m","Roxboro"),("Zelda","Yates","m","Laval"),("Ira","Marsh","f","Lasalle"),("Nicole","Cortez","f","Verdun"),("Maia","Pittman","f","Brossard"),("Cheyenne","Foley","m","Verdun"),("Celeste","Daniel","m","Lasalle"),("Malik","Pace","m","Roxboro");
INSERT INTO student (first_name,last_name,gender,city) VALUES ("Jocelyn","Olsen","f","Verdun"),("Ignacia","Boone","m","Laval"),("Ulla","Battle","m","Verdun"),("Wing","Mejia","f","Roxboro"),("Hiroko","Caldwell","f","Brossard"),("Maxwell","Hammond","m","Montreal"),("Lara","Conley","m","Montreal"),("Hall","Saunders","f","Brossard"),("Gray","Cabrera","f","Brossard"),("Hyatt","Compton","m","Brossard");
INSERT INTO student (first_name,last_name,gender,city) VALUES ("Hollee","Zamora","m","Verdun"),("Anika","Drake","f","Brossard"),("Keefe","Griffin","m","Laval"),("Xander","Hayden","m","Verdun"),("Moana","Durham","m","Montreal"),("Harding","Santiago","m","Lasalle"),("Vladimir","Pearson","f","Roxboro"),("Francis","Nieves","f","Roxboro"),("Marny","Williams","f","Roxboro"),("Eliana","Ramsey","m","Brossard");
INSERT INTO student (first_name,last_name,gender,city) VALUES ("William","Goodman","m","Roxboro"),("Zahir","Delaney","m","Verdun"),("Lisandra","Velazquez","f","Brossard"),("Natalie","Kerr","f","Montreal"),("Tamara","Mullen","f","Montreal"),("Carolyn","Martin","f","Montreal"),("Quentin","Willis","f","Laval"),("Kristen","Odonnell","m","Verdun"),("Cedric","Mclean","f","Laval"),("Mariam","Barr","f","Brossard");

/* insert 20 courses */ 
INSERT INTO course (department,number,advanced) VALUES ("FIN",788,1),("FIN",660,0),("TLN",306,1),("MAD",131,0),("TLN",203,1),("TLN",548,0),("CST",742,1),("TLN",706,1),("TLN",853,0),("FIN",686,1);
INSERT INTO course (department,number,advanced) VALUES ("MAD",685,0),("CST",954,0),("MAD",947,1),("MAD",544,1),("TLN",121,0),("FIN",813,1),("MAD",211,1),("FIN",271,1),("CST",512,0),("TLN",768,1);

/* insert 40 offerings */
INSERT INTO offering (department,number,season,year) VALUES ("TLN",203,"Summer",2017),("FIN",686,"Spring",2016),("CST",742,"Spring",2017),("FIN",813,"Fall",2017),("TLN",203,"Winter",2019),("FIN",788,"Summer",2017),("CST",742,"Summer",2017),("FIN",788,"Winter",2019),("CST",742,"Winter",2018),("MAD",131,"Summer",2016);
INSERT INTO offering (department,number,season,year) VALUES ("CST",512,"Spring",2019),("FIN",686,"Fall",2017),("CST",954,"Fall",2016),("TLN",306,"Spring",2019),("CST",954,"Fall",2016),("TLN",306,"Winter",2016),("MAD",131,"Winter",2016),("CST",512,"Summer",2018),("FIN",813,"Winter",2018),("MAD",211,"Fall",2018);
INSERT INTO offering (department,number,season,year) VALUES ("TLN",203,"Winter",2019),("CST",742,"Winter",2018),("TLN",203,"Fall",2019),("MAD",544,"Summer",2017),("TLN",121,"Fall",2019),("CST",512,"Fall",2018),("TLN",394,"Summer",2017),("CST",512,"Summer",2018),("TLN",566,"Summer",2018),("MAD",685,"Spring",2017);
INSERT INTO offering (department,number,season,year) VALUES ("TLN",121,"Fall",2018),("CST",512,"Winter",2016),("MAD",131,"Fall",2017),("CST",512,"Summer",2017),("TLN",306,"Spring",2019),("MAD",685,"Winter",2018),("MAD",685,"Winter",2018),("CST",512,"Winter",2019),("FIN",788,"Winter",2019),("MAD",685,"Fall",2019);

/* insert 200 tooks */
INSERT INTO took (sid,oid,grade) VALUES (3,37,13),(26,31,34),(26,3,25),(11,27,13),(1,16,37),(10,5,50),(7,14,72),(35,27,82),(24,33,56),(39,10,4);
INSERT INTO took (sid,oid,grade) VALUES (6,15,56),(24,20,94),(1,23,24),(25,7,17),(15,39,5),(3,11,83),(29,2,10),(33,13,76),(24,39,21),(21,2,31);
INSERT INTO took (sid,oid,grade) VALUES (9,14,65),(12,21,26),(10,31,2),(2,2,42),(15,7,39),(38,8,48),(26,34,84),(15,4,75),(35,1,80),(24,32,87);
INSERT INTO took (sid,oid,grade) VALUES (16,18,38),(1,10,8),(37,17,94),(27,8,83),(19,17,90),(12,17,90),(39,24,7),(15,26,78),(1,27,13),(15,31,40);
INSERT INTO took (sid,oid,grade) VALUES (34,31,88),(4,32,83),(24,26,27),(28,7,90),(2,4,49),(33,30,13),(1,5,51),(1,33,55),(20,2,40),(12,14,23);
INSERT INTO took (sid,oid,grade) VALUES (7,20,42),(11,21,38),(36,39,42),(38,17,58),(8,19,6),(3,15,19),(16,19,2),(30,37,27),(35,9,82),(5,20,92);
INSERT INTO took (sid,oid,grade) VALUES (15,25,27),(38,3,92),(15,6,23),(35,4,25),(16,37,92),(34,11,45),(7,23,79),(3,28,35),(34,13,36),(33,36,62);
INSERT INTO took (sid,oid,grade) VALUES (28,31,61),(4,37,76),(4,25,15),(25,32,8),(1,9,82),(19,37,46),(16,32,10),(14,32,3),(10,38,94),(20,15,48);
INSERT INTO took (sid,oid,grade) VALUES (6,19,33),(35,34,0),(33,21,86),(33,25,69),(30,20,40),(6,7,54),(38,22,50),(20,11,94),(32,7,21),(20,7,43);
INSERT INTO took (sid,oid,grade) VALUES (29,6,24),(29,21,30),(2,13,27),(2,38,53),(39,13,93),(37,26,57),(5,32,29),(9,28,89),(11,30,32),(34,38,23);
INSERT INTO took (sid,oid,grade) VALUES (25,38,62),(5,40,64),(13,32,17),(17,29,60),(11,1,59),(23,21,100),(17,12,50),(37,38,25),(20,12,80),(2,40,59);
INSERT INTO took (sid,oid,grade) VALUES (33,18,13),(14,36,32),(40,11,25),(22,35,67),(5,8,73),(2,18,67),(6,23,76),(36,30,6),(4,12,87),(38,13,6);
INSERT INTO took (sid,oid,grade) VALUES (40,29,38),(17,23,41),(29,19,63),(5,28,6),(11,11,24),(34,35,12),(4,16,21),(21,25,26),(27,40,19),(25,21,74);
INSERT INTO took (sid,oid,grade) VALUES (12,10,64),(23,12,86),(14,4,16),(3,9,32),(5,9,83),(7,7,35),(9,33,0),(4,15,56),(37,35,61),(12,29,95);
INSERT INTO took (sid,oid,grade) VALUES (22,22,52),(7,5,92),(32,35,71),(27,6,94),(25,16,92),(22,25,7),(11,24,9),(10,19,15),(4,9,1),(27,11,72);
INSERT INTO took (sid,oid,grade) VALUES (5,36,76),(36,9,42),(20,3,43),(15,9,95),(23,20,49),(27,35,87),(36,21,6),(17,38,58),(1,37,33),(12,4,11);
INSERT INTO took (sid,oid,grade) VALUES (31,11,44),(5,15,0),(5,3,1),(33,40,13),(32,16,46),(26,37,29),(7,35,8),(38,4,94),(11,16,97),(34,2,24);
INSERT INTO took (sid,oid,grade) VALUES (37,24,9),(30,11,83),(28,25,92),(3,19,93),(10,30,25),(12,30,51),(26,30,95),(34,33,86),(15,40,58),(21,10,69);
INSERT INTO took (sid,oid,grade) VALUES (14,9,65),(17,20,24),(26,20,28),(14,23,39),(13,31,38),(33,5,28),(7,9,76),(6,12,14),(34,8,61),(32,25,29);
INSERT INTO took (sid,oid,grade) VALUES (34,4,34),(20,34,14),(24,19,82),(28,18,4),(20,33,91),(31,14,51),(6,6,76),(15,34,24),(7,19,18),(5,19,60);


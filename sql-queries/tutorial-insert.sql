create database tutorial;
use tutorial;

create table student(
	id int,
    firstName nvarchar(255),
    lastName nvarchar(255),
    gpa decimal(4,2),
    primary key(id)
);

insert into student(
	id,
    firstName,
    lastName,
    gpa)
values 
	(12345, 'Jon', 'Doe', 3.1),
	(23456, 'Tom', 'Pleka', 2.2),
	(34567, 'Bob', 'Marley', 4.0),
	(45678, 'Lee', 'Tambal', 3.3),
	(56789, 'Paul', 'Dickens', 3.0),
	(67890, 'Mary', 'Joseph', 2.4),
	(78901, 'Lucy', 'Smith', 2.7),
	(89012, 'Jon', 'Snow', 1.3),
	(90123, 'Ned', 'Stark', 1.8),
	(01234, 'Rob', 'Stark', 2.5),
	(11223, 'Sam', 'Tarly', 3.8),
	(22334, 'Red', 'Lady', 2.4);
    

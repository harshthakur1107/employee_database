-- Q1
create database emp_details;           -- database creation
use emp_details;                       -- using the database
create table department(
dept_id smallint primary key,          -- data type allotation
dept_name varchar(25)
);                                     -- table creation
create table project(
project_id smallint primary key,
project_name varchar(25)
);
create table employee(
name varchar (25) not null,
job_title varchar(25),
phone_no varchar(25) unique not null,
salary int,
dept_id smallint,
project_id smallint,
foreign key(dept_id)
references department(dept_id)on delete set null,
foreign key(project_id)
references project(project_id)on delete set null      -- using a variable from another table
);
show tables;                                          -- viewing tables in the database
desc employee;                                        -- viewing the columns created in the table
-- Q2
insert into department                                -- data insertion
values(101,'legal');
insert into department
values(102,'services');
insert into department
values(103,'support');
insert into department
values(104,'marketing');
insert into department
values(105,'sales');
select*from department;
use emp_details;
insert into project
values(201,'tresom');
insert into project
values(202,'overhold');
insert into project
values(203,'daltfresh');
insert into project
values(204,'zontrax');
insert into project
values(205,'ventosanzap');

insert into employee
values('cedric','executive secretary',353-769-4671,170000,101,201);
insert into employee
values('nicol','electrical engineer',580-827-2074,120000,101,202);
insert into employee
values('iolande','graphic designer',992-810-6080,130000,101,203);
insert into employee
values('balduin','financial advisor',116-752-1163,140000,102,204);
insert into employee
values('Shelley VP','Accounting',876-413-3680,95000,102,205);
insert into employee
values('Roddie','Graphic Designer',835-244-2459,97000,102,201);
insert into employee
values('Husein','Analyst Programmer',365-236-0502,54000,103,202);
insert into employee
values('Denver','Account Representative IV',777-497-5955,170000,103,203);
insert into employee
values('Benjy','Data Coordiator',483-972-8539,137905,103,204);
insert into employee
values('Enoch','Technical Writer',107-509-5878,120000,104,205);
insert into employee
values('Helenka','Web Designer I',147-925-7666,110000,104,201);
insert into employee
values('Kelsey','Civil Engineer',968-936-2767,79000,104,202);
insert into employee
values('Binni','Civil Engineer',736-983-0790,160000,105,203);
insert into employee
values('Nara','Research Assistant I',531-584-1812,59000,105,204);
insert into employee
values('Omar','Marketing Manager',435-129-2187,149063,105,205);
select*from employee;                                                      -- viewing the data in the table

-- Q3.a
select sum(salary),project_id                                              -- using a built in function to add data in a column
from employee
group by project_id;                                                       -- using a clause to segregate data as desired

-- Q3.b
select *from employee emp1
where emp1.salary >= (select avg(emp2.salary)                              -- using a sub query in order to avoid similar and multiple commands
from employee emp2
where emp2.dept_id=emp1.dept_id);

-- Q3.c
select concat(name,'@',project_name,'.',dept_name,'.com') as email
from employee,project,department
where employee.dept_id=department.dept_id and
employee.project_id=project.project_id;                                     -- using a condition to fetch data from other tables 

-- Q3.d
select count(phone_no) as total,dept_id 
from employee 
group by dept_id;

-- Q4
select * from employee
cross join project;                                                           -- using a 'cross join' to show all possibilities or cartesian product from two tables


-- Q5
create view emp as                                                            -- using view to create a specific view with certain data/access for specific users
select name,phone_no,job_title
from employee;
select*from emp;

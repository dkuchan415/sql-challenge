--Create tables for all csv files to pull into

--Create Employee Info table

CREATE TABLE employee_info (
	emp_no int PRIMARY KEY,
	emp_title_id varchar(5),
	birth_date date,
	first_name varchar(30),
	last_name varchar(30),
	sex varchar(1),
	hire_date date
);	

--Select from employee table to make sure data is correct

SELECT * FROM employee_info;
--Is there a better way to display sex? (M vs. F) possibly as only accepting the two values.
--Is "date" the right way to identify birthdate and  hiredate?

--Create Employee Salaries table

CREATE TABLE employee_salaries (
	emp_no int,
	salary money
);

SELECT *FROM employee_salaries;
--Create Employee Titles table 

CREATE TABLE employee_titles (
	title_id varchar(5),
	title varchar(30)
);

SELECT * FROM employee_titles;

--Create Employee Department table 
	
CREATE TABLE employee_department (
	emp_no int,
	dept_no varchar(4)
);

SELECT * FROM employee_department;

--Create Department table

CREATE TABLE department (
	dept_no varchar(4),
	dept_name varchar(30)
);

SELECT * FROM department;

-- Create manager department table

CREATE TABLE manager_department (
	dept_no varchar(4),
	emp_no int
);

SELECT * FROM manager_department;

--Questions for office hours... would you recommend adding in NOT NULL values for each of these?

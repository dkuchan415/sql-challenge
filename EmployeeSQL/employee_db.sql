--Create tables for all csv files to pull into

--Create Employee Info table

CREATE TABLE employee_info (
	emp_no int,
	emp_title_id varchar(5),
	birth_date date,
	first_name varchar(30),
	last_name varchar(30),
	sex varchar(1),
	hire_date date
);	

--Create Employee Salaries table

CREATE TABLE employee_salaries (
	emp_no int,
	salary money
);

--Create Employee Titles table 

CREATE TABLE employee_titles (
	emp_no int,
	title varchar(30)
);

--Create Employee Department table 
	
CREATE TABLE employee_department (
	emp_no int,
	dept_no varchar(4)
);

--Create Department table

CREATE TABLE department (
	dept_no varchar(4),
	dept_name varchar(30)
);

CREATE TABLE manager_department (
	emp_no int,
	dept_no varchar(4)
);

--Questions for office hours... would you recommend adding in NOT NULL values for each of these?

--Create tables for all csv files to pull into

--Create Employee Info table

CREATE TABLE employee_info (
	emp_no int PRIMARY KEY NOT NULL,
	emp_title_id varchar(5),
	birth_date date,
	first_name varchar(30),
	last_name varchar(30),
	sex varchar(1),
	hire_date date
);	

SELECT * FROM employee_info;

--Create Employee Salaries table

CREATE TABLE employee_salaries (
	emp_no int PRIMARY KEY,
	salary money
);

SELECT *FROM employee_salaries;
--Create Employee Titles table 

CREATE TABLE employee_titles (
	title_id varchar(5) PRIMARY KEY,
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

-- List the following details of each employee: employee number, last name, first name, sex, and salary. (COMPLETE)

SELECT employee_info.emp_no, last_name, first_name, sex, salary FROM
employee_info
LEFT JOIN employee_salaries
ON employee_info.emp_no=employee_salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986. (COMPLETE)

SELECT first_name, last_name, hire_date FROM employee_info
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- (COMPLETE)

SELECT md.dept_no, d.dept_name, ei.emp_no, ei.last_name, ei.first_name FROM employee_info AS ei
RIGHT JOIN manager_department AS md
ON ei.emp_no=md.emp_no
LEFT JOIN department AS d
ON md.dept_no=d.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
-- (COMPLETE)

SELECT ei.emp_no, ei.last_name, ei.first_name, d.dept_name FROM employee_info AS ei
LEFT JOIN employee_department AS ed
ON ei.emp_no=ed.emp_no
LEFT JOIN department AS d
ON ed.dept_no=d.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
--(COMPLETE)

SELECT ei.first_name, ei.last_name, ei.sex FROM employee_info AS ei
WHERE first_name='Hercules' 
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
--(COMPLETE)

SELECT ei.emp_no, ei.first_name, ei.last_name, d.dept_name FROM employee_info AS ei
LEFT JOIN employee_department AS ed
ON ei.emp_no=ed.emp_no
LEFT JOIN department AS d
ON ed.dept_no=d.dept_no
WHERE d.dept_name='Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT ei.emp_no, ei.first_name, ei.last_name, d.dept_name FROM employee_info AS ei
LEFT JOIN employee_department AS ed
ON ei.emp_no=ed.emp_no
LEFT JOIN department AS d
ON ed.dept_no=d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
--(COMPLETE)

SELECT last_name, COUNT(*) FROM employee_info
GROUP BY last_name
ORDER BY COUNT(*) desc;

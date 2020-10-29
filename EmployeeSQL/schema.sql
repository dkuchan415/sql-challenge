-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/IBoxHa
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
-- Create table for employees.csv

CREATE TABLE "employee_info" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(5)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" string   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee_info" PRIMARY KEY (
        "emp_no"
     )
);

-- Create table for salaries.csv
CREATE TABLE "employee_salaries" (
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL,
    CONSTRAINT "pk_employee_salaries" PRIMARY KEY (
        "emp_no"
     )
);

-- Create table for titles.csv
CREATE TABLE "employee_titles" (
    "title_id" varchar(5)   NOT NULL,
    "title" varchar(50   NOT NULL,
    CONSTRAINT "pk_employee_titles" PRIMARY KEY (
        "title_id"
     )
);

-- Create table for dept_emp.csv
CREATE TABLE "employee_department" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(4)   NOT NULL,
    CONSTRAINT "pk_employee_department" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

-- Create table for department
CREATE TABLE "department" (
    "dept_no" varchar(4)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     ),
    CONSTRAINT "uc_department_dept_name" UNIQUE (
        "dept_name"
    )
);

-- Create table for dept_manager.csv
CREATE TABLE "manager_department" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(4)   NOT NULL,
    CONSTRAINT "pk_manager_department" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

ALTER TABLE "employee_info" ADD CONSTRAINT "fk_employee_info_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "employee_titles" ("title_id");

ALTER TABLE "employee_salaries" ADD CONSTRAINT "fk_employee_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee_info" ("emp_no");

ALTER TABLE "employee_department" ADD CONSTRAINT "fk_employee_department_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee_info" ("emp_no");

ALTER TABLE "department" ADD CONSTRAINT "fk_department_dept_no" FOREIGN KEY("dept_no")
REFERENCES "employee_department" ("dept_no");

ALTER TABLE "manager_department" ADD CONSTRAINT "fk_manager_department_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee_info" ("emp_no");

ALTER TABLE "manager_department" ADD CONSTRAINT "fk_manager_department_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");


-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
--creating all tables and constraints

CREATE TABLE departments (
     dept_no VARCHAR(30) NOT NULL,
     dept_name VARCHAR(30) NOT NULL);

CREATE TABLE dept_emp (
     emp_no INT NOT NULL,
     dept_no VARCHAR(30) NOT NULL,
     from_date VARCHAR(10) NOT NULL,
     to_date VARCHAR(10) NOT NULL);

CREATE TABLE employees (
     emp_no INT NOT NULL,
     birth_date VARCHAR(10) NOT NULL,
     first_name VARCHAR(30) NOT NULL,
     last_name VARCHAR(30) NOT NULL,
	 gender VARCHAR(10) NOT NULL,
     hire_date VARCHAR(10) NOT NULL);

CREATE TABLE dept_manager (
     dept_no VARCHAR NOT NULL,
     emp_no INT NOT NULL,
     from_date VARCHAR(10) NOT NULL,
     to_date VARCHAR(10) NOT NULL);
	 
SELECT * FROM dept_manager

CREATE TABLE salaries (
     emp_no INT NOT NULL,
     salary INT NOT NULL,
     from_date VARCHAR(10) NOT NULL,
     to_date VARCHAR(10) NOT NULL
);

CREATE TABLE titles (
     emp_no INT NOT NULL,
     title VARCHAR(30) NOT NULL,
     from_date VARCHAR(10) NOT NULL,
     to_date VARCHAR(10) NOT NULL);
	

ALTER TABLE departments ADD CONSTRAINT fk_departments_dept_no FOREIGN KEY(dept_no)
REFERENCES dept_manager (dept_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no_dept_no FOREIGN KEY(emp_no, dept_no)
REFERENCES dept_manager (emp_no, dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

CREATE INDEX idx_dept_emp_emp_no
ON dept_emp (emp_no);

CREATE INDEX idx_dept_emp_dept_no
ON dept_emp (dept_no);

CREATE INDEX idx_dept_manager_emp_n
ON dept_manager (emp_no);

CREATE INDEX idx_salaries_emp_no
ON salaries (emp_no);

CREATE INDEX idx_titles_emp_no
ON titles (emp_no);


--DISPLAYING ALL TABLES CREATED

SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT * FROM dept_manager;

SELECT * FROM employees;

SELECT * FROM salaries;

SELECT * FROM titles;




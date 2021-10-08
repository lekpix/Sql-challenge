--Creating table 'title'
CREATE TABLE titles (title_id varchar(10) PRIMARY KEY,
					title varchar(20));

SELECT * FROM titles;

--Creating table 'departments'
CREATE TABLE departments (dept_no varchar(4) PRIMARY KEY,
						 dept_name varchar(20));

SELECT * FROM departments;

--Creating table 'employees'
CREATE TABLE employees (emp_no int PRIMARY KEY,
						emp_title varchar(10), 
						birth_date date,
						first_name varchar(30),
						last_name varchar(30),	
						sex varchar(5),
						hire_date date,
						FOREIGN KEY (emp_title) REFERENCES titles(title_id)
					   );

SELECT * FROM employees;

--Creating table  'salaries'
CREATE TABLE salaries (
						emp_no int,
						salary float,
						FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
						);
						
SELECT * FROM salaries;

--Creating table 'dept_manager'
CREATE TABLE dept_manager (dept_no varchar(4),
						    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
							emp_no int ,
						    FOREIGN KEY(emp_no)REFERENCES employees(emp_no)
						   )

SELECT * FROM dept_manager;

--Creating table 'dept_emp'
CREATE TABLE dept_emp (emp_no int,
					   FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
					   dept_no varchar(4) ,
					   FOREIGN KEY (dept_no)REFERENCES departments(dept_no)
					   );

SELECT * FROM dept_emp;

---------------------------------------------------------------------------


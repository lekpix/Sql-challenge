--Data Analysis
--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no AS "Employee Number",
		employees.first_name AS "First Name",
		employees.last_name AS "Last Name",
		employees.sex AS "Gender",
		salaries.salary AS "Salary"
FROM employees 
INNER JOIN salaries 
ON employees.emp_no =salaries.emp_no;
--Testing a sample
SELECT * FROM employees WHERE emp_no=10639;
---------------------------------------------------------------------------------------------------------
--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,last_name,hire_date 
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date)=1986
ORDER BY hire_date;

---Testing how to extract year 
SELECT EXTRACT(YEAR FROM hire_date) AS year1 FROM employees;

-------------------------------------------------------------------------------------------------
--List the manager of each department with the following information: department number,
--department name,the manager's employee number, last name, first name.
SELECT dept_manager.dept_no AS "Department Number",
		departments.dept_name AS "Department Name",
		dept_manager.emp_no AS "Employee Number",
		employees.first_name AS "First Name",
		employees.last_name AS "Last Name"
FROM dept_manager
INNER JOIN departments ON departments.dept_no=dept_manager.dept_no
INNER JOIN employees ON employees.emp_no=dept_manager.emp_no
;

----------------------------------------------------------------------------------------------------
--List the department of each employee with the following information: employee number, last name,
--first name, and department name.
SELECT employees.emp_no AS "Employee Number",
		employees.first_name AS "First Name",
		employees.last_name AS "Last Name",
		departments.dept_name AS "Deparment Name"
FROM employees
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
;

--------------------------------------------------------------------------------------------------------
--List first name, last name, and sex for employees whose first name is "Hercules" and last names
--begin with "B."
SELECT first_name AS "First Name",
		last_name AS "Last Name",
		sex AS "Gender"
FROM employees 
WHERE first_name='Hercules' AND last_name like 'B%';

-----------------------------------------------------------------------------------------------------
--List all employees in the Sales department, including their employee number, last name, first name,
--and department name.
SELECT employees.emp_no AS "Employee Number",
		employees.first_name AS "First Name",
		employees.last_name AS "Last Name",
		departments.dept_name AS "Department Name" 
FROM employees 
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';

---Testing data from sales department
SELECT dept_no FROM departments WHERE dept_name='Sales';

---------------------------------------------------------------------------------------------------
--List all employees in the Sales and Development departments, including their employee number,
--last name, first name, and department name.
SELECT employees.emp_no AS "Employee Number",
		employees.first_name AS "First Name",
		employees.last_name AS "Last Name",
		departments.dept_name AS "Department Name"
FROM employees 
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales' OR departments.dept_name='Development';

---Testing sample in Sales and Development departments
SELECT * FROM departments WHERE dept_name='Sales' OR departments.dept_name='Development';

--------------------------------------------------------------------------------------------------------
--In descending order, list the frequency count of employee last names, i.e., how many employees 
--share each last name.

SELECT last_name AS "Last Name",COUNT(last_name) AS "Frequncy Counts"
FROM employees 
GROUP BY last_name
ORDER BY "Frequncy Counts" DESC;


---------------------------------------------------------------------------------------------------------
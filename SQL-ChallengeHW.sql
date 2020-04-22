SELECT * FROM employees
SELECT * FROM departments
SELECT * FROM dept_manager
SELECT * FROM dept_emp
SELECT * FROM titles
SELECT * FROM salaries

--1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
SELECT  e.emp_no AS "Employee Number",
		e.first_name AS "First Name",
		e.last_name AS "Last Name",
		e.gender AS "Gender",
		s.salary AS "Salary"
FROM employees AS e
LEFT JOIN salaries AS s ON
s.emp_no=e.emp_no
ORDER BY e.emp_no

--2. List employees who were hired in 1986.
SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31' 
--GROUP BY hire_date 

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.

SELECT  e.emp_no AS "Employee Number",
		e.first_name AS "First Name",
		e.last_name AS "Last Name",
		e.hire_date AS "Employee Hire Date",
		d.dept_name AS "Department Name",
		dm.dept_no AS "Department Number",
		dm.emp_no AS "Managers Employee Number",
		dm.from_date AS "Hired Date",
		dm.to_date AS "Last Day Date"
FROM dept_manager AS dm
	INNER JOIN departments AS d
		ON(dm.dept_no=d.dept_no)
	INNER JOIN employees AS e
		ON(dm.emp_no=e.emp_no)


--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT  e.emp_no AS "Employee Number",
		e.first_name AS "First Name",
		e.last_name AS "Last Name",
		d.dept_name AS "Department Name"
		--de.dept_no AS "Department Number"
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON(e.emp_no=de.emp_no)
	INNER JOIN departments AS d
		ON(de.dept_no=d.dept_no)
ORDER BY e.emp_no;



--5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

SELECT  e.emp_no AS "Employee Number",
		e.first_name AS "First Name",
		e.last_name AS "Last Name",
		d.dept_name AS "Department Name"
		--de.dept_no AS "Department Number"
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON(e.emp_no=de.emp_no)
	INNER JOIN departments AS d
		ON(de.dept_no=d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;


--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT  e.emp_no AS "Employee Number",
		e.first_name AS "First Name",
		e.last_name AS "Last Name",
		d.dept_name AS "Department Name"
		--de.dept_no AS "Department Number"
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON(e.emp_no=de.emp_no)
	INNER JOIN departments AS d
		ON(de.dept_no=d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY d.dept_name DESC


--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, COUNT (last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) 


-- Extra Credit
SELECT * FROM employees
WHERE emp_no = 499942



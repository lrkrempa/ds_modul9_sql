--1. Employee number, last name, first name, sex, salary
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
	employees e 
	join salaries s on e.emp_no = s.emp_no
Order by
	e.last_name ASC,
	s.salary DESC;

--2. List the first name, last name, and hire date of employees who were hired in 1986
SELECT
	e.first_name,
	e.last_name
	e.hire_date
FROM
	employees e
WHERE
	e. hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY
	e.hire_date ASC;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT
	d.dept_no,
	d.dept_name, 
	e.emp_no,
	e.last_name, 
	e.first_name
FROM
	departments d
JOIN
	employees e ON d.manager_id = e.emp_no
ORDER BY
	d.department_id ASC,
	e.last_name DESC;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_no, 
	d.dept_name
FROM
	employees e
JOIN
	departments d ON e.dept_no = d.dept_no
ORDER BY
	d.dept_no ASC,
	e.last_name DESC;

--5. First name, last name, sex of each employee whose first name is Hercules and last name begins with B
SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM
	employees e
WHERE
	e.first_name = 'Hercules'
	and e.last_name like 'B%'
ORDER BY
	e.last_name ASC,
	e.first_name ASC;

--6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT
	e.emp_no,
	e.last_name,
	e.first_name
FROM
	employees
WHERE
	dept_no = (SELECT dept_no FROM departments WHERE dept_name = 'Sales')
ORDER BY 
	e.last_name ASC;

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT
	e.emp_no,
	e.last_name, 
	e.last_name, 
	e.first_name,
	d.dept_name
FROM 
	employees e
JOIN
	departments d ON e.dept_no = d.dept_no
WHERE
	d.dept_name IN ('Sales', 'Development')
ORDER BY
	e.last_name ASC;

--8. List the frequency counts, in descending order, of all the employee last names 
SELECT
	e.last_name,
	count(e.emp_no) as num_last_name
FROM
	employees e
GROUP BY
	e.last_name
ORDER BY
	num_last_name ASC;

-- select * from departments
-- select * from titles
-- select * from employees
-- select * from salaries
-- select * from dep_manager
-- select * from dep_emp

-- Query #1: List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
FROM employees
JOIN salaries
ON (employees.emp_no = salaries.emp_no)

-- Query #2: List first name, last name, and hire date for employees who were hired in 1986.
SELECT last_name, first_name, hire_date FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

-- Query #3: List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
SELECT dep_manager.dept_no, departments.dept_name, dep_manager.emp_no, last_name, first_name 
FROM dep_manager
JOIN departments
ON (dep_manager.dept_no = departments.dept_no)
JOIN employees
ON (dep_manager.emp_no = employees.emp_no)

-- Query #4: List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dep_emp.emp_no, last_name, first_name, dept_name 
FROM dep_emp
JOIN employees
ON (dep_emp.emp_no = employees.emp_no)
JOIN departments
ON (dep_emp.dept_no = departments.dept_no)

-- Query #5: List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%' 

-- Query #6: List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dep_emp.emp_no, last_name, first_name, dept_name 
FROM dep_emp
JOIN employees
ON (dep_emp.emp_no = employees.emp_no)
JOIN departments
ON (dep_emp.dept_no = departments.dept_no)
WHERE dep_emp.dept_no = 'd007'

-- Query #7: List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dep_emp.emp_no, last_name, first_name, dept_name 
FROM dep_emp
JOIN employees
ON (dep_emp.emp_no = employees.emp_no)
JOIN departments
ON (dep_emp.dept_no = departments.dept_no)
WHERE dep_emp.dept_no = 'd007' OR dep_emp.dept_no = 'd005'

-- Query #8: List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT(last_name) as "frequency"
FROM employees
GROUP BY last_name
ORDER BY "frequency" DESC




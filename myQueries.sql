-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e, salaries AS s
WHERE e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.

SELECT hire_date, last_name, first_name
FROM employees
WHERE hire_date like '1986%';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM departments AS d, dept_manager AS dm, employees AS e
WHERE d.dept_no = dm.dept_no
AND dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e, dept_emp AS de, departments AS d
WHERE e.emp_no = de.emp_no
AND  de.dept_no = d.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e, dept_emp AS de, departments AS d
WHERE e.emp_no = de.emp_no
AND de.dept_no = d.dept_no
AND d.dept_name='Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e, dept_emp AS de, departments AS d
WHERE e.emp_no = de.emp_no
AND de.dept_no = d.dept_no
AND d.dept_name IN ('Sales','Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT count(*), last_name
FROM employees
GROUP BY last_name
ORDER BY 1 DESC;

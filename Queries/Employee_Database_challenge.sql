-- Create new table for retiring employees
SELECT employees.emp_no, 
		employees.first_name, 
		employees.last_name, 
		titles.title, 
		titles.from_date, 
		titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no

-- Check the table
SELECT * FROM retirement_titles;

- Use Dictinct with Orderby to remove duplicate rows


SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(titles)
FROM unique_titles
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;

SELECT * FROM retiring_titles;

SELECT DISTINCT ON (emp_no) employees.emp_no, 
		first_name, 
		last_name, 
		birth_date, 
		dep_employees.from_date,
		dep_employees.to_date,
		title
INTO mentorship_eligibilty
FROM employees
INNER JOIN dep_employees
ON (employees.emp_no = dep_employees.emp_no)
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no

SELECT * FROM mentorship_eligibilty;

# Pewlett Hackard Analysis

## Overview:

The purpose of this analysis is to use SQL to help prepare a company for the mass retirement of their employees by identifying the number of employees retiring by job title and identifying who could be placed in a new employee mentorship program.

## Results:

* The Retirement Titles table indicates the total number of employees who are eligible to retire and how long they have worked in each position.

*  The Retiring Titles table indicates the number of people retiring from each department. It shows that the department most impacted by the labor shortage will be senior engineers and staff, and the least impacted will be managers.

<img width="162" alt="Screen Shot 2021-12-09 at 5 36 35 PM" src="https://user-images.githubusercontent.com/92963227/145492481-7eb617b7-17a8-40e1-b5b7-00038bc8c1fb.png">

* From the Mentorship Eligibility Table, it is clear that there is a large pool of employees who were born between January 1, 1965, and December 31, 1965, to join the mentorship program.

* The Unique Titles table shows the most recent job titles employees who are retiring have held.

## Summary:
How many roles will need to be filled as the "silver tsunami" begins to make an impact?
There are 90,398 roles that will need to be filled as the "silver tsunami" makes an impact. 

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
No, there are not enough retirement-ready employees in the department who are prepared to mentor the next generation of employees. 90,398 must be filled, and only 1,940 employees are currently eligible to serve as mentors. We can further see this impact by reviewing the number of mentors who will be available in each department. 

To find this information, I wrote an additional query as follows:

```
SELECT COUNT(title), title
INTO mentorship_by_title
FROM mentorship_eligibilty
GROUP BY title
ORDER BY count(title) DESC;
```

Unfortunately, the resulting table, pictured below, indicated that the largest number of employees available for mentorship are engineers, not senior engineers, so those available for mentorship do not exactly meet the company's mentorship needs. There are only 352 senior engineers available for mentorship and 29,414 who will be leaving the company.

<img width="205" alt="Screen Shot 2021-12-09 at 5 42 58 PM" src="https://user-images.githubusercontent.com/92963227/145493080-943eb76c-c858-48dd-9252-158086fa1247.png">

The good news is, most of the employees who are not retiring are currently engineers, with 73,974 engineers left after the "silver tsunami." Hopefully, these employees will be able to mentor new engineers and will soon move into senior engineers roles to fill the gap.

I found this information by writing a query first to determine how many employees are not retiring by filtering the table for those born after 1956 and then counting the number of employees who are not retiring by department:

```
SELECT DISTINCT ON (emp_no) employees.emp_no, 
		first_name, 
		last_name, 
		birth_date, 
		dep_employees.from_date,
		dep_employees.to_date,
		title
INTO employees_not_retiring
FROM employees
INNER JOIN dep_employees
ON (employees.emp_no = dep_employees.emp_no)
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1956-01-01' AND '2021-12-31')
ORDER BY emp_no

SELECT COUNT(title), title
INTO employees_not_retiring_dept
FROM employees_not_retiring
GROUP BY title
ORDER BY count(title) DESC;

```


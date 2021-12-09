# Pewlett Hackard Analysis

## Overview:

The purpose of this analysis is to use SQL to help prepare a company for mass retirment of their employees by identifying the number of employees retiring by job title and identify who could be placed in a new employee mentorship program.

## Results:

* The Retiring Titles table indicates that the department most impacted by the labor shortage will be senior engineers and staff, and least impacted will be managers.

<img width="162" alt="Screen Shot 2021-12-09 at 5 36 35 PM" src="https://user-images.githubusercontent.com/92963227/145492481-7eb617b7-17a8-40e1-b5b7-00038bc8c1fb.png">


* From the Mentorship Elegibility Table, it is clear that there is a large pool of employees who were born between January 1, 1965 and December 31, 1965 to join the mentorship program.

* 

## Summary:
How many roles will need to be filled as the "silver tsunami" begins to make an impact?
There are 90,398 roles that need to be filled as the "silver tsunami" makes an impact. 

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
No, there are not enough retirement-ready employees in the department who are prepared to mentor the next generation of employees. 90,398 must be filled and only 1,940 employees are currently eligable to serve as mentors. We can further see this impact by reviewing the number of mentors who will be available in each department. 

To find this information, I wrote an additional query as follows:
SELECT COUNT(title), title
INTO mentorship_by_title
FROM mentorship_eligibilty
GROUP BY title
ORDER BY count(title) DESC;

Unfortunatly, the resulting table, pictered below, indicated that the largest number of employees avaiable for mentorship are engineers, not senior engineers, so those avaiable for mentorship do not exactly meet the company's mentorship needs. There are only 352 senior engineers available for mentorship, and 29,414 who will be leaving the company.

<img width="205" alt="Screen Shot 2021-12-09 at 5 42 58 PM" src="https://user-images.githubusercontent.com/92963227/145493080-943eb76c-c858-48dd-9252-158086fa1247.png">


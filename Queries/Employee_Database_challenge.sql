-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table
SELECT emp_no, first_name, last_name
FROM employees

-- 2. Retrieve the title, from_date, and to_date columns from the Titles table
SELECT title, from_date, to_date
FROM titles

-- 3. Create a new table using the INTO clause
-- 4. Join both tables on the primary key
SELECT employees.emp_no,
    employees.first_name,
    employees.last_name,
    titles.title,
    titles.from_date,
    titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no


-- 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number

WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- 8. Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE (retirement_titles.to_date = '9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

-- 9. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table

SELECT emp_no, first_name, last_name, title
FROM retirement_titles

-- 10. Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause
SELECT DISTINCT ON (emp_no)

-- 11. Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
WHERE (retirement_titles.to_date = '9999-01-01')

-- 12. Create a Unique Titles table using the INTO clause
INTO unique_titles

-- 13. Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title
Order BY emp_no ASC, to_date DESC;

-- 16. Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.

-- 17. First, retrieve the number of titles from the Unique Titles table.
SELECT COUNT (unique_titles.title),
	unique_titles.title

-- 18. Then, create a Retiring Titles table to hold the required information.
INTO retiring_titles
FROM unique_titles
-- 19. Group the table by title, then sort the count column in descending order.
GROUP BY unique_titles.title
ORDER BY COUNT(unique_titles.title) DESC;

--DELIVERABLE 2

-- 1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
SELECT emp_no, first_name, last_name, birth_date from_date
FROM employees

-- 2. Retrieve the from_date and to_date columns from the Department Employee table.

SELECT from_date, to_date
FROM dept_emp

-- 3. Retrieve the title column from the Titles table.
SELECT title
FROM titles

-- 4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp_no)
-- 5. Create a new table using the INTO clause.
INTO mentorship_eligibilty

-- 6. Join the Employees and the Department Employee tables on the primary key.

JOIN 
ON employees.emp_no = dept_emp


-- 7. Join the Employees and the Titles tables on the primary key.

JOIN 
ON employees.emp_no = titles.emp_no

-- 8. Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.

WHERE (dept_emp.to_date = '9999-01-01')
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')

-- 9. Order the table by the employee number.
ORDER BY emp_no ASC

-- FULL DELIVERABLE TWO FORMULA
SELECT DISTINCT ON (emp_no) employees.emp_no,
	employees.first_name, 
    employees.last_name, 
    employees.birth_date,
    dept_emp.from_date,
    dept_emp.to_date,
    titles.title

INTO mentorship_eligibilty
FROM employees
	INNER JOIN dept_emp
		ON (employees.emp_no = dept_emp.emp_no)
	INNER JOIN titles
		ON (employees.emp_no = titles.emp_no)
	
WHERE (dept_emp.to_date = '9999-01-01') AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;



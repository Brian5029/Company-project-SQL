-- real life scenario
# Find out the manager of each location
SELECT employee.emp_id, employee.f_name,employee.l_name, 
location.manager_id, location.state
FROM employee
JOIN location
ON employee.emp_id = location.manager_id;

# add new location
INSERT INTO location(location_id, state, manager_id, manager_start_date)
VALUES (4, 'MD', NULL, NULL);

# selecting new manager
UPDATE location
SET manager_id = 18,
manager_start_date = '2009-04-28'
WHERE location_id = 4;
# when updating table, the where clause should be the primary key of the table
# since manger_id is a reference to employee table (emp_id), the manager_id assigned must be in employee table
# mgr_start_date can be set to whatever since the column is not referenced by any table

# emp_id 12(manager) decideds to leave
DELETE FROM employee
WHERE emp_id = 12;
SELECT * FROM employee;

# emp_id 13 becomes the manager
# we first assign emp_id 13 as manager in location
UPDATE location
SET manager_id = 13,
manager_start_date = '2012-05-28'
WHERE location_id = 2;

# Set manager id to those who lost one
UPDATE employee SET supervisor_id = 13 WHERE emp_id = 14;
UPDATE employee SET supervisor_id = 13 WHERE emp_id = 15;
UPDATE employee SET supervisor_id = 10 WHERE emp_id = 13;

# who has salary higher than 400000
SELECT COUNT(salary) as elite_pay
FROM employee
WHERE salary > 400000;

# find employees joinedmbetween 1995-1999
SELECT * FROM employee WHERE joined_date
BETWEEN '1995-01-01' AND '2000-01-01';

-- basic query
# Retrieve a list of employees ordered by department ID.
SELECT f_name, l_name, location_id
FROM employee
ORDER BY location_id;

# Retrieve the number of employees in the department, and the average employee salary in the department and order by avg salary
SELECT location_id, COUNT(*) AS "NUM_EMPLOYEES", AVG(salary) AS "AVG_SALARY"
FROM employee
GROUP BY location_id
ORDER BY AVG_SALARY;

# retrieve all employees records whose salary is lower than the average salary.
SELECT emp_id, f_name, l_name, salary 
FROM employee 
WHERE salary < (SELECT AVG(salary) 
                FROM employee);

# Retrieve the list of employees whos spendings are greater than 400000 
# Employee records corresponds to emp_id in the epdnings table.
SELECT *
FROM employee
WHERE employee.emp_id IN 
	(SELECT spendings.emp_id FROM spendings WHERE total_spending < 400000);
    
# Retrieve female employee who joined the company before 1990  
SELECT *
FROM employee
WHERE joined_date < '1990-01-01' AND SEX = 'F';
    
# Retrieve the manager data ordering by highest salary
SELECT emp_id, f_name, l_name, salary
FROM employee
WHERE employee.emp_id in
	(SELECT location.manager_id FROM location)
ORDER BY salary DESC;

# Find out the sum of employees salary grouping by sex
SELECT sex, sum(salary)
FROM employee
GROUP BY sex;



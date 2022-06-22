DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS spendings;
DROP TABLE IF EXISTS supplier;

CREATE TABLE employee (
emp_id INT PRIMARY KEY,
f_name VARCHAR(40),
l_name VARCHAR(40),
joined_date DATE,
sex VARCHAR(1),
salary INT,
supervisor_id INT,
location_id INT
); #sup & branch id is foreign key but we cannot assign it yet
  #since employee and branch table does not exist yet


#foreign key has to be primary key of parent table
CREATE TABLE location(
location_id INT PRIMARY KEY,
state VARCHAR(40),
manager_id INT,
manager_start_date DATE,
FOREIGN KEY (manager_id) REFERENCES employee(emp_id) ON DELETE SET NULL
); # manager_id is employee_id of employee table

# now that the location table has been created we can
# add add assign foreign key by altering the table
ALTER TABLE employee
ADD FOREIGN KEY(location_id)
REFERENCES location(location_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(supervisor_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE supplier (
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(40),
location_id INT,
FOREIGN KEY(location_id) REFERENCES location(location_id) ON DELETE SET NULL
);

CREATE TABLE spendings(
emp_id INT,
supplier_id INT,
total_spending INT,
PRIMARY KEY(emp_id, supplier_id),
#two primary key means there cant be a row where two values are the same
FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id) ON DELETE CASCADE
);





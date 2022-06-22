#We insert the info of the manager in the employee table first because
#emp_id is needed to insert branch info since manager_id is a foregin key of employee table

-- CA location
INSERT INTO employee VALUES(10,'joey','tucker', '1999-05-21', 'M', 520000, NULL, NULL);
# We set the last two columns to null because those are foregin keys
# and it has not been created yet
INSERT INTO location VALUES(1, 'CA', 10, '1995-09-15');
# Now that the values in branch table has been added, we can update
# employee table and use the inserted value
UPDATE employee
SET location_id = 1
WHERE emp_id = 10;
#location_id can only be set to 1 because thats the only value in location currently

INSERT INTO employee VALUES(11, 'eva','leach', '1991-10-11', 'F',440000, 10, 1);

-- TX location
INSERT INTO employee VALUES(12, 'jaylon', 'miles', '1984-02-25', 'M', 350000, 10, NULL);

INSERT INTO location VALUES(2, 'TX', 12, '2003-04-06');

UPDATE employee
SET location_id = 2
WHERE emp_id = 12;

INSERT INTO employee VALUES(13, 'katie', 'luna', '1994-08-05','F', 230000, 12, 2);
INSERT INTO employee VALUES(14, 'michelle', 'chen', '1996-09-03', 'F', 255000, 12, 2);
INSERT INTO employee VALUES(15, 'pranav', 'collins', '1999-01-13', 'M',219000, 12, 2);

-- WA location
INSERT INTO employee VALUES(16, 'andrew', 'barr', '1989-03-25','M',380000, 10, NULL);

INSERT INTO location VALUES(3, 'WA', 16, '2000-11-13');

UPDATE employee
SET location_id = 3
WHERE emp_id = 16;

INSERT INTO employee VALUES(17, 'junior', 'hurst', '1993-10-12','M',250000,16,3);
INSERT INTO employee VALUES(18, 'carmen', 'singh', '1998-11-09', 'M', 271000, 16,3);

-- Supplier Table
INSERT INTO supplier VALUES(20, 'company A',3);
INSERT INTO supplier VALUES(21, 'company B', 3);
INSERT INTO supplier VALUES(22, 'company C', 3);
INSERT INTO supplier VALUES(23, 'company D', 3);
INSERT INTO supplier VALUES(24, 'company E', 2);
INSERT INTO supplier VALUES(25, 'company F', 2);


-- Spendings_Table
INSERT INTO spendings VALUES(11,20,425000);
INSERT INTO spendings VALUES(14,21,392000);
INSERT INTO spendings VALUES(18,22,928300);
INSERT INTO spendings VALUES(17,23,400230);
INSERT INTO spendings VALUES(15,24,343000);
INSERT INTO spendings VALUES(11,25,602000);


/*2
a*/
/* SELECT * FROM employee WHERE job_code = '501'; */

/*b*/
/*SELECT * FROM employee WHERE job_code BETWEEN '501' AND '506'
ORDER BY job_code; */

/*c*/
/* SELECT * FROM project WHERE proj_name like 'R%';*/

/*d*/
/*SELECT * FROM employee WHERE emp_hiredate > '31/12/2000';*/

/*e*/
/*SELECT count (*) from employee;*/

/*f*/
/*SELECT emp_fname, emp_lname FROM employee INNER JOIN project ON employee.emp_num = project.emp_num;
*/

/*g*/
/*
SELECT DISTINCT J.job_code, J.job_description 
FROM job J INNER JOIN employee E
on J.job_code = E.job_code;
*/


/*h*/
/*
SELECT DISTINCT emp_fname , emp_lname 
FROM employee e NATURAL JOIN assignment a
WHERE a.proj_num = '18';
*/

/*i*/
/*
SELECT DISTINCT emp_fname , emp_lname 
FROM employee e NATURAL JOIN project p
WHERE p.proj_name = 'Evergreen';
*/

/*j*/
/*
SELECT DISTINCT proj_name
FROM project p NATURAL JOIN employee, assignment
WHERE assignment.proj_num = p.proj_num;
*/

--k
SELECT e.emp_fname, e.emp_lname, a.assign_hours
FROM employee e INNER JOIN assignment a 
ON a.emp_num = e.emp_num






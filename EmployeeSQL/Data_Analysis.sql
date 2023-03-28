---------------------------------------DATA ANALYSIS--------------------------------------------------

---Q1 List the employee number, last name, first name, sex, and salary of each employee.---
--SELECT * FROM "Employees"
--SELECT * FROM "Salaries"

SELECT e.emp_no, last_name, first_name, sex, salary
FROM "Employees" as e
INNER JOIN "Salaries" as s
ON e.emp_no = s.emp_no;



---Q2 List the first name, last name, and hire date for the employees who were hired in 1986.---
--SELECT * FROM "Employees"

SELECT first_name, last_name, hire_date
From "Employees"
WHERE hire_date >= '1986-01-01' and hire_date <= '1986-12-31';                                                                                                 



---Q3 List the manager of each department along with their department number, department name, employee number, last name, and first name.---
--SELECT * FROM "Dept_manager"
--SELECT * FROM "Departments"
--SELECT * FROM "Employees"

SELECT "Dept_manager".dept_no, "Departments".dept_name, "Employees".emp_no, "Employees".last_name, "Employees".first_name
FROM "Dept_manager"
LEFT JOIN "Employees"
ON "Employees".emp_no = "Dept_manager".emp_no
LEFT JOIN "Departments"
ON "Dept_manager".dept_no = "Departments".dept_no



---Q4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.---
--SELECT * FROM "Employees"
--SELECT * FROM "Departments"
--SELECT * FROM "Dept_emp"

SELECT "Dept_emp".dept_no, "Employees".emp_no, "Employees".last_name, "Employees".first_name,"Departments".dept_name
FROM "Dept_emp"
LEFT JOIN "Employees"
ON "Employees".emp_no = "Dept_emp".emp_no
LEFT JOIN "Departments"
ON "Dept_emp".dept_no = "Departments".dept_no



---Q5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.---
--SELECT * FROM "Employees"

SELECT "first_name", "last_name",  "sex"
FROM "Employees"
WHERE "first_name" = 'Hercules' AND last_name LIKE 'B%';


---Q6 List each employee in the Sales department, including their employee number, last name, and first name.---
--SELECT * FROM "Employees"
--SELECT * FROM "Departments"
--SELECT * FROM "Dept_emp"

SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
INNER JOIN "Dept_emp" ON "Dept_emp".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON "Departments".dept_no = "Dept_emp".dept_no
WHERE "Departments".dept_name = 'Sales';



---Q7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.---
--SELECT * FROM "Employees"
--SELECT * FROM "Departments"
--SELECT * FROM "Dept_emp"

SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
INNER JOIN "Dept_emp" ON "Dept_emp".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON "Departments".dept_no = "Dept_emp".dept_no
--WHERE "Departments".dept_name = 'Sales' OR "Departments".dept_name = 'Development';
WHERE "Departments".dept_name in ('Sales', 'Development')


---Q8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).---
--SELECT * FROM "Employees"

SELECT last_name, COUNT(last_name) AS Last_Name_Count
FROM "Employees"
GROUP BY last_name
ORDER BY Last_Name_Count DESC;
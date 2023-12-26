-- DATA ANALYSIS --------------

Select * from departments LIMIT 10;
Select * from dept_emp LIMIT 10;
Select * from dept_manager LIMIT 10;
Select * from employees LIMIT 10;
Select * from salaries LIMIT 10;
Select * from titles LIMIT 10;

--1. List the employee number,last name,first_name,sex and salary of each employee
Select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from employees e
inner join salaries s
on s.emp_no=e.emp_no;


--2.List the first name, last name, and hire date for the employees who were hired in 1986.
Select e.first_name,e.last_name,e.hire_date
from employees e
where hire_date>'1985-12-31' and hire_date<'1987-01-01';
--dates are selected to reflect any employee in 1986


--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select dm.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name
from employees e
inner join dept_manager dm
on dm.emp_no=e.emp_no
--department manager and employee table share the emp_no column
inner join departments d
on dm.dept_no=d.dept_no;
--departments and department manager table share the dept_no column


--4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select d.dept_no,e.emp_no,e.last_name,e.first_name,d.dept_name
from employees e
inner join dept_manager dm
on dm.emp_no=e.emp_no
--department manager and employee table share the emp_no column
inner join departments d
on d.dept_no=dm.dept_no;
--departments and department manager table share the dept_no column


--5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select e.first_name,e.last_name,e.sex
from employees e
where first_name='Hercules' and last_name LIKE 'B%';


--6 List each employee in the Sales department, including their employee number, last name, and first name.
select d.dept_name,e.emp_no,e.last_name,e.first_name
from employees e
inner join dept_manager dm
on dm.emp_no=e.emp_no
inner join departments d
on dm.dept_no=d.dept_no
where d.dept_name LIKE '%Sales%';
--Where used to filter dept_name by employees in the sales department

--7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees e
inner join dept_manager dm
on dm.emp_no=e.emp_no
inner join departments d
on dm.dept_no=d.dept_no
where d.dept_name LIKE '%Sales%' or d.dept_name LIKE '%Development%'
--same as above query,but also inclused those in the development department

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name,count(last_name)
from employees 
group by last_name
order by count(last_name) DESC;

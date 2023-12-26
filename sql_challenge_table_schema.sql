Create Table departments(
dept_no VARCHAR(255) NOT NULL PRIMARY KEY,
dept_name VARCHAR(255)
);

Create Table titles(
title_id VARCHAR(255) NOT NULL PRIMARY KEY,
title VARCHAR(255) NOT NULL
);


Create Table employees(
emp_no INT NOT NULL PRIMARY KEY,
emp_title VARCHAR(255) NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
sex VARCHAR(255),
hire_date DATE NOT NULL,
FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);


Create Table dept_emp(
emp_no INT NOT NULL,
dept_no VARCHAR(255) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

Create Table dept_manager(
dept_no VARCHAR(255) NOT NULL,
emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

Create Table salaries(
emp_no INT NOT NULL,
salary INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

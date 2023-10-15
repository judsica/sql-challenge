-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/D1M4Yp
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Physical

CREATE TABLE "dep_emp" (
    "emp_no" INT,   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_dep_emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no","dept_name"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id","title"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" money   NOT NULL
);

ALTER TABLE "dep_emp" ADD CONSTRAINT "fk_dep_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dep_emp" ADD CONSTRAINT "fk_dep_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title_id" FOREIGN KEY("title_id")
REFERENCES "employees" ("emp_title_id");

SELECT * FROM Public."dept_emp";
SELECT * FROM Public."employees";
SELECT * FROM Public."departments";
SELECT * FROM Public."titles";
SELECT * FROM Public."salaries";

COPY Public."dept_emp"("emp_no", dept_no)
FROM 'C:\Users\judy6\Downloads\challenge9\Starter_Code\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY Public."employees"("emp_no", emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM 'C:\Users\judy6\Downloads\challenge9\Starter_Code\data\employees.csv'
DELIMITER ','
CSV HEADER;

COPY Public."departments"("dept_no", dept_name)
FROM 'C:\Users\judy6\Downloads\challenge9\Starter_Code\data\departments.csv'
DELIMITER ','
CSV HEADER;

COPY Public."titles"("title_id", title)
FROM 'C:\Users\judy6\Downloads\challenge9\Starter_Code\data\titles.csv'
DELIMITER ','
CSV HEADER;

COPY Public."salaries"("emp_no", salary)
FROM 'C:\Users\judy6\Downloads\challenge9\Starter_Code\data\salaries.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM Public."dept_emp";
SELECT * FROM Public."employees";
SELECT * FROM Public."departments";
SELECT * FROM Public."titles";
SELECT * FROM Public."salaries";

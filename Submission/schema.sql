CREATE TABLE IF NOT EXISTS "departments" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
	);

CREATE TABLE IF NOT EXISTS "employees" (
    "emp_no" INTEGER NOT NULL,
    "emp_title" VARCHAR(5) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(150) NOT NULL,
    "last_name" VARCHAR(200) NOT NULL,
    "sex" VARCHAR(5) NOT NULL,
    "hire_date" DATE NOT NULL,
    "last_updated" TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);

CREATE TABLE IF NOT EXISTS "salaries" (
    "emp_no" INTEGER NOT NULL,
    "salary" INTEGER NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL,
    "last_updated" TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no", "from_date"),
    FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE IF NOT EXISTS "dept_manager" (
    "dept_no" VARCHAR(4) NOT NULL,
    "emp_no" INTEGER NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL,
    "last_updated" TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_no", "emp_no", "from_date"),
    FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);
	
CREATE TABLE IF NOT EXISTS "dept_emp" (
    "emp_no" INTEGER NOT NULL,
    "dept_no" VARCHAR(4) NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL,
    "last_updated" TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no", "dept_no", "from_date"),
    FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);

--with help from Xpert
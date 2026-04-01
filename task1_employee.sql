-- Task 1: Employee Data Load and Unload

create table employee (
  employee_id int,
  name string,
  salary number,
  department_id int,
  joining_date date
);

copy into employee
from @bootcamp.snow.s3_stage_snow/input/data/employee.csv
FILE_FORMAT = (
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = ''''
);

select * from employee;

copy into @bootcamp.snow.s3_stage_snow/output/employee_output/
from "EMPLOYEE";

list @bootcamp.snow.s3_stage_snow/output/employee_output/;

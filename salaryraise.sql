REM   Script: salary raise and fall
REM   employee salary increase or decrease

create table employee( 
    emp_name varchar(15), 
    job varchar(10), 
    sal number 
);

insert into employee(emp_name,job,sal) values ('rayan','manager',20000);

insert into employee(emp_name,job,sal) values ('mayan','manager',30000);

insert into employee(emp_name,job,sal) values ('nayan','analyst',2000);

insert into employee(emp_name,job,sal) values ('ayaan','analyst',5000);

commit;

select * from employee;

commit;

commit;

select * from employee;

commit;

commit;

commit;

commit;

select * from employee;

commit;

declare 
ename varchar(15):='nayan'; 
ejob varchar(10); 
salary number; 
 
begin 
select job,sal  into ejob,salary from employee where emp_name=ename; 
if ejob in ('manager','analyst') then 
salary:=salary+((salary*15)/100); 
else  
    salary:=salary-(salary*12)/100; 
end if; 
update employee 
set sal=salary 
where emp_name=ename; 
commit; 
dbms_output.put_line('Salary of '||ename || ' is '||salary); 
end;
/

insert into employee(emp_name,job,sal) values ('kyaan','analyster',6000);

select * from employee;

commit;

declare 
ename varchar(15):='kyaan'; 
ejob varchar(10); 
salary number; 
 
begin 
select job,sal  into ejob,salary from employee where emp_name=ename; 
if ejob in ('manager','analyst') then 
salary:=salary+((salary*15)/100); 
else  
    salary:=salary-((salary*12)/100); 
end if; 
update employee 
set sal=salary 
where emp_name=ename; 
commit; 
dbms_output.put_line('Salary of '||ename || ' is '||salary); 
end;
/


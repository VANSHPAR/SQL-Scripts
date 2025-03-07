REM   Script: total employees and max salary
REM   identify total employees and maximum salary

create table employee( 
    emp_name varchar(15), 
    job varchar(10), 
    sal number, 
    dept_no number 
);

insert into employee(emp_name,job,sal,dept_no) values ('rayan','manager',20000,1);

insert into employee(emp_name,job,sal,dept_no) values ('mayan','manager',30000,2);

insert into employee(emp_name,job,sal,dept_no) values ('nayan','analyst',2000,1);

insert into employee(emp_name,job,sal,dept_no) values ('ayaan','analyst',5000,1);

insert into employee(emp_name,job,sal,dept_no) values ('kyaan','analyster',6000,2);

insert into employee(emp_name,job,sal,dept_no) values ('gyaan','ceo',800000,1);

declare  
deptno number:=1; 
maxsal number; 
 
empcount number; 
 
begin 
select max(sal),count(*) into maxsal,empcount from employee 
where dept_no=deptno 
order by sal; 
dbms_output.put_line('The total number of employees in dept no '||deptno||' is '||empcount); 
dbms_output.put_line('The maximum salary in dept no '||deptno||' is '||maxsal); 
end;
/

declare  
deptno number:=2; 
maxsal number; 
 
empcount number; 
 
begin 
select max(sal),count(*) into maxsal,empcount from employee 
where dept_no=deptno 
order by sal; 
dbms_output.put_line('The total number of employees in dept no '||deptno||' is '||empcount); 
dbms_output.put_line('The maximum salary in dept no '||deptno||' is '||maxsal); 
end;
/


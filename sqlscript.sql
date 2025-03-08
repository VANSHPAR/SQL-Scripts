REM   Script: bonus
REM   insert the bonus amount according to salary

create table employee(empno number primary key, 
    sal number, 
    comm number);

create table bonus(empno number references employee(empno), 
    sal number, 
    bonus_amt number);

insert into employee (empno,sal,comm) values(1,4000,200);

insert into employee (empno,sal,comm) values(2,6000,300);

insert into employee (empno,sal,comm) values(3,7000,500);

commit;

commit;

select empno,sal,comm from employee;

commit;

select * from bonus;

select * from employee;

commit;

commit;

Declare  
 
bonusamt number:=0; 
 
cursor j is select empno,sal, comm from employee; 
 
begin 
for k in j loop 
if (k.sal+k.comm)<=5000 then 
bonusamt:=k.sal+((k.sal*10)/100); 
 
elsif (k.sal+k.comm)>7000 then 
bonusamt:=k.sal+500+((k.sal*12)/100); 
 
else bonusamt:=k.sal+500; 
end if; 
 
insert into bonus(empno,sal,bonus_amt) values (k.empno,k.sal,bonusamt); 
 
end loop; 
 
commit; 
 
end;
/

select * from bonus;


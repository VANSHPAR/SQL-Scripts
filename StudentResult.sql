REM   Script: pass marks
REM   show that the fail or pass

create table student (rollno number, 
    name varchar(15), 
    mrks1 number, 
    mrks2 number, 
    mrks3 number, 
    percentage number(10,2));

insert into student (rollno,name,mrks1,mrks2,mrks3) values (1,'rayan',50,80,60);

insert into student (rollno,name,mrks1,mrks2,mrks3) values (2,'mayan',60,40,50);

insert into student (rollno,name,mrks1,mrks2,mrks3) values (3,'nayan',30,40,45);

insert into student (rollno,name,mrks1,mrks2,mrks3) values (4,'gayan',30,28,45);

commit;

declare  
 
     
cursor j is select rollno,name,mrks1,mrks2,mrks3 from student; 
rno number; 
tnmae varchar(15); 
temp number(10,2):=0.0; 
pr number(10,2); 
 
 
begin 
     
for i in j loop 
     
if i.mrks1<30 or i.mrks2<30 or i.mrks3<30 then 
    dbms_output.put_line('Rollno: ' || i.rollno || ' Name: ' || i.name || ' Result: fail'); 
 
 
elsif i.mrks1<100 or i.mrks2<100 or i.mrks3<100 then 
    pr:=(((i.mrks1+i.mrks2+i.mrks3)*100)/300); 
 
  if temp<pr then 
      temp:=pr; 
      tnmae:=i.name; 
      rno:=i.rollno; 
 
end if; 
 
update student  
    set percentage=pr 
    where rollno=i.rollno; 
 
end if; 
 
 
 
end loop; 
dbms_output.put_line('Highest percenage is:'); 
dbms_output.put_line('Rollno: ' || rno || ' Name: ' || tnmae || ' Percentage: ' || temp); 
commit; 
end;
/

select * from student;


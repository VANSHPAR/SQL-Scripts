REM   Script: test_analysis
REM   display the candidate that score more than average

create table candidate(cid number primary key, 
    cname varchar(15), 
    caddress varchar(15), 
    cbirth_dt date);

create table test(tid number primary key, 
    tname varchar(15), 
    tot_mks number, 
    pass_mks number);

create table test_center(tcid number primary key, 
    location varchar(15), 
    mge varchar(15), 
    capacity number 
    );

create table test_taken(cid number references candidate(cid), 
    tid number references test(tid), 
    tcid number references test_center(tcid), 
    test_dt date, 
    score number);

insert into candidate(cid,cname,caddress,cbirth_dt) values (1,'rayan','bangalore',to_date('5-1-2005','DD-MM-YYYY'));

insert into candidate(cid,cname,caddress,cbirth_dt) values (2,'gyan','surat',to_date('8-3-2009','DD-MM-YYYY'));

insert into candidate(cid,cname,caddress,cbirth_dt) values (3,'cayan','kochi',to_date('5-2-2006','DD-MM-YYYY'));

insert into candidate(cid,cname,caddress,cbirth_dt) values (4,'mayan','kolkata',to_date('9-10-2003','DD-MM-YYYY'));

insert into candidate(cid,cname,caddress,cbirth_dt) values (5,'vyan','up',to_date('10-10-2002','DD-MM-YYYY'));

insert into candidate(cid,cname,caddress,cbirth_dt) values (6,'kayan','chennai',to_date('11-12-2007','DD-MM-YYYY'));

insert into test(tid,tname,tot_mks,pass_mks) values (101,'gate',100,30);

insert into test(tid,tname,tot_mks,pass_mks) values (102,'jee',200,60);

insert into test_center(tcid,location,mge,capacity) values(1111,'mumbai','alice',4);

insert into test_center(tcid,location,mge,capacity) values(2222,'delhi','bob',3);

insert into test_taken(cid,tid,tcid,test_dt,score) values (1,102,1111,to_date('5-1-2025','DD-MM-YYYY'),120);

insert into test_taken(cid,tid,tcid,test_dt,score) values (3,102,1111,to_date('5-1-2025','DD-MM-YYYY'),145);

insert into test_taken(cid,tid,tcid,test_dt,score) values (5,102,1111,to_date('5-1-2025','DD-MM-YYYY'),70);

insert into test_taken(cid,tid,tcid,test_dt,score) values (6,102,1111,to_date('5-1-2025','DD-MM-YYYY'),65);

insert into test_taken(cid,tid,tcid,test_dt,score) values (2,101,2222,to_date('27-2-2025','DD-MM-YYYY'),80);

insert into test_taken(cid,tid,tcid,test_dt,score) values (4,101,2222,to_date('27-2-2025','DD-MM-YYYY'),40);

commit;

commit;

commit;

commit;

commit;

commit;

commit;

commit;

commit;

commit;

commit;

commit;

declare  
testid number:=102; 
testcid number:=1111; 
 
cursor j is 
select c.cid,c.cname,c.caddress,c.cbirth_dt,tt.score 
from candidate c 
join test_taken tt on tt.cid=c.cid; 
 
cursor k is  
select tc.tcid,tc.capacity,tt.test_dt 
from test_center tc 
join test_taken tt on tt.tcid=tc.tcid; 
 
 
id number; 
name varchar(15); 
address varchar(15); 
birth_dt date; 
tscore number; 
avgscore number; 
total number; 
temp number:=-1; 
 
begin 
select avg(score) 
    into avgscore 
    from test_taken 
    where tid=testid; 
 
for i in j loop 
    if i.score>avgscore then 
    id:=i.cid; 
    name:=i.cname; 
    address:=i.caddress; 
    birth_dt:=i.cbirth_dt; 
    tscore:=i.score; 
dbms_output.put_line(id || ' ' || name || ' ' || address || ' ' || birth_dt || ' ' || tscore); 
end if; 
 
 
end loop;  
 
select count(*)  
    into total 
    from test_taken 
    where tcid=testcid 
    order by cid; 
 
 
for l in k loop 
    if temp!=l.tcid and l.tcid=testcid and total=l.capacity then 
    temp:=l.tcid; 
    dbms_output.put_line(l.tcid||' '||l.capacity||' '||l.test_dt); 
end if; 
    end loop; 
 
commit;     
end;
/

commit;

commit;

commit;

declare  
testid number:=101; 
testcid number:=2222; 
 
cursor j is 
select c.cid,c.cname,c.caddress,c.cbirth_dt,tt.score,tt.tid 
from candidate c 
join test_taken tt on tt.cid=c.cid; 
 
cursor k is  
select tc.tcid,tc.capacity,tt.test_dt 
from test_center tc 
join test_taken tt on tt.tcid=tc.tcid; 
 
 
id number; 
name varchar(15); 
address varchar(15); 
birth_dt date; 
tscore number; 
avgscore number; 
total number; 
temp number:=-1; 
 
begin 
select avg(score) 
    into avgscore 
    from test_taken 
    where tid=testid; 
 
for i in j loop 
    if i.tid=testid and i.score>avgscore then 
    id:=i.cid; 
    name:=i.cname; 
    address:=i.caddress; 
    birth_dt:=i.cbirth_dt; 
    tscore:=i.score; 
dbms_output.put_line(id || ' ' || name || ' ' || address || ' ' || birth_dt || ' ' || tscore); 
end if; 
 
 
end loop;  
 
select count(*)  
    into total 
    from test_taken 
    where tcid=testcid 
    order by cid; 
 
 
for l in k loop 
    if temp!=l.tcid and l.tcid=testcid and total=l.capacity then 
    temp:=l.tcid; 
    dbms_output.put_line(l.tcid||' '||l.capacity||' '||l.test_dt); 
end if; 
    end loop; 
 
commit;     
end;
/


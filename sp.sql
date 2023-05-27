create database TCL
use TCL 
drop table player
create table player1(rank int, name varchar(20), best int)

insert into player1 values(1, 'virat', 163)
insert into player1 values(2, 'dhoni', 183)
insert into player1 values(3, 'rohit', 198)
insert into player1 values(4, 'jadeja', 133)


select * from player1
truncate table player
delete from player1 where rank=5
commit;
update player1 set name='virat' where rank=5
insert into player values(7, 'manoj', 130)
begin transaction;
insert into player1 values(5, 'raj', 172)
commit TRANSACTION;
commit
end
begin transaction;
insert into player values(6, 'jadeja', 133)
rollback;

select * from player1
ROLLBACK;

begin transaction;
delete from player where rank =5
rollback;


begin transaction;
alter table player add age int;
rollback;

sp_helpdb raj

select * from player

select name, 
case when best > 150 then 'class A'
     when best > 180 then 'class B'
	 else 'pass'
	 END AS result from player

create view temp as
select name, result=
case when best > 150 then 'class A'
     when best > 180 then 'class B'
	 else 'pass'
	 end
	 from player;
	 Deadlock

	select * from temp;

	 select * from player where rank=4
select * from player with (nolock) where rank=4
BEGIN TRANSACTION
SELECT * FROM player1
COMMIT TRANSACTION
sp_who2



DECLARE
a integer :=3;
b integer :=4;
c integer;
BEGIN
c:=a+b;
dbms_output.put_line("value of c:=" || c)
END

create procedure raj2226
As
Begin
select * from player where rank=3
end

exec raj2226
select * from player;

create procedure raj1(@rank int)
as
begin
select * from player with (nolock) where rank=@rank
end
exec raj1 4

create procedure raj5(@rank int, @time datetime out)
as
begin
set @time=GETDATE()
select * from player with (nolock) where rank=@rank
end

declare @exec_time datetime
exec raj5 4 , @exec_time
print @exec_time

exec raj5 5
select * from player
 
create procedure ins(rank int, name varchar(20), best int)
is 
begin
insert into player values(rank, name, best)
end 

create procedure ins(rank int, name varchar(20), best int)
is 
begin
insert into player values(rank, name, best)
end


exec raj1 2

create trigger dml2
ON player
For insert
as 
begin
print 'you cannot perform DML operation'
rollback
END

insert into player values(8, 'pranali', 200)

create trigger dml1
ON player
For insert
as 
begin
print 'you cannot perform DML operation'

END

select * from player
insert into player values(7, 'raj', 500)

create trigger trg1
on player 
FOR INSERT
as 
begin
if DATEPART(WEEKDAY, getdate())=6
begin
print ' dml poeartion not on monday'
end
end
select * from player
update player set name='nikhil' where rank=5

select  DATEPART(WEEKDAY, getdate())==2

+
alter trigger trg
on player 
for insert, update, delete
as 
begin
if DATEPART(WEEKDAY, getdate())=6
begin
print ' dml poeartion not on monday'
rollback transaction
end
end


create trigger instead
on player 
 instead of insert 
as 
begin
print 'dml proportion not on monday'
rollback transaction

end

select * from player

update player set name='nikhil' where rank=4

insert into player values(7, 'raj', 500)

disable trigger player.dml on player;

disable Trigger all on all server;

enable trigger dml on player;
go
create trigger safe 
on player 
for drop
as 
begin
print 'no drop and alter'
end;

create function data()
returns varchar(20)
as
begin
    return('welcome');
end

select dbo.data()


create function rajuu(@a int, @b int)
returns int
as
begin
    return(@a * @b);
end

select dbo.rajuu(5, 6) as sum


drop trigger trg1
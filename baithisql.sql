create database EmployeeDB 
go
use EmployeeDB
go
create table Department(
Departld int primary key,
DepartName varchar(50) not null ,
Description varchar(100) not null,
)

go
create table Employee(
EmpCode char(6) primary key,
FirstName varchar(30) not null,
LastName varchar(30) not null,
Birthday smalldatetime not null,
Gender bit default 1 ,
Address varchar(100) ,
DepartlID int foreign key references Department,
Salary money ,
)


insert into Department
values
(01,'Khoa toan','Giao vien toan');
(02,'Khoa van','Giao vien van');
(03,'Khoa anh','Giao vien anh');

insert into Employee
values
(000001,'Quan','Le','08-03-2004',1,'Ninh Binh',01,200000)
(000002,'Phuong','Nguyen','01-01-2002',1,'Ninh Binh',02,100000)
(000003,'Quan','Nguyen','02-03-2003',1,'Ha Noi',03,1000000)


alter table Employee 
add Salary money( >0)

create trigger tg_chkBirthday
on Employee
alter insert, update
as
begin
	if exists (select 1 from inserted where Birthday <= 23)
	begin
		raiserror('value of birthday column must be greater than 23', 16, 1);
		rollback transaction;
	end
end
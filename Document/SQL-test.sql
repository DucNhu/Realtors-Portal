create database realtors01
drop  table Admin
create table agent(AgentID int identity
,AgentName varchar(250)
,AgentAddress varchar(250)
,AgentPhone varchar(250)
,AgentEmail varchar(250)
,AgentActive bit
,AgentAvatar varchar(250)
,AgentDateCreate date
,PackageID int)

insert into agent values ('AgentName', 'AgentAddress', 'AgentPhone', 'AgentEmail', 0 ,'AgentAvatar', 'AgentDateCreate', 1)

select * from dbo.User
select * from Admin
--Seller 
create table seller(SellID
 int identity
,SellName varchar(250)
,SellAddress varchar(250)
,SellPhone varchar(250)
,SellEmail varchar(250)
,SellerActive bit
,SellAvatar varchar(250)
,SellDateCreate varchar(250)
,PackageID int
, AgentID
 int)


insert into seller values ('SellName', 'SellAddress', 'SellPhone', 'SellEmail', 0 ,'SellAvatar', 'SellDateCreate', 1, 1)
, ('SellName1', 'SellAddress1', 'SellPhone1', 'SellEmail', 0 ,'SellAvatar', 'SellDateCreate', 1, 1)

update seller set SellName = 'strin1g', SellPhone = 'str1ng', SellEmail = 'str1ing', SellAvatar = 'string', SellAddress = 'string1', AgentID = 1, PackageID = 1, SellerActive = 1 where SellID = 1

select * from seller

create table auser(UserID
 int identity
,UserName varchar(250)
,UserAddress varchar(250)
,UserPhone varchar(250)
,UserEmail varchar(250)
,UserActive bit
,UserAvatar varchar(250))


insert into auser values ('UserName', 'UserName', 'UserName', 'UserName', 0 ,'UserName')
select * from auser


create table admin(adminID
 int identity
,adminName varchar(250)
,adminAddress varchar(250)
,adminPhone varchar(250)
,adminEmail varchar(250)
,adminActive bit
,adminAvatar varchar(250))



create table test(id int identity, name varchar(50), username varchar(50), password varchar(50), passwordSalt varchar(49), active bit, blocked bit)
insert into test values ('DucNhu', 'admin', 'R2VpY28=', 'MTIzNDU2Nzg5MTIzNDU2Nw==', 0, 1)
insert into test values ('DucNhu', 'admin2', 'R2VpY28=', 'MTIzNDU2Nzg5MTIzNDU2Nw==', 1, 1)

select * from test




use  realtorsTest
insert into products values ('1', '11', '111')
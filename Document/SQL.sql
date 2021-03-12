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

select * from agent

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



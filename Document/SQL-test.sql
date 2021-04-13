
create  database realtors01
use  realtors01
create table test(test varchar(1))
insert into test values ('1')

create table agent(AgentID int identity
,AgentName varchar(250)
,AgentAddress varchar(250)
,AgentPhone varchar(250)
,AgentEmail varchar(250)
,AgentActive bit
,AgentAvatar varchar(250)
,AgentDateCreate date
,PackageID int)

insert into agent values ('AgentName', 'AgentAddress', 'AgentPhone', 'AgentEmail', 0 ,'AgentAvatar', 'AgentDateCreate', 1);


SELECT [User].Name, [User].ID, [User].Avatar, [User].Active,
  [User].Description, [User].Title, [User].Email, [User].Phone,
  
  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName
  FROM [User]
  INNER JOIN Location ON Location.LocationID = [User].LocationID
  INNER JOIN Country ON Country.CountryID = [User].CountryID
    INNER JOIN City ON City.CityID = [User].CityID
	  INNER JOIN District ON District.DistrictID = [User].DistrictID
	  INNER JOIN Are ON Are.AreID = [User].AreID where [User].ID = 4

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

select * from Category




use  realtorsTest
insert into products values ('1', '11', '111')


SELECT Location.LocationName, Location.LocationLetter FROM Location INNER JOIN Country ON Location.LocationID = Country.CountryID
SELECT *  FROM Location where Location.Active = 1
SELECT Are.AreName, 
                            Are.Active, 
                            Are.Avatar, 
                            Are.AreID, 
                            Are.AreLetter, 
                            Are.DistrictID, 
                            District.DistrictName  FROM Are INNER JOIN District ON District.DistrictID = Are.DistrictID and Are.Active = 1 

	SELECT COUNT(*)
  FROM Location
  WHERE LocationLetter = 'L';

  SELECT * from project
  SELECT project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive, project.Description, project.Title, project.Sqft, project.Price,
  project.Location, project.Country, project.City, project.District, project.CategoryID, project.Are,

  Location.LocationName, 
  Country.CountryName , 
  City.CityName, 
  District.DistrictName, 
  Are.AreName,

  Category.CategoryName
  FROM project
  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are
	    INNER JOIN Category ON Category.CategoryID = project.CategoryID
-->=================================================================================
		SELECT project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
  project.Description, project.Title, project.Sqft, project.Price,
  
  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName
  FROM project
  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are
	    INNER JOIN Category ON Category.CategoryID = project.CategoryID where LevelActive = 2
		-->=================================================================================

		SELECT ImageLib.ImageLibID, Name
  FROM ImageLib
  INNER JOIN project ON project.ID = ImageLib.ImageLibID 
  go
  select COUNT(project.SellerID) from project


  SELECT COUNT(project.SellerID) from project INNER JOIN [User] ON  project.SellerID = [User].id
  go

select * from [User] where [User].ID = 1
select * from project where project.UserID = 7
UPDATE [User] SET [User].PackageID = 1 where id = 7; 

SELECT project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
  project.Description, project.Title, project.Sqft, project.Price, 

  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName 
  FROM project
INNER JOIN [User] ON [User].ID = project.UserID 
  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are	   
	  INNER JOIN Category ON Category.CategoryID = project.CategoryID


where Category.Active = 0 and Are.Active = 1
and District.Active = 1 and City.Active = 1
and Country.Active = 1 and Country.Active = 1
and Location.Active = 1
and project.UserID = 7 


--count active
select count(*) from [User] where Active = 1 and not User_type = 'admin'
select * from [User]
--count agent
select count(User_type) from [User] where User_type = 'agent'
--count seller
select count(User_type) from [User] where User_type = 'seller'
--count product
select count(*) from project where LevelActive > 0
select count(*) from Category where Active > 0
--count package đã mua
select * from PackagePurchased



SELECT project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
  project.Description, project.Title, project.Sqft, project.Price, 

  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName 
  FROM project
INNER JOIN [User] ON [User].ID = project.UserID 

  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are	   
	  INNER JOIN Category ON Category.CategoryID = project.CategoryID

where Category.Active = 1 and Are.Active = 1
and District.Active = 1 and City.Active = 1
and Country.Active = 1 and Country.Active = 1
and Location.Active = 1
and project.UserID = 7


select max(YEAR(EndDate)) from PackagePurchased where UserID = 4
select max(MONTH(EndDate)) from PackagePurchased 
select max(DAY(EndDate)) from PackagePurchased 

select max(MONTH(EndDate)) as MonthMax from PackagePurchased where YEAR(EndDate) = (select max(YEAR(EndDate)) from PackagePurchased where UserID = 4) 

select 
max(YEAR(EndDate)) as YearMax, 
max(MONTH(EndDate)) as MonthMaxOfYearMax, 
max(DAY(EndDate)) as DayMaxOfMonthMaxOfYearMax
from PackagePurchased where UserID = 2 and 
MONTH(EndDate) = (select max(MONTH(EndDate)) 
from PackagePurchased where UserID = 2 and 
YEAR(EndDate) = (select max(YEAR(EndDate)) 
from PackagePurchased where UserID = 2)) 

select * from PackagePurchased  inner join  package on PackagePurchased.PackageID = Package.PackageID  where USERID = 7  

SELECT *  FROM [User] where [User].ID = 4
SELECT count(project.UserID)  FROM project where project.UserID = 0

SELECT project.* FROM project 

inner join [User] on project.UserID = [User].ID
INNER JOIN Category ON Category.CategoryID = project.CategoryID	

INNER JOIN Location ON Location.LocationID = project.Location
INNER JOIN Country ON Country.CountryID = project.Country
INNER JOIN City ON City.CityID = project.City
INNER JOIN District ON District.DistrictID = project.District
INNER JOIN Are ON Are.AreID = project.Are	 

where Category.CategoryName = 'Category1'and [User].User_type = 'seller'
and Location.LocationName = 'Location2'
and Country.CountryName = 'Country2'
and City.CityName = 'City1' and District.DistrictName = 'District1'
and Are.AreName = 'Are1'

and Sqft between 0 and 900
and Price between 0 and 900
and LevelActive > 0


SELECT max(Price) as maxPrice FROM project 
SELECT max(Sqft) as maxSqft FROM project 



-- Select list image feature product
select * from ImageLib where ProductID = 1


SELECT project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
  project.Description, project.Title, project.Sqft, project.Price, project.UserID,

  [User].Name, [User].Avatar, [User].Email, [User].Phone, [User].User_type,
  
  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName
  FROM project
  INNER JOIN [User] ON [User].ID = project.UserID

  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are

	    INNER JOIN Category ON Category.CategoryID = project.CategoryID
		where LevelActive > 0


SELECT top 6 project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
  project.Description, project.Title, project.Sqft, project.Price,
  
  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName 
  FROM project
INNER JOIN [User] ON [User].ID = project.UserID

  INNER JOIN Location ON Location.LocationID = project.Location
  INNER JOIN Country ON Country.CountryID = project.Country
    INNER JOIN City ON City.CityID = project.City
	  INNER JOIN District ON District.DistrictID = project.District
	  INNER JOIN Are ON Are.AreID = project.Are
	    INNER JOIN Category ON Category.CategoryID = project.CategoryID where LevelActive = 2


select * from ImageLib where ProductID = 17

update project set LevelActive = 2 from project where project.ID = 17






SELECT project.ProjectName, project.ID, project.ImageBannerName, project.LevelActive,
  project.Description, project.Title, project.Sqft, project.Price, project.UserID,

  [User].Name, [User].Avatar, [User].Email, [User].Phone, [User].User_type,
  
  Location.LocationName, Country.CountryName , City.CityName, District.DistrictName, Are.AreName,
  Category.CategoryName
FROM project 

INNER JOIN [User] on project.UserID = [User].ID
INNER JOIN Category ON Category.CategoryID = project.CategoryID	

INNER JOIN Location ON Location.LocationID = project.Location
INNER JOIN Country ON Country.CountryID = project.Country
INNER JOIN City ON City.CityID = project.City
INNER JOIN District ON District.DistrictID = project.District
INNER JOIN Are ON Are.AreID = project.Are	 

where project.LevelActive > 0 and Category.CategoryName like '%category1%' 
 and [User].User_type like '%%'
and (Location.LocationName like '%%')
and (Country.CountryName like '%%')
and (City.CityName like '%%')
and (District.DistrictName like '%%')
and (Are.AreName like '%%')

and (Sqft between 0 and  1110)
and (Price between 0 and 1110)



  select COUNT(project.ID) as 'SoLuongProductTimDuoc' from project
INNER join [User] on project.UserID = [User].ID
INNER JOIN Category ON Category.CategoryID = project.CategoryID	

INNER JOIN Location ON Location.LocationID = project.Location
INNER JOIN Country ON Country.CountryID = project.Country
INNER JOIN City ON City.CityID = project.City
INNER JOIN District ON District.DistrictID = project.District
INNER JOIN Are ON Are.AreID = project.Are	

where Category.CategoryName = 'category1' and project.LevelActive > 0



select [User].Name ,
count(project.UserID) from [User]
INNER join project on project.UserID = [User].ID
where [User].Active = 1
group by [User].Name



select [User].ID, [User].Name, [User].Email, [User].Title, [User].Description, [User].Phone, [User].Email,[User].User_type, [User].Avatar, [User].Active, [User].PackageID from [User]
where [User].User_type not like 'admin' and [User].Active = 1





select Package.PackageName, Package.Price, Package.PackageTitle, Package.PackageDesciption, Package.Duration, 
PackagePurchased.EndDate, PackagePurchased.StartDate
from Package

INNER join PackagePurchased on PackagePurchased.PackageID = Package.PackageID

where PackagePurchased.UserID = 9



use realtors01


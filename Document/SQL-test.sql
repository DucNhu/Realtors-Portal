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

select * from User
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


    select * from [User]

UPDATE [User] SET User_type = 'seller', Active = 1 WHERE ID = 3; 


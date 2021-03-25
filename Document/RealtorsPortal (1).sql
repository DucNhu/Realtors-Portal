--CREATE TABLE "tblUser" (
--  "id" int PRIMARY KEY,
--  "UserName" varchar(30) UNIQUE,
--  "cPassword" varchar(20),
--  "cName" varchar(100),
--  "cIndentificationNumber" varchar(20),
--  "cPhoneNumber" varchar(20) UNIQUE,
--  "cEmail" varchar(50) UNIQUE,
--  "cAddress" varchar(200),
--  "cAvatar" varchar(200),
--  "cActive" bit,
--  "ProductID" int,
--  "ppID" int
--);
drop database realtors01 -- Delete roi create lai db ==========================================================================================================================================
create database realtors01
drop table tblUser
CREATE TABLE tblUser (
  "id" int PRIMARY KEY identity,
  "UserName" varchar(30) UNIQUE,
  "Password" varchar(20),
  "Name" varchar(100),
  "IndentificationNumber" varchar(20),
  "Phone" varchar(20) UNIQUE,
  "Email" varchar(50) UNIQUE,
  "Address" varchar(200),
  "Avatar" varchar(200),
  "Active" bit,
  "ProductID" int,
  "ppID" int
);
insert into tblUser(UserName, Address, Phone, Email,Active, IndentificationNumber, Name, ppID, ProductID, Password, Avatar) values ('', '', '', '', 1, '', '', 0, 0, '', '');
select * from tblUser

CREATE TABLE "tblPackage" (
  PackageID int PRIMARY KEY,
  PackageName varchar(20) Unique,
  PackageAvatar varchar(250),
  PackageDesciption varchar(500),
  NumberOfAds int,
  NumberOfMember int,
  NumberOfMonth int
);

CREATE TABLE "tblPackagePurchased" (
  ppID int PRIMARY KEY,
  PackagerID int,
  UserName varchar(30),
  ppStartDate datetime,
  ppEndDate datetime
);

CREATE TABLE "tblProduct" (
  "ProductID" int PRIMARY KEY,
  "CategoryID" int,
  "UserName" varchar(30),
  "pProductName" varchar(50),
  "pProductLocation" varchar(200),
  "pProductCountry" varchar(50),
  "pProductCity" varchar(50),
  "pProductDistrict" varchar(30),
  "pProductRegion" varchar(50),
  "pProductArea" double,
  "pPrice" double,
  "ImageID" int
);

CREATE TABLE tblCategory (
  CategoryID int PRIMARY KEY,
  CategoryName varchar(30),
  CategoryDescription varchar(200),
  Avatar varchar(200)
);

CREATE TABLE tblImageLib (
  ImageID int PRIMARY KEY,
  ProductID int,
  Name varchar(100)
);
drop table tblImageLib
CREATE TABLE "Order" (
  "OrderID" int PRIMARY KEY,
  "ProductID" int,
  "oTotalPrice" double
);

CREATE TABLE "Transaction" (
  "TransactionID" int PRIMARY KEY,
  "OrderID" int,
  "UserName" varchar(30),
  "DateCreated" datetime
);

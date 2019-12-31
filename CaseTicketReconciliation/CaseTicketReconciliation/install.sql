--Init Database
-------------------------------------------------------
use master
go
drop database CaseTicketReconcile
go
create database CaseTicketReconcile
go
use CaseTicketReconcile
go

--CREATE TABLES
-------------------------------------------------------

CREATE TABLE tbFreshDesk
(
ID INT PRIMARY KEY NOT NULL,
TicketStatus varchar(50) NOT NULL,
CaseNumber VARCHAR(50) NOT NULL
)

CREATE TABLE tbCRM
(
ID varchar(50) PRIMARY KEY NOT NULL,
CaseStatus varchar(50) NOT NULL,
TicketNumber VARCHAR(50) NOT NULL
)

go
--CREATE STORED PROCEDURES
-------------------------------------------------------

CREATE PROCEDURE spAddFreshDeskRow @ID INT, @TicketStatus VARCHAR(50), @CaseNumber VARCHAR(50)
as
	INSERT INTO tbFreshDesk (ID,TicketStatus,CaseNumber) VALUES
							(@ID, @TicketStatus, @CaseNumber)
go

CREATE PROCEDURE spAddCRMRow @ID VARCHAR(50), @CaseStatus VARCHAR(50), @TicketNumber INT
as
	INSERT INTO tbCRM (ID,CaseStatus,TicketNumber) VALUES
							(@ID, @CaseStatus, @TicketNumber)
go


exec spAddFreshDeskRow 5,'closed','CAS-TEST';
exec spAddCRMRow 'CAS-TEST','Resolved',676;

SELECT *
FROM tbCRM

SELECT *
FROM tbFreshDesk;
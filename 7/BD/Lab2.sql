USE [AdventureWorks2012];

CREATE TABLE [dbo].[Employee]
(
	[BusinessEntityID] [int] NOT NULL,
	[NationalIDNumber] [nvarchar](15) NOT NULL,
	[LoginID] [nvarchar](256) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[MaritalStatus] [nchar](1) NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[HireDate] [date] NOT NULL,
	[VacationHours] [smallint] NOT NULL,
	[SickLeaveHours] [smallint] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
);
	
	
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [NationalIDNumber_UNIQUE] UNIQUE ([NationalIDNumber]);
    
    
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [NationalIDNumber_DIGIT] CHECK (ISNUMERIC([NationalIDNumber]) = 1);

ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [VacationHours_DEFAULT] DEFAULT 144 FOR [VacationHours];

INSERT INTO [dbo].[Employee] 
		(	[BusinessEntityID],
			[NationalIDNumber],
			[LoginID],
			[JobTitle],
			[BirthDate],
			[MaritalStatus],
			[Gender],
			[HireDate],
			[SickLeaveHours],
			[ModifiedDate]
		)
	SELECT	[BusinessEntityID],
			[NationalIDNumber],
			[LoginID],
			[JobTitle],
			[BirthDate],
			[MaritalStatus],
			[Gender],
			[HireDate],
			[SickLeaveHours],
			[ModifiedDate]
FROM [HumanResources].[Employee]
WHERE [JobTitle] LIKE 'Production Technician%';

ALTER TABLE [dbo].[Employee]
ALTER COLUMN [ModifiedDate] [date] NULL;

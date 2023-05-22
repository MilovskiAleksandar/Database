USE SEDCACADEMYDB

CREATE TABLE [dbo].[Student](
[ID] int IDENTITY(1, 1) not null,
[FirstName] nvarchar(50) not null,
[LastName]  nvarchar(50) not null,
[DateOfBirth] date not null,
[EnrolledDate] date not null,
[Gender] nchar(1) not null,
[NationalIDNumber] nvarchar (50) null,
[StudentCardNumber] nvarchar(50) not null
)

CREATE TABLE [dbo].[Teacher](
[ID] int IDENTITY(1, 1) not null,
[FirstName] nvarchar(50) not null,
[LastName]  nvarchar (50) not null,
[DateOfBirth] date not null,
[AcademicRank] nvarchar(50) not null,
[HireDate] date not null
)

CREATE TABLE [dbo].[Grade](
[ID] int IDENTITY(1,1) not null,
[StudentID] int not null,
[CourseID] int not null,
[TeacherID] int not null,
[Grade] int not null,
[Comment] nvarchar(max) null,
[CreatedDate] datetime not null
)

CREATE TABLE [dbo].[Course] (
[ID] int IDENTITY(1,1) not null,
[Name] nvarchar(100) not null,
[Credit] int not null,
[AcademicYear] int not null,
[Semester] tinyint null
)

CREATE TABLE [dbo].[AchievementType](
[ID] int IDENTITY(1,1) not null,
[Name] nvarchar(100) not null,
[Description] nvarchar(max) null,
[ParticipationRate] int not null
)

CREATE TABLE [dbo].[GradeDetails](
[ID] int IDENTITY(1,1) not null,
[GradeID] int not null,
[AchievementTypeID] int not null,
[AchievementPoints] int not null,
[AchievementMaxPoints] int not null,
[AchievementDate] datetime null
)
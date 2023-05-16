CREATE DATABASE SEDCACADEMYDB

USE SEDCACADEMYDB

CREATE TABLE Students(
Id int IDENTITY(1, 1) not null,
FirstName nvarchar(100) not null,
DateOfBirth date not null,
EnrolledDate date null,
Gender nchar(1) not null,
NationalIDNumber nvarchar (20) null,
StudentCardNumber int not null
)

CREATE TABLE Teachers(
Id int IDENTITY(1, 1) not null,
FirstName nvarchar(100) not null,
LastName nvarchar (100) not null,
DateOfBirth date not null,
AcademicRank int null,
HireDate date not null
)

CREATE TABLE Grade(
Id int IDENTITY(1,1) not null,
StudentID int not null,
CourseID int not null,
TeacherID int not null,
Grade int not null,
Comment nvarchar(max) null,
CreatedDate date not null
)

CREATE TABLE Course (
Id int IDENTITY(1,1) not null,
[Name] nvarchar(100) not null,
Credit int not null,
AcademicYear date not null,
Semester nvarchar(50) null
)

CREATE TABLE AchievementType(
Id int IDENTITY(1,1) not null,
[Name] nvarchar(100) not null,
[Description] nvarchar(max) null,
ParticipationRate int not null
)

CREATE TABLE GradeDetails(
Id int IDENTITY(1,1) not null,
GradeID int not null,
AchievementTypeID int not null,
AchievementPoints int not null,
AchievementMaxPoints int not null,
AchievementDate date null
)



--Create new procedure called CreateGrade
--Procedure should create only Grade header info (not Grade Details) 
--Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
--Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)

CREATE PROCEDURE CreateGrade(@StudentId int, @CourseId int, @TeacherId int,@CreatedDate date, @Grade int)
AS
BEGIN
	INSERT INTO Grade(StudentID, CourseID, TeacherID, CreatedDate, Grade)
	VALUES(@StudentId, @CourseId, @TeacherId, @CreatedDate, @Grade)

	SELECT COUNT(*) AS TotalGradesForStudents
	FROM Grade 
	WHERE StudentID = @StudentId


	SELECT MAX(Grade) as MAX_GRADE
	FROM Grade
	WHERE StudentID = @StudentId and TeacherID = @TeacherId

END
GO

EXEC CreateGrade @StudentId = 200, @CourseId = 6, @TeacherId = 80, @CreatedDate = '1990-02-19', @Grade = 7


SELECT * 
FROM Grade
WHERE CreatedDate = '1990-02-19'
GO


--Create new procedure called CreateGradeDetail
--Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade)
--Output from this procedure should be resultset with SUM of GradePoints calculated with formula 
--AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade.

ALTER PROCEDURE CreateGradeDetail (@GradeId INT, @AchievementTypeId INT, @AchievementPoints INT, @AchievementMaxPoints INT, @AchievementDate DATETIME)
AS 
BEGIN
	INSERT INTO GradeDetails (GradeId, AchievementTypeId, AchievementPoints, AchievementMaxPoints, AchievementDate)
	VALUES (@GradeId, @AchievementTypeId, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)


	SELECT SUM(AchievementPoints / AchievementMaxPoints * ParticipationRate)
	FROM GradeDetails GD
	INNER JOIN Grade G ON GD.GradeID = G.ID
	--INNER JOIN AchievementType A ON A.ID = GD.AchievementTypeID 

END
GO

EXEC CreateGradeDetail  @GradeId = 4,@AchievementTypeID=12,@AchievementPoints=81,@AchievementMaxPoints=100,@AchievementDate = '1999-02-02'
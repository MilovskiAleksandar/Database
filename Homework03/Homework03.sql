-- List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.Name AS CourseName, a.Name AS AchievementName
FROM Course C
CROSS JOIN AchievementType a


--List all Teachers without exam Grade
SELECT  t.FirstName
FROM Teacher t
LEFT JOIN Grade g
ON t.ID = g.TeacherID
WHERE g.TeacherID IS NULL


--Calculate the count of all grades in the system
SELECT TeacherID, COUNT(Grade) as TotalGrade
FROM Grade
GROUP BY TeacherID


--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT TeacherID, COUNT(Grade) as AllGradesFor100Students
FROM Grade
WHERE StudentID < 100
GROUP BY TeacherID


--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT StudentID, MAX(Grade) as MaxGrade, AVG(Grade) as AverageGrade
FROM Grade
GROUP BY StudentID

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT TeacherID, SUM(Grade) as TotalGrade
FROM Grade
GROUP BY TeacherID
HAVING COUNT(Grade) > 200


--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the
--system. Filter only records where Maximal Grade is equal to Average Grade
SELECT StudentID, COUNT(Grade) as GradeCount, MAX(Grade) as MaxGrade, AVG(Grade) as AverageGrade
FROM Grade
GROUP BY StudentID
HAVING MAX(Grade) = AVG(Grade)

--List Student First Name and Last Name next to the other details from previous query
SELECT StudentID, S.FirstName as FirstName, S.LastName as LastName,  COUNT(Grade) as GradeCount, MAX(Grade) as MaxGrade, AVG(Grade) as AverageGrade
FROM Grade G
INNER JOIN Student S
ON S.ID = G.StudentID
GROUP BY StudentID, S.FirstName, S.LastName
HAVING MAX(Grade) = AVG(Grade)

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

CREATE VIEW vv_StudentGrades
AS
SELECT StudentID, COUNT(Grade) as CountGrade
FROM Grade
GROUP BY StudentID
GO

--Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades
AS
SELECT s.FirstName as FirstName, s.LastName as LastName, COUNT(Grade) as CountGrade
FROM Grade g
INNER JOIN Student s
on g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName
GO

SELECT *
FROM vv_StudentGrades
ORDER BY CountGrade DESC


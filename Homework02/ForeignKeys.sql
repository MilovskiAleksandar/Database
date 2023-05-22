ALTER TABLE dbo.Student
ADD PRIMARY KEY (ID)

ALTER TABLE dbo.Teacher
ADD PRIMARY KEY (ID)

ALTER TABLE dbo.GradeDetails
ADD PRIMARY KEY (ID)

ALTER TABLE dbo.Grade
ADD PRIMARY KEY (ID)

ALTER TABLE dbo.Course
ADD PRIMARY KEY (ID)

ALTER TABLE dbo.AchievementType
ADD PRIMARY KEY (ID)



ALTER TABLE dbo.GradeDetails 
ADD CONSTRAINT FK_GradeDetails_Grade
FOREIGN KEY (GradeID) REFERENCES dbo.Grade(ID)

ALTER TABLE dbo.Grade
ADD CONSTRAINT FK_Grade_Student 
FOREIGN KEY (StudentID) REFERENCES dbo.Student(ID)

ALTER TABLE dbo.Grade 
ADD CONSTRAINT FK_Grade_Teacher
FOREIGN KEY (TeacherID) REFERENCES dbo.Teacher(ID)

ALTER TABLE dbo.Grade 
ADD CONSTRAINT FK_Grade_Cours
FOREIGN KEY (CourseID) REFERENCES dbo.Course(ID)

ALTER TABLE dbo.GradeDetails 
ADD CONSTRAINT FK_GradeDetails_AchievementType
FOREIGN KEY (AchievementTypeID) REFERENCES dbo.AchievementType(ID)
use master
drop database if exists nig4
create DATABASE nig4
use nig4



-- Create the Roles table
CREATE TABLE Roles (
  RoleID  INT  PRIMARY KEY,
  RoleName VARCHAR(255)
);

-- Create the Semester table
CREATE TABLE Semester (
SemesterID INT PRIMARY KEY,
SemesterName VARCHAR(255)
);

-- Create the Users table
CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(255),
  Password VARCHAR(255),
  Email VARCHAR(255),
  Phone VARCHAR(255),
  Address VARCHAR(255),
  RoleID INT,
  FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);
use nig4
SELECT s.SemesterName,  c.CourseCode, c.CourseName,  c.CreditHours FROM  Semester s JOIN Courses c ON s.SemesterID = c.Semester
SELECT s.Name, s.RegistrationNumber FROM Students s JOIN StudentsSections ss ON s.StudentID = ss.StudentID JOIN Sections sec ON ss.SectionID = sec.SectionID WHERE sec.SectionID = 1 ORDER BY s.RegistrationNumber ASC;
select * from sections

SELECT c.CourseCode,  c.CourseName,  c.CreditHours,  sec.SectionName,  f.Name AS Instructor,  coord.Name AS Coordinator FROM  Courses c  INNER JOIN Sections sec ON c.CourseID = sec.CourseID  INNER JOIN CourseInstructors ci ON sec.SectionID = ci.SectionID  INNER JOIN Faculty f ON ci.FacultyID = f.FacultyID  INNER JOIN CourseAllocation cal ON c.CourseID = cal.CourseID  INNER JOIN Faculty coord ON cal.CoordinatorID = coord.FacultyID;


-- Create the Coordinator table
CREATE TABLE Coordinator (
  UserID INT PRIMARY KEY,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create the Students table
CREATE TABLE Students (
  StudentID INT PRIMARY KEY,
  UserID INT,
  Name VARCHAR(255),
  RegistrationNumber VARCHAR(255),
  CGPA DECIMAL(4, 2),
  SGPA DECIMAL(4, 2),
  Batch INT,
  CurrentSemester INT,
  FOREIGN KEY (UserID) REFERENCES Users(UserID) on delete cascade
);
use nig4
select * from students
-- Create the Faculty table
CREATE TABLE Faculty (
  FacultyID INT PRIMARY KEY,
  UserID INT,
  Name VARCHAR(255),
  Department VARCHAR(255),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create the Courses table
CREATE TABLE Courses (
  CourseID INT PRIMARY KEY,
  CourseCode VARCHAR(255),
  CourseName VARCHAR(255),
  CreditHours INT,
  Semester INT
);

-- Create the Sections table
CREATE TABLE Sections (
  SectionID INT PRIMARY KEY,
  CourseID INT,
  SemesterID INT,
  SectionName VARCHAR(255),
  MaximumCapacity INT,
  FacultyID INT,
  FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
  FOREIGN KEY (SemesterID) REFERENCES Semester(SemesterID),
  FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

-- Create the CourseInstructors table
CREATE TABLE CourseInstructors (
  CourseInstructorID INT PRIMARY KEY,
  FacultyID INT,
  SectionID INT,
  FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
  FOREIGN KEY (SectionID) REFERENCES Sections(SectionID)
);

-- Create the CourseLabInstructors table
CREATE TABLE CourseLabInstructors (
  CourseLabInstructorID INT PRIMARY KEY,
  FacultyID INT,
  SectionID INT,
  FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
  FOREIGN KEY (SectionID) REFERENCES Sections(SectionID)
);

-- Create the StudentsSections table
CREATE TABLE StudentsSections (
  StudentSectionID INT PRIMARY KEY,
  StudentID INT,
  SectionID INT,
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (SectionID) REFERENCES Sections(SectionID)
);

-- Create the EvaluationTypes table
CREATE TABLE EvaluationTypes (
  EvaluationTypeID INT PRIMARY KEY,
  EvaluationTypeName VARCHAR(255)
);
-- Create the EvaluationMarks table
CREATE TABLE EvaluationMarks (
  EvaluationMarkID INT PRIMARY KEY,
  StudentID INT,
  StudentSectionID INT,
  EvaluationTypeID INT,
  MarksObtained DECIMAL(5, 2),
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (StudentSectionID) REFERENCES StudentsSections(StudentSectionID) on delete cascade,
  FOREIGN KEY (EvaluationTypeID) REFERENCES EvaluationTypes(EvaluationTypeID) on delete cascade
);


-- Create the Feedback table
CREATE TABLE Feedback (
  FeedbackID INT PRIMARY KEY  IDENTITY(1,1),
  StudentID INT,
  FacultyID INT,
  CourseID INT,
  Metric1 INT,
  Metric2 INT,
  Metric3 INT,
  Metric4 INT,
  FeedbackText VARCHAR(255),


FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Feedback (StudentID, FacultyID, CourseID, Metric1, Metric2, Metric3, Metric4, FeedbackText)
VALUES
  (1, 2, 3, 4, 5, 4, 3, 'The course material was well-structured.'),
  (2, 1, 4, 3, 2, 4, 5, 'The faculty was knowledgeable and supportive.'),
  (3, 3, 2, 5, 5, 5, 5, 'The course exceeded my expectations.'),
  (1, 3, 1, 4, 3, 4, 4, 'The faculty provided valuable insights.'),
  (4, 2, 3, 2, 4, 3, 2, 'The course content could be more challenging.');


-- Create the Grades table
CREATE TABLE Grades (
GradeID INT PRIMARY KEY,
GradeName VARCHAR(255)
);

-- Create the GradeReport table
CREATE TABLE GradeReport (
GradeReportID INT PRIMARY KEY,
StudentID INT,
SectionID INT,
GradeID INT,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (SectionID) REFERENCES Sections(SectionID),
FOREIGN KEY (GradeID) REFERENCES Grades(GradeID)
);

--creatung sessions
CREATE TABLE Sessions (
  SessionID INT PRIMARY KEY,
  CourseID INT,
  SessionDate DATE,
  StartTime TIME,
  EndTime TIME,
  Location VARCHAR(100),
  FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create the AttendanceSheet table
CREATE TABLE AttendanceSheet (
  SessionID INT,
  StudentID INT,
  IsPresent TINYINT,
  PRIMARY KEY (SessionID, StudentID),
  FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID),
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);


-- Create the CourseAllocation table
CREATE TABLE CourseAllocation (
CourseAllocationID INT PRIMARY KEY    ,
CourseID INT,
FacultyID INT,
CoordinatorID INT,
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
FOREIGN KEY (CoordinatorID) REFERENCES Faculty(FacultyID)
);

-- Create the EvaluationReport table
CREATE TABLE EvaluationReport (
EvaluationReportID INT PRIMARY KEY   ,
SectionID INT,
EvaluationTypeID INT,
TotalMarks DECIMAL(5, 2),
FOREIGN KEY (SectionID) REFERENCES Sections(SectionID),
FOREIGN KEY (EvaluationTypeID) REFERENCES EvaluationTypes(EvaluationTypeID)
);

-- Create the GradesCount table
CREATE TABLE GradesCount (
GradesCountID INT PRIMARY KEY   ,
SectionID INT,
GradeID INT,
Count INT,
FOREIGN KEY (SectionID) REFERENCES Sections(SectionID),
FOREIGN KEY (GradeID) REFERENCES Grades(GradeID)
);

-- Create the MarkDistribution table
CREATE TABLE MarkDistribution (
  AssignmentWeightage DECIMAL(5, 2),
  FinalExamWeightage DECIMAL(5, 2),
  Sessional1 DECIMAL(5, 2),
  Sessional2 DECIMAL(5, 2),
  QuizWeightage DECIMAL(5, 2),
  ProjectWeightage DECIMAL(5, 2),
  CourseID INT,
  FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create the Prerequisites table
CREATE TABLE Prerequisites (
  PrerequisiteID INT PRIMARY KEY,
  CourseID INT,
  PrerequisiteCourseID INT,
  FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
  FOREIGN KEY (PrerequisiteCourseID) REFERENCES Courses(CourseID)
);

select * from StudentsSections

-- Insert statements for Roles table
INSERT INTO Roles (RoleID, RoleName) VALUES (1, 'Faculty');
INSERT INTO Roles (RoleID, RoleName) VALUES (2, 'Student');
INSERT INTO Roles (RoleID, RoleName) VALUES (3, 'Admin');

-- Insert statements for Semester table
INSERT INTO Semester (SemesterID, SemesterName) VALUES (1, 'Fall 2022');
INSERT INTO Semester (SemesterID, SemesterName) VALUES (2, 'Spring 2023');
INSERT INTO Semester (SemesterID, SemesterName) VALUES (3, 'Summer 2023');

-- Insert statements for Users table
INSERT INTO Users (UserID, Username, Password, Email, Phone, Address, RoleID) VALUES 
(1, 'john.doe', 'password123', 'john.doe@example.com', '1234567890', '123 Main St', 2),
(2, 'jane.smith', 'pass123', 'jane.smith@example.com', '9876543210', '456 Elm St', 2),
(3, 'alex.wilson', 'securepw', 'alex.wilson@example.com', '5551234567', '789 Oak St', 2),
(4, 'emily.jones', 'secret123', 'emily.jones@example.com', '4445556666', '567 Pine St', 2),
(5, 'michael.nguyen', 'mypass', 'michael.nguyen@example.com', '9998887777', '890 Cedar St', 2),
(6, 'sophia.li', 'abc123', 'sophia.li@example.com', '2223334444', '901 Maple St', 2),
(7, 'william.brown', 'testpw', 'william.brown@example.com', '7776665555', '234 Oakwood Ave', 2),
(8, 'olivia.davis', 'hello123', 'olivia.davis@example.com', '1112223333', '345 Elmwood Dr', 2),
(9, 'james.anderson', 'passw0rd', 'james.anderson@example.com', '8889990000', '456 Pinecrest Rd', 2),
(10, 'ava.wilson', 'securepass', 'ava.wilson@example.com', '4445556666', '567 Oakdale Blvd', 2),
(11, 'liam.harris', 'mysecret', 'liam.harris@example.com', '3334445555', '678 Cedarwood Ln', 2),
(12, 'isabella.thomas', 'testpass', 'isabella.thomas@example.com', '6667778888', '789 Elmwood Ave', 2),
(13, 'benjamin.johnson', 'pass1234', 'benjamin.johnson@example.com', '2223334444', '890 Maplewood Dr', 2),
(14, 'mia.lewis', 'abc1234', 'mia.lewis@example.com', '5556667777', '901 Pinecrest Rd', 2),
(15, 'oliver.white', 'test123', 'oliver.white@example.com', '9990001111', '234 Oakdale Blvd', 2),
(16, 'sophia.young', 'hello1234', 'sophia.young@example.com', '7778889999', '345 Cedarwood Ln', 2),
(17, 'ethan.martin', 'mypass123', 'ethan.martin@example.com', '1112223333', '456 Elmwood Ave', 2),
(18, 'ava.johnson', 'secret1234', 'ava.johnson@example.com', '8889990000', '567 Maplewood Dr', 2),
(19, 'noah.walker', 'mypassword', 'noah.walker@example.com', '6667778888', '678 Pinecrest Rd', 2),
(20, 'emma.hall', 'abc12345', 'emma.hall@example.com', '3334445555', '789 OakdaleBlvd', 2),
(21, 'liam.miller', 'testpass123', 'liam.miller@example.com', '5556667777', '890 Cedarwood Ln', 1),
(22, 'ava.lewis', 'pass12345', 'ava.lewis@example.com', '9990001111', '901 Elmwood Ave', 1),
(23, 'oliver.thompson', 'securepass123', 'oliver.thompson@example.com', '7778889999', '234 Maplewood Dr', 1),
(24, 'sophia.wilson', 'hellopass', 'sophia.wilson@example.com', '1112223333', '345 Pinecrest Rd', 1),
(25, 'ethan.brown', 'test12345', 'ethan.brown@example.com', '8889990000', '456 Oakdale Blvd', 1),
(26, 'mia.anderson', 'abcpass123', 'mia.anderson@example.com', '6667778888', '567 Cedarwood Ln', 1),
(27, 'noah.taylor', 'mypass12345', 'noah.taylor@example.com', '3334445555', '678 Elmwood Ave', 1),
(28, 'emma.johnson', 'abcsecurepass', 'emma.johnson@example.com', '5556667777', '789 Maplewood Dr', 1),
(29, 'liam.clark', 'testpass12345', 'liam.clark@example.com', '9990001111', '890 Pinecrest Rd', 1),
(30, 'ava.green', 'pass123456', 'ava.green@example.com', '7778889999', '901 Oakdale Blvd', 1);

-- Insert statements for Users table (continued)
INSERT INTO Users (UserID, Username, Password, Email, Phone, Address, RoleID) VALUES 
(31, 'admin1', 'adminpass1', 'admin1@example.com', '1112223333', '123 Admin St', 3),
(32, 'admin2', 'adminpass2', 'admin2@example.com', '4445556666', '456 Admin Ave', 3),
(33, 'admin3', 'adminpass3', 'admin3@example.com', '7778889999', '789 Admin Blvd', 3),
(34, 'admin4', 'adminpass4', 'admin4@example.com', '2223334444', '901 Admin Rd', 3),
(35, 'admin5', 'adminpass5', 'admin5@example.com', '5556667777', '234 Admin Ln', 3);

-- Insert statements for Students table
INSERT INTO Students (StudentID, UserID, Name, RegistrationNumber, CGPA, SGPA, Batch, CurrentSemester)
VALUES
(1, 1, 'John Smith', '20210001', 3.75, 3.8, 2021, 1),
(2, 2, 'Emily Johnson', '20210002', 3.82, 3.9, 2021, 2),
(3, 3, 'Michael Williams', '20210003', 3.64, 3.7, 2021, 2),
(4, 4, 'Sophia Brown', '20210004', 3.9, 3.95, 2021, 2),
(5, 5, 'James Davis', '20210005', 3.75, 3.8, 2021, 2),
(6, 6, 'Olivia Miller', '20210006', 3.82, 3.9, 2021, 2),
(7, 7, 'Benjamin Wilson', '20210007', 3.64, 3.7, 2021, 2),
(8, 8, 'Isabella Taylor', '20210008', 3.9, 3.95, 2021, 3),
(9, 9, 'Liam Anderson', '20210009', 3.75, 3.8, 2021, 1),
(10, 10, 'Emma Clark', '20210010', 3.82, 3.9, 2021, 1),
(11, 11, 'William Green', '20210011', 3.64, 3.7, 2021, 3),
(12, 12, 'Ava Lewis', '20210012', 3.9, 3.95, 2021, 5),
(13, 13, 'Oliver Thompson', '20210013', 3.75, 3.8, 2021, 2),   
(14, 14, 'Sophia Wilson', '20210014', 3.82, 3.9, 2021, 6),
(15, 15, 'Ethan Brown', '20210015', 3.64, 3.7, 2021, 2),
(16, 16, 'Mia Anderson', '20210016', 3.9, 3.95, 2021, 7),
(17, 17, 'Noah Taylor', '20210017', 3.75, 3.8, 2021, 3),
(18, 18, 'Emma Johnson', '20210018', 3.82, 3.9, 2021, 2),
(19, 19, 'Liam Clark', '20210019', 3.64, 3.7, 2021, 2),
(20, 20, 'Ava Green', '20210020', 3.9, 3.95, 2021, 5);

-- Insert statements for Faculty table
INSERT INTO Faculty (FacultyID, UserID, Name, Department)
VALUES
(1, 21, 'Dr. Robert Johnson', 'Computer Science'),
(2, 22, 'Dr. Jennifer Smith', 'Mechanical Engineering'),
(3, 23, 'Prof. David Williams', 'Electrical Engineering'),
(4, 24, 'Dr. Jessica Brown', 'Chemistry'),
(5, 25, 'Prof. Michael Davis', 'Physics'),
(6, 26, 'Dr. Emily Taylor', 'Biology'),
(7, 27, 'Prof. Christopher Anderson', 'Mathematics'),
(8, 28, 'Dr. Sophia Wilson', 'Civil Engineering'),
(9, 29, 'Prof. Matthew Thompson', 'English Literature'),
(10, 30, 'Dr. Olivia Clark', 'History');


-- Insert statements for Coordinator table
INSERT INTO Coordinator (UserID) VALUES (21);
INSERT INTO Coordinator (UserID) VALUES (22);

-- Insert statements for Courses table
INSERT INTO Courses (CourseID, CourseCode, CourseName, CreditHours, Semester) VALUES
(1, 'CSCI101', 'Introduction to Computer Science', 3, 1),
(2, 'MATH201', 'Calculus I', 4, 1),
(3, 'PHYS101', 'Physics I', 4, 1),
(4, 'CHEM101', 'General Chemistry I', 4, 1),
(5, 'ENGL101', 'English Composition', 3, 1),
(6, 'CSCI201', 'Data Structures', 3, 2),
(7, 'MATH202', 'Calculus II', 4, 2),
(8, 'PHYS102', 'Physics II', 4, 2);
-- Add more courses based on your requirement

-- Insert statements for Sections table
INSERT INTO Sections (SectionID, CourseID, SemesterID, SectionName, MaximumCapacity, FacultyID) VALUES
(1, 1, 1, 'CSCI101-A', 50, 5),
(2, 2, 1, 'MATH201-A', 40, 6),
(3, 3, 1, 'PHYS101-A', 60, 7),
(4, 4, 1, 'CHEM101-A', 55, 8),
(5, 5, 1, 'ENGL101-A', 30, 9),
(6, 6, 2, 'CSCI201-A', 45, 1),
(7, 7, 2, 'MATH202-A', 35, 5),
(8, 8, 2, 'PHYS102-A', 55, 6);
-- Add more sections based on your requirement

-- Insert statements for CourseInstructors table
INSERT INTO CourseInstructors (CourseInstructorID, FacultyID, SectionID) VALUES
(1, 5, 1),
(2, 6, 2),
(3, 7, 3),
(4, 8, 4),
(5, 9, 5),
(6, 1, 6),
(7, 5, 7),
(8, 6, 8);
-- Add more course instructors based on your requirement

-- Insert statements for CourseLabInstructors table
INSERT INTO CourseLabInstructors (CourseLabInstructorID, FacultyID, SectionID) VALUES
(1, 5, 1),
(2, 6, 2),
(3, 7, 3),
(4, 8, 4),
(5, 9, 5),
(6, 1, 6),
(7, 5, 7),
(8, 6, 8);
-- Add more course lab instructors based on your requirement

-- Insert statements for StudentsSections table
INSERT INTO StudentsSections (StudentSectionID, StudentID, SectionID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 1),
(10, 10, 2),
(11, 11, 3),
(12, 12, 4),
(13, 13, 5),
(14, 14, 6),
(15, 15, 7),
(16, 16, 8),
(17, 17, 1),
(18, 18, 2),
(19, 19, 3),
(20, 20, 4);
-- Add more students and corresponding section IDs based on your requirement

-- Insert statements for EvaluationTypes table
INSERT INTO EvaluationTypes (EvaluationTypeID, EvaluationTypeName) VALUES
(1, 'Exam'),
(2, 'Quiz'),
(3, 'Assignment'),
(4, 'Project');


INSERT INTO Prerequisites (PrerequisiteID, CourseID, PrerequisiteCourseID)
VALUES
  (1,1, 2), -- CourseID 1 (CSCI101) has a prerequisite of CourseID 2 (MATH101)
  (2,2, 3), -- CourseID 2 (MATH201) has a prerequisite of CourseID 3 (MATH101)
  (3,3, 4), -- CourseID 3 (PHYS202) has a prerequisite of CourseID 4 (PHYS101)
  (4,4, 5), -- CourseID 4 (ENGL102) has a prerequisite of CourseID 5 (ENGL101)
  (5,5, 6); -- CourseID 5 (CHEM301) has a prerequisite of CourseID 6 (CHEM101)


  -- Insert data into the Grades table
INSERT INTO Grades (GradeID, GradeName) VALUES
  (1, 'A'),
  (2, 'B'),
  (3, 'C'),
  (4, 'D'),
  (5, 'F');

-- Insert data into the GradeReport table
INSERT INTO GradeReport (GradeReportID, StudentID, SectionID, GradeID) VALUES
  (1, 1, 1, 1),
  (2, 2, 1, 3),
  (3, 3, 2, 2),
  (4, 4, 2, 4),
  (5, 5, 3, 1);


  -- Insert additional data into the GradeReport table
INSERT INTO GradeReport (GradeReportID, StudentID, SectionID, GradeID) VALUES
  (6, 6, 1, 3),
  (7, 7, 2, 1),
  (8, 8, 3, 4),
  (9, 9, 1, 2),
  (10, 10, 2, 5);

  select * from StudentsSections


	   -- Insert entries into the Sessions table
INSERT INTO Sessions (SessionID, CourseID, SessionDate, StartTime, EndTime, Location)
VALUES (1, 1, '2023-05-14', '09:00:00', '11:00:00', 'Room A'),
       (2, 1, '2023-05-15', '10:00:00', '12:00:00', 'Room B'),
       (3, 2, '2023-05-16', '13:00:00', '15:00:00', 'Room C');


-- Insert entries into the AttendanceSheet table
INSERT INTO AttendanceSheet (SessionID, StudentID, IsPresent)
VALUES (1, 1, 1),
       (1, 2, 0),
       (2, 1, 1),
       (2, 3, 1),
       (3, 2, 0),
       (3, 3, 1);


-- Insert entries into the CourseAllocation table
INSERT INTO CourseAllocation (CourseAllocationID, CourseID, FacultyID, CoordinatorID)
VALUES (1, 1, 2, 1),
       (2, 2, 2, 1),
       (3, 3, 1, 2);


-- Insert entries into the EvaluationReport table
INSERT INTO EvaluationReport (EvaluationReportID, SectionID, EvaluationTypeID, TotalMarks)
VALUES (1, 1, 1, 80.5),
       (2, 2, 2, 90.0),
       (3, 3, 1, 75.25);


-- Insert entries into the GradesCount table
INSERT INTO GradesCount (GradesCountID, SectionID, GradeID, Count)
VALUES (1, 1, 1, 5),
       (2, 1, 2, 10),
       (3, 2, 1, 8),
       (4, 2, 2, 12);





  INSERT INTO EvaluationMarks (EvaluationMarkID, StudentID, StudentSectionID, EvaluationTypeID, MarksObtained)
VALUES
  (1, 1, 1, 1, 85.50),
  (2, 1, 1, 2, 92.00),
  (3, 2, 1, 1, 78.00),
  (4, 2, 1, 2, 88.50),
  (5, 3, 2, 1, 90.00),
  (6, 3, 2, 2, 95.00),
  (7, 4, 2, 1, 79.50),
  (8, 4, 2, 2, 85.00),
  (9, 5, 3, 1, 92.50),
  (10, 5, 3, 2, 89.50);


  
CREATE TABLE AuditTrail (
  AuditID INT PRIMARY KEY IDENTITY(1,1),
  TableName VARCHAR(255),
  Operation VARCHAR(10),
  UserID INT,
  DateTime DATETIME,
  Details VARCHAR(255)
);








----Startng Triiger






CREATE TRIGGER Users_AuditTrail
ON Users
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
  DECLARE @Operation VARCHAR(10);

  IF EXISTS (SELECT * FROM inserted)
  BEGIN
    SET @Operation = 'INSERT';
    INSERT INTO AuditTrail (TableName, Operation, UserID, DateTime, Details)
    SELECT 'Users', @Operation, UserID, GETDATE(), 'User inserted: ' + Username
    FROM inserted;
  END;

  IF EXISTS (SELECT * FROM deleted)
  BEGIN
    SET @Operation = 'DELETE';
    INSERT INTO AuditTrail (TableName, Operation, UserID, DateTime, Details)
    SELECT 'Users', @Operation, UserID, GETDATE(), 'User deleted: ' + Username
    FROM deleted;
  END;

  IF EXISTS (SELECT * FROM inserted i INNER JOIN deleted d ON i.UserID = d.UserID)
  BEGIN
    SET @Operation = 'UPDATE';
    INSERT INTO AuditTrail (TableName, Operation, UserID, DateTime, Details)
    SELECT 'Users', @Operation, i.UserID, GETDATE(), 'User updated: ' + i.Username
    FROM inserted i
    INNER JOIN deleted d ON i.UserID = d.UserID;
  END;
END;


CREATE TRIGGER Semester_AuditTrail
ON Semester
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Operation VARCHAR(10);
    DECLARE @TableName VARCHAR(255) = 'Semester';
    DECLARE @DateTime DATETIME = GETDATE();
    DECLARE @UserID INT = 0

    IF EXISTS (SELECT * FROM deleted)
        SET @Operation = 'DELETE';
    ELSE IF EXISTS (SELECT * FROM inserted)
        SET @Operation = 'INSERT';
    ELSE
        SET @Operation = 'UPDATE';

    INSERT INTO AuditTrail (TableName, Operation, UserID, DateTime, Details)
    VALUES (@TableName, @Operation, @UserID, @DateTime, '');

END;


-- Test for Semester table
INSERT INTO Semester (SemesterID, SemesterName)
VALUES (5, 'Fall 2023');

UPDATE Semester
SET SemesterName = 'Spring 2024'
WHERE SemesterID = 1;

DELETE FROM Semester WHERE SemesterID = 3;

-- Repeat the above INSERT, UPDATE, DELETE statements for each table that has an audit trail trigger

-- View the audit trail records
SELECT * FROM AuditTrail;



-- Trigger for Faculty table
CREATE TRIGGER Faculty_AuditTrail
ON Faculty
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operation VARCHAR(10);

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        IF EXISTS (SELECT * FROM deleted)
            SET @Operation = 'UPDATE';
        ELSE
            SET @Operation = 'INSERT';
    END
    ELSE
        SET @Operation = 'DELETE';

    INSERT INTO AuditTrail (TableName, Operation, UserID, DateTime, Details)
    SELECT 'Faculty', @Operation, i.UserID, GETDATE(),
        CASE @Operation
            WHEN 'INSERT' THEN 'New faculty member created'
            WHEN 'UPDATE' THEN 'Faculty details updated'
            WHEN 'DELETE' THEN 'Faculty member deleted'
            ELSE 'Operation not specified'
        END
    FROM inserted i
    LEFT JOIN deleted d ON i.FacultyID = d.FacultyID;
END;
GO

-- Trigger for Students table
CREATE TRIGGER Students_AuditTrail
ON Students
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operation VARCHAR(10);

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        IF EXISTS (SELECT * FROM deleted)
            SET @Operation = 'UPDATE';
        ELSE
            SET @Operation = 'INSERT';
    END
    ELSE
        SET @Operation = 'DELETE';

    INSERT INTO AuditTrail (TableName, Operation, UserID, DateTime, Details)
    SELECT 'Students', @Operation, i.UserID, GETDATE(),
        CASE @Operation
            WHEN 'INSERT' THEN 'New student created'
            WHEN 'UPDATE' THEN 'Student details updated'
            WHEN 'DELETE' THEN 'Student deleted'
            ELSE 'Operation not specified'
        END
    FROM inserted i
    LEFT JOIN deleted d ON i.StudentID = d.StudentID;
END;
GO

-- Trigger for Courses table
CREATE TRIGGER Courses_AuditTrail
ON Courses
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operation VARCHAR(10);

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        IF EXISTS (SELECT * FROM deleted)
            SET @Operation = 'UPDATE';
        ELSE
            SET @Operation = 'INSERT';
    END
    ELSE
        SET @Operation = 'DELETE';

    INSERT INTO AuditTrail (TableName, Operation, UserID, DateTime, Details)
    SELECT 'Courses', @Operation, NULL, GETDATE(),
        CASE @Operation
            WHEN 'INSERT' THEN 'New course created'
            WHEN 'UPDATE' THEN 'Course details updated'
            WHEN 'DELETE' THEN 'Course deleted'
            ELSE 'Operation not specified'
        END
    FROM inserted i
    LEFT JOIN deleted d ON i.CourseID = d.CourseID;
END;
GO


CREATE TRIGGER TR_MarkDistribution_Insert
ON MarkDistribution
AFTER INSERT
AS
BEGIN
    DECLARE @AuditID INT
    SET @AuditID = (SELECT MAX(AuditID) FROM AuditTrail)

    INSERT INTO AuditTrail (TableName, Operation, DateTime, Details)
    SELECT 'MarkDistribution', 'INSERT', GETDATE(), 'New record inserted into MarkDistribution'
    FROM inserted
END

CREATE TRIGGER TR_MarkDistribution_Update
ON MarkDistribution
AFTER UPDATE
AS
BEGIN
    DECLARE @AuditID INT
    SET @AuditID = (SELECT MAX(AuditID) FROM AuditTrail)

    INSERT INTO AuditTrail (TableName, Operation, DateTime, Details)
    SELECT 'MarkDistribution', 'UPDATE', GETDATE(), 'Record updated in MarkDistribution'
    FROM inserted
END

CREATE TRIGGER TR_MarkDistribution_Delete
ON MarkDistribution
AFTER DELETE
AS
BEGIN
    DECLARE @AuditID INT
    SET @AuditID = (SELECT MAX(AuditID) FROM AuditTrail)

    INSERT INTO AuditTrail (TableName, Operation, DateTime, Details)
    SELECT 'MarkDistribution', 'DELETE', GETDATE(), 'Record deleted from MarkDistribution'
    FROM deleted
END

CREATE TRIGGER Sections_AuditTrail
ON Sections
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operation VARCHAR(10);

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        IF EXISTS (SELECT * FROM deleted)
            SET @Operation = 'UPDATE';
        ELSE
            SET @Operation = 'INSERT';
    END
    ELSE
        SET @Operation = 'DELETE';

    INSERT INTO AuditTrail (TableName, Operation, UserID, DateTime, Details)
    SELECT 'Sections', @Operation, NULL, GETDATE(),
        CASE @Operation
            WHEN 'INSERT' THEN 'New section created'
            WHEN 'UPDATE' THEN 'Section details updated'
            WHEN 'DELETE' THEN 'Section deleted'
            ELSE 'Operation not specified'
        END
    FROM inserted i
    LEFT JOIN deleted d ON i.SectionID = d.SectionID;
END;
GO


CREATE TRIGGER Prerequisites_AuditTrail
ON Prerequisites
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operation VARCHAR(10);

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        IF EXISTS (SELECT * FROM deleted)
            SET @Operation = 'UPDATE';
        ELSE
            SET @Operation = 'INSERT';
    END
    ELSE
        SET @Operation = 'DELETE';

    INSERT INTO AuditTrail (TableName, Operation, UserID, DateTime, Details)
    SELECT 'Prerequisites', @Operation, NULL, GETDATE(),
        CASE @Operation
            WHEN 'INSERT' THEN 'New prerequisite created'
            WHEN 'UPDATE' THEN 'Prerequisite details updated'
            WHEN 'DELETE' THEN 'Prerequisite deleted'
            ELSE 'Operation not specified'
        END
    FROM inserted i
    LEFT JOIN deleted d ON i.PrerequisiteID = d.PrerequisiteID;
END;
GO


CREATE TRIGGER EvaluationMarks_AuditTrail
ON EvaluationMarks
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operation VARCHAR(10);

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        IF EXISTS (SELECT * FROM deleted)
            SET @Operation = 'UPDATE';
        ELSE
            SET @Operation = 'INSERT';
    END
    ELSE
        SET @Operation = 'DELETE';

    INSERT INTO AuditTrail (TableName, Operation, UserID, DateTime, Details)
    SELECT 'EvaluationMarks', @Operation, NULL, GETDATE(),
        CASE @Operation
            WHEN 'INSERT' THEN 'New evaluation mark created'
            WHEN 'UPDATE' THEN 'Evaluation mark updated'
            WHEN 'DELETE' THEN 'Evaluation mark deleted'
            ELSE 'Operation not specified'
        END
    FROM inserted i
    LEFT JOIN deleted d ON i.EvaluationMarkID = d.EvaluationMarkID;
END;
GO


  select * from Users
  select * from Students
  Insert into Students (StudentID, UserID, Name, RegistrationNumber, Batch, CurrentSemester) values ((Select max(StudentID)+1 from Students), (Select max(UserID)+1 from Students), 'gey', (Select max(RegistrationNumber)+1 from Students), 2, 2);
  use nig4
  select * from MarkDistribution
  DELETE FROM Students WHERE RegistrationNumber = 20210021


  INSERT INTO Students (StudentID, UserID, Name, RegistrationNumber, Batch, CurrentSemester) values ((Select max(StudentID)+1 from Students), (Select max(UserID)+1 from Students), @Name, @RegNo, @Batch, @Semester);
  select * from courses
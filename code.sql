

-- Name: Eve Joyce
-- Student ID: 103681990

/*
Task 1 - Relational Schema

Subject(SubjCode, Description)
PK(SubjCode)

Student(StudentId, Surname, GivenName, Gender)
PK(StudentId)

SubjectOffering(SubjCode, Year, Semester, StaffID)
PK(SubjCode, Year, Semester)
FK(SubjCode) References Subject
FK(StaffID) References Teacher

Enrolment(StudentId, SubjCode, Year, Semester, Grade, DateEnrolled)
PK(StudentId,SubjCode, Year, Semester)
FK(StudentId) References Student
FK(SubjCode, Year, Semester) References SubjectOffering

Teacher(StaffID, Surname, GivenName)
PK(StaffID)
*/

/*
Task 2 - DB creation
*/

-- CREATE DATABASE PracticeChallenge103681990

-- Use PracticeChallenge103681990

IF OBJECT_ID('Subject') IS NOT NULL
	DROP TABLE Subject;
GO

CREATE TABLE Subject(
    SubjCode NVARCHAR(100),
    Description NVARCHAR(500),
    PRIMARY KEY (SubjCode)
);

IF OBJECT_ID('Student') IS NOT NULL
	DROP TABLE Student;
GO

CREATE TABLE Student(
    StudentId NVARCHAR(10),
    Surname NVARCHAR(100) NOT NULL,
    GivenName NVARCHAR(100) NOT NULL,
    Gender NVARCHAR(1),
    CONSTRAINT CHK_Person CHECK (Gender IN ('M', 'F', 'I')),
    PRIMARY KEY(StudentId)
);

IF OBJECT_ID('SubjectOffering') IS NOT NULL
	DROP TABLE SubjectOffering;
GO

CREATE TABLE SubjectOffering(
    SubjCode NVARCHAR(100), 
    Year INT CHECK (Year>999),
    Semester INT CHECK(Semester IN (1,2)),
    Fee MONEY NOT NULL CHECK(Fee > 0),
    StaffID INT,
    PRIMARY KEY(SubjCode, Year, Semester),
    FOREIGN KEY(SubjCode) REFERENCES Subject,
    FOREIGN KEY(StaffId) REFERENCES Teacher
)

IF OBJECT_ID('Enrolment') IS NOT NULL
	DROP TABLE Enrolment;
GO

CREATE TABLE Enrolment(StudentId NVARCHAR(10),
    SubjCode NVARCHAR(100),
    Year INT CHECK (Year>999),
    Semester INT CHECK(Semester IN (1,2)),
    Grade NVARCHAR(2) CHECK (Grade IN ('N', 'P', 'C', 'D', 'HD', NULL)),
    DateEnrolled DATE,
    PRIMARY KEY(StudentId,SubjCode, Year, Semester),
    FOREIGN KEY(StudentId) References Student,
    FOREIGN KEY(SubjCode, Year, Semester) References SubjectOffering
)

IF OBJECT_ID('Teacher') IS NOT NULL
	DROP TABLE Teacher;
GO

CREATE TABLE Teacher(
    StaffID INT CHECK(StaffID>9999999),
    Surname NVARCHAR(100) NOT NULL,
    GivenName NVARCHAR(100) NOT NULL,
    PRIMARY KEY(StaffID)
)

select table_name from information_schema.tables;
exec sp_columns project;

/* 
Task 3 - 
*/




/*
Task 4 - 
*/



/*
Task 5 - 
*/


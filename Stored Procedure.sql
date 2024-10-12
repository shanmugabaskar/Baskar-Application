use StudentDB3;

-- Insert Student Stored Procedure
CREATE OR ALTER PROCEDURE spInsertStudent
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Branch NVARCHAR(100),
    @Gender NVARCHAR(50),
    @StudentId INT OUTPUT
AS
BEGIN
    INSERT INTO Students (FirstName, LastName, Branch, Gender)
    VALUES (@FirstName, @LastName, @Branch, @Gender);
    -- Retrieve the newly inserted StudentId
    SET @StudentId = SCOPE_IDENTITY();
END

-- Updates the specified student record based on StudentId.
CREATE OR ALTER PROCEDURE spUpdateStudent
    @StudentId INT,
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Branch NVARCHAR(100),
    @Gender NVARCHAR(50)
AS
BEGIN
    UPDATE Students
    SET 
        FirstName = @FirstName,
        LastName = @LastName,
        Branch = @Branch,
        Gender = @Gender
    WHERE StudentId = @StudentId;
END

-- Delete the specified student record based on StudentId.
CREATE OR ALTER PROCEDURE spDeleteStudent
    @StudentId int
AS
BEGIN
    DELETE FROM Students WHERE StudentId = @StudentId
END

-- Get All Student Stored Procedure
CREATE OR ALTER PROCEDURE spGetAllStudents
AS
BEGIN
    SELECT StudentId, FirstName, LastName, Branch, Gender 
    FROM Students;
END

-- Get Student by Student Id 
CREATE OR ALTER PROCEDURE spGetStudentByStudentId
    @StudentId INT
AS
BEGIN
    SELECT StudentId, FirstName, LastName, Branch, Gender 
    FROM Students 
    WHERE StudentId = @StudentId;
END
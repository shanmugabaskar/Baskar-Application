INSERT INTO Branches (BranchName, Description, PhoneNumber, Email)
VALUES 
('Computer Science Engineering', 'Department focused on software development, algorithms, and computer systems.', '555-1010', 'cse@dotnettutorials.net'),
('Mechanical Engineering', 'Department focused on design, analysis, and manufacturing of mechanical systems.', '555-2020', 'me@dotnettutorials.net'),
('Electrical Engineering', 'Department focused on electrical systems, electronics, and signal processing.', '555-3030', 'ee@dotnettutorials.net'),
('Civil Engineering', 'Department focused on infrastructure, environmental, and construction engineering.', '555-4040', 'ce@dotnettutorials.net');
GO
-- Insert Data into Students Table
INSERT INTO [dbo].[Students] (FirstName, LastName, DateOfBirth, Gender, Email, PhoneNumber, EnrollmentDate, BranchId)
VALUES 
('Alice', 'Wong', '2001-02-14', 'Female', 'alice.wong@dotnettutorials.net', '555-1111', '2023-08-15', 1),
('Bob', 'Johnson', '2002-06-22', 'Male', 'bob.johnson@dotnettutorials.net', '555-2222', '2023-08-16', 2),
('Carol', 'Martinez', '2000-11-02', 'Female', 'carol.martinez@dotnettutorials.net', '555-3333', '2023-08-17', 3),
('David', 'Kim', '1999-12-19', 'Male', 'david.kim@dotnettutorials.net', '555-4444', '2023-08-18', 4),
('Eve', 'Nguyen', '2001-05-03', 'Female', 'eve.nguyen@dotnettutorials.net', '555-5555', '2023-08-19', 1),
('Frank', 'Connor', '2002-09-11', 'Male', 'frank.oconnor@dotnettutorials.net', '555-6666', '2023-08-20', 2),
('Grace', 'Lee', '2003-01-25', 'Female', 'grace.lee@dotnettutorials.net', '555-7777', '2023-08-21', 3),
('Henry', 'Patel', '2001-07-08', 'Male', 'henry.patel@dotnettutorials.net', '555-8888', '2023-08-22', 4),
('Ivy', 'Zhang', '2002-03-15', 'Female', 'ivy.zhang@dotnettutorials.net', '555-9999', '2023-08-23', 1),
('Jack', 'Wilson', '2000-10-29', 'Male', 'jack.wilson@dotnettutorials.net', '555-0000', '2023-08-24', 2);
GO
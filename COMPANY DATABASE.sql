CREATE DATABASE Company;
USE Company;

CREATE TABLE Employee (
<<<<<<< HEAD
	empName		varchar(50),
	empDOB		Date,
	empSIN 		int KEY,
	empAddress	varchar(50),
	phoneNum	varchar(50)	unique,
	salary		int,
	empGender	char,
	deptName	varchar(50)
=======
	empName		VARCHAR(30),
	empDOB			DATE,
	empSIN 			INT PRIMARY KEY,
	empAddress	VARCHAR(50),
	phoneNum		VARCHAR(12) UNIQUE,
	hourlySalary	INT,
	empGender		CHAR,
	deptName		VARCHAR(30)
    -- CONSTRAINT chk_gender CHECK (empGender IN ('M', 'F'))
>>>>>>> master
);

DELIMITER //
CREATE TRIGGER check_hourlySalary BEFORE INSERT ON employee
	FOR EACH ROW 
	BEGIN
		IF NEW.hourlySalary < 0 THEN
			SET NEW.hourlySalary = NULL;
		END IF;
	END//
DELIMITER ;

CREATE TABLE Dependent (
<<<<<<< HEAD
	dependentName		varchar(50),
	dependentDOB		Date,
	dependentSIN		int KEY,
	empSIN 				int,
	dependentGender		char
);

CREATE TABLE Department (
	deptName			varchar(50) KEY,
	deptNumber			int unique,
	deptManagerSIN		int unique,
	managerStartDate	date
);

CREATE TABLE Projects (
	projName		varchar(50) unique,
    projID			int KEY,
    projLocation 	varchar(50),
    deptName 		varchar(50),
    projLeaderSIN	int
);

CREATE TABLE WorksOn (
	empSIN		int,
    projID		int,
    hoursWorked	int,
    key (empSIN, projID)
);

# employee getting fired, update all tables
ALTER TABLE Department ADD CONSTRAINT fk_SIN foreign key (deptManagerSIN) references Employee (empSIN) on delete set null;
# ALTER TABLE Department ADD CONSTRAINT fk_SIN foreign key (managerStartDate) references Employee (empSIN) on delete set null;
ALTER TABLE Dependent ADD CONSTRAINT fk_dependent foreign key (empSIN) references Employee (empSIN) on delete cascade;
ALTER TABLE Projects ADD CONSTRAINT fk_projSIN foreign key (projLeaderSIN) references Employee (empSIN) on delete set null;

# Department name is changed or closed down, update all tables
ALTER TABLE projects ADD CONSTRAINT fk_projDeptName FOREIGN KEY (deptName) references department (deptName) on delete set null on update cascade;
ALTER TABLE employee ADD CONSTRAINT fk_empDeptName FOREIGN KEY (deptName) references department (deptName) on delete set null on update cascade;


#---------------------------------------------------------------------------------------------------------------------









=======
	dependentName		VARCHAR(30),
	dependentDOB		DATE,
	dependentSIN			INT PRIMARY KEY,
	empSIN 					INT,
	dependentGender	CHAR
 --   CONSTRAINT chk_gender CHECK (dependentGender IN ('M', 'F'))
);

CREATE TABLE Department (
	deptName				VARCHAR(30) PRIMARY KEY,
	deptNumber			INT UNIQUE,
	deptManagerSIN		INT UNIQUE,
	managerStartDate	DATE
);

CREATE TABLE DeptLocations (
	deptName	VARCHAR(30),
	deptLocation	VARCHAR(30),
	PRIMARY KEY (deptName, deptLocation)
);

CREATE TABLE Projects (
	projName		VARCHAR(50) UNIQUE,
    projID				INT PRIMARY KEY,
    projLocation 	VARCHAR(30),
    projPhase		VARCHAR(50),
    deptName 		VARCHAR(30),
    projLeaderSIN	INT
--    CONSTRAINT chk_phase CHECK (projPhase IN ('preliminary', 'intermediate', 'advanced', 'complete'))
);

CREATE TABLE WorksOn (
	empSIN			INT,
    projID				INT,
    hoursWorked	INT,
    PRIMARY KEY(empSIN, projID)
);
>>>>>>> master

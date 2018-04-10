CREATE DATABASE Company;
USE Company;

CREATE TABLE Employee (
	empName		VARCHAR(30),
	empDOB			DATE,
	empSIN 			INT PRIMARY KEY,
	empAddress	VARCHAR(50),
	phoneNum		VARCHAR(12) UNIQUE,
	hourlySalary	INT,
	empGender		CHAR,
	deptName		VARCHAR(30)
    -- CONSTRAINT chk_gender CHECK (empGender IN ('M', 'F'))
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

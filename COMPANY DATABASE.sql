CREATE DATABASE wyc353_4;
USE wyc353_4;

CREATE TABLE employee (
	empName		VARCHAR(30),
	empDOB			DATE,
	empSIN 			INT PRIMARY KEY,
	empAddress	VARCHAR(50),
	phoneNum		VARCHAR(12) UNIQUE,
	hourlySalary	INT,
	empGender		CHAR,
	deptName		VARCHAR(30),
    CONSTRAINT chk_gender CHECK (empGender IN ('M', 'F'))
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

CREATE TABLE dependent (
	dependentName		VARCHAR(30),
	dependentDOB		DATE,
	dependentSIN			INT PRIMARY KEY,
	empSIN 					INT,
	dependentGender	CHAR,
   CONSTRAINT chk_gender CHECK (dependentGender IN ('M', 'F'))
);

CREATE TABLE department (
	deptName				VARCHAR(30) PRIMARY KEY,
	deptNumber			INT UNIQUE,
	deptManagerSIN		INT UNIQUE,
	managerStartDate	DATE
);

CREATE TABLE deptLocations (
	deptName		VARCHAR(30),
	deptLocation	VARCHAR(30),
	PRIMARY KEY (deptName, deptLocation)
);

CREATE TABLE projects (
	projName		VARCHAR(50) UNIQUE,
    projID				INT PRIMARY KEY,
    projLocation 	VARCHAR(30),
    projPhase		VARCHAR(50),
    deptName 		VARCHAR(30),
    projLeaderSIN	INT,
   CONSTRAINT chk_phase CHECK (projPhase IN ('preliminary', 'intermediate', 'advanced', 'complete'))
);

CREATE TABLE worksOn (
	empSIN			INT,
    projID				INT,
    hoursWorked	INT,
    PRIMARY KEY(empSIN, projID)
);

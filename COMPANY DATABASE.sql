CREATE DATABASE Company;
USE Company;

CREATE TABLE Employee (
	empName		VARCHAR(50),
	empDOB			DATE,
	empSIN 			INT PRIMARY KEY,
	empAddress	VARCHAR(50),
	phoneNum		VARCHAR(12) UNIQUE,
	salary				INT,
	empGender		CHAR,
	deptName		VARCHAR(50)
);

CREATE TABLE Dependent (
	dependentName		VARCHAR(50),
	dependentDOB		DATE,
	dependentSIN			INT PRIMARY KEY,
	empSIN 					INT,
	dependentGender	CHAR
);

CREATE TABLE Department (
	deptName				VARCHAR(50) PRIMARY KEY,
	deptNumber			INT UNIQUE,
	deptManagerSIN		INT UNIQUE,
	managerStartDate	DATE
);

CREATE TABLE Projects (
	projName		VARCHAR(50) UNIQUE,
    projID				INT PRIMARY KEY,
    projLocation 	VARCHAR(50),
    deptName 		VARCHAR(50),
    projLeaderSIN	INT
);

CREATE TABLE WorksOn (
	empSIN			INT,
    projID				INT,
    hoursWorked	INT,
    PRIMARY KEY(empSIN, projID)
);

# employee getting fired, update all tables
ALTER TABLE Department ADD CONSTRAINT fk_SIN FOREIGN KEY (deptManagerSIN) REFERENCES Employee (empSIN) ON DELETE SET NULL;
# ALTER TABLE Department ADD CONSTRAINT fk_SIN foreign key (managerStartDate) references Employee (empSIN) on delete set null;
ALTER TABLE Dependent ADD CONSTRAINT fk_dependent FOREIGN KEY (empSIN) REFERENCES Employee (empSIN) ON DELETE CASCADE;
ALTER TABLE Projects ADD CONSTRAINT fk_projSIN FOREIGN KEY (projLeaderSIN) REFERENCES Employee (empSIN) ON DELETE SET NULL;

# Department name is changed or closed down, update all tables
ALTER TABLE projects ADD CONSTRAINT fk_projDeptName FOREIGN KEY (deptName) REFERENCES department (deptName) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE employee ADD CONSTRAINT fk_empDeptName FOREIGN KEY (deptName) REFERENCES department (deptName) ON DELETE SET NULL ON UPDATE CASCADE;


#---------------------------------------------------------------------------------------------------------------------







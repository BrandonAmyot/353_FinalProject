CREATE Database Company;
use Company;

CREATE TABLE Employee (
	empName		varchar(50),
	empDOB		Date,
	empSIN 		int KEY,
	empAddress	varchar(50),
	phoneNum	varchar(50)	unique,
	salary		int,
	empGender	char,
	deptName	varchar(50)
);

CREATE TABLE Dependent (
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









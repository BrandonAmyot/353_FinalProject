CREATE Database Company;
use Company;

CREATE TABLE Employee (
	empName		varchar(20),
	empDOB			Date,
	empSIN 			int KEY,
	empAddress	varchar(20),
	phoneNum		varchar(20)	unique,
	salary				int,
	empGender		char,
	deptName		varchar(20)
);

CREATE TABLE Dependent (
	dependentName		varchar(20),
	dependentDOB		Date,
	dependentSIN			int KEY,
	empSIN 					int,
	dependentGender	char
);

CREATE TABLE Department (
	deptName				varchar(20) KEY,
	deptNumber			int unique,
	deptManagerSIN		int unique,
	managerStartDate	date
);

CREATE TABLE Projects (
	projName		varchar(20) unique,
    projID				int KEY,
    projLocation 	varchar(20),
    deptName 	varchar(20),
    projLeaderSIN	int
);

CREATE TABLE WorksOn (
	empSIN			int,
    projID				int,
    hoursWorked	int,
    key (empSIN, projID)
);

# employee getting fired, update all tables
ALTER TABLE Department ADD CONSTRAINT fk_SIN foreign key (deptManagerSIN) references Employee (empSIN) on delete set null;
# ALTER TABLE Department ADD CONSTRAINT fk_SIN foreign key (managerStartDate) references Employee (empSIN) on delete set null;
ALTER TABLE WorksOn ADD CONSTRAINT fk_name foreign key (empSIN) references Employee (empSIN) on delete cascade;
ALTER TABLE Dependent ADD CONSTRAINT fk_dependent foreign key (empSIN) references Employee (empSIN) on delete cascade;

# project shutting down, update all tables (remove project from WorksOn)
ALTER TABLE WorksOn ADD CONSTRAINT fk_proj foreign key (projID) references Projects (projID) on delete cascade;

# Department name is changed or closed down, update all tables
ALTER TABLE projects ADD CONSTRAINT fk_projDeptName FOREIGN KEY (deptName) references department (deptName) on delete cascade; 
# dept is deleted, the projects get deleted
ALTER TABLE employee ADD CONSTRAINT fk_empDeptName FOREIGN KEY (deptName) references department (deptName) on delete set null;


insert into employee values ('John Edward', DATE '1960-01-01', 123321111, '67 Ontario', '999-111-9999', 50000, 'M', 'Finance');
insert into Department values ('Finance', 0001, 123321111, DATE '2010-01-01');

delete from Employee where empSIN = 123321111;


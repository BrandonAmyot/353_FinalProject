USE wyc353_4;

update workson set hoursworked = 50 where empSIN = 3 and projID = 100;

# cost per employee per project
select empSIN, (hourlysalary * (select hoursworked from workson where empSIN = 1)) as salaryOnProject from employee where empSIN = 1;
# employee yearly salary
select empSIN, (hourlysalary * 40 * 52) as salaryOnProject from employee where empSIN = 1;
# company total per year
select sum(hourlysalary * 40 * 52) as companyTotal from employee;

# total hours per project
select projID, sum(hoursworked) as totalProjectTime from workson where projID = 100;
# total hours worked in a dept
select sum(hoursworked) from worksOn, projects where workson.projID = projects.projID AND projects.deptName = 'accounting';
# total cost per department
SELECT SUM(hoursWorked * hourlySalary) FROM WorksOn NATURAL JOIN Employee WHERE deptName = 'shipping';
# display all projects in specified phase
select projID from projects where projPhase = 'advanced';

# employee who works on the most projects
insert into worksOn values (2, 101, 18);
insert into worksOn values (2, 106, 15);
select empSIN, count(empSIN) as numOfProjects from worksOn group by empSIN order by count(empSin) desc limit 1;
# minimum
select empSIN, count(empSIN) as numOfProjects from worksOn group by empSIN order by count(empSin) asc limit 1;

# department managers
select empSIN from employee, department where empSIN = deptManagerSIN;
# project leaders
select empSIN from employee, projects where empSIN = projLeaderSIN;
# who works for a specified leader
select empSIN from workson, projects where projLeaderSIN = 2 AND worksON.projID = projects.projID;
# which department heads are project leaders
select empSIN from employee natural join projects natural join department where projLeaderSIN = deptManagerSIN;
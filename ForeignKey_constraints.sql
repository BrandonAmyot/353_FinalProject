USE Company;

# employee getting fired, update all tables
ALTER TABLE Department ADD CONSTRAINT fk_SIN FOREIGN KEY (deptManagerSIN) REFERENCES Employee (empSIN) ON DELETE SET NULL;
# ALTER TABLE Department ADD CONSTRAINT fk_SIN foreign key (managerStartDate) references Employee (empSIN) on delete set null;
ALTER TABLE Dependent ADD CONSTRAINT fk_dependent FOREIGN KEY (empSIN) REFERENCES Employee (empSIN) ON DELETE CASCADE;
ALTER TABLE Projects ADD CONSTRAINT fk_projSIN FOREIGN KEY (projLeaderSIN) REFERENCES Employee (empSIN) ON DELETE SET NULL;

# Department name is changed or closed down, update all tables
ALTER TABLE projects ADD CONSTRAINT fk_projDeptName FOREIGN KEY (deptName) REFERENCES department (deptName) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE employee ADD CONSTRAINT fk_empDeptName FOREIGN KEY (deptName) REFERENCES department (deptName) ON DELETE SET NULL ON UPDATE CASCADE;

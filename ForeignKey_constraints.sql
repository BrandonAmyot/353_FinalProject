USE wyc353_4;

# employee getting fired, update all tables
ALTER TABLE department ADD CONSTRAINT fk_SIN FOREIGN KEY (deptManagerSIN) REFERENCES employee (empSIN) ON DELETE SET NULL;
ALTER TABLE dependent ADD CONSTRAINT fk_dependent FOREIGN KEY (empSIN) REFERENCES employee (empSIN) ON DELETE CASCADE;
ALTER TABLE projects ADD CONSTRAINT fk_projSIN FOREIGN KEY (projLeaderSIN) REFERENCES employee (empSIN) ON DELETE SET NULL;

# Department name is changed or closed down, update all tables
ALTER TABLE projects ADD CONSTRAINT fk_projDeptName FOREIGN KEY (deptName) REFERENCES department (deptName) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE employee ADD CONSTRAINT fk_empDeptName FOREIGN KEY (deptName) REFERENCES department (deptName) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE deptLocations ADD CONSTRAINT fk_locationsDeptName FOREIGN KEY (deptName) REFERENCES department (deptName) ON DELETE CASCADE ON UPDATE CASCADE;

USE company;

# Sales
INSERT INTO employee VALUES ('Michael Scott', DATE '1964-05-03', 0001, '12 Oak St', '514-111-1243', 28, 'M', 'Sales');
INSERT INTO employee VALUES ('Dwight Schrute', DATE '1977-03-01', 0002, '27 Elm St', '514-376-1243', 25, 'M', 'Sales');
INSERT INTO employee VALUES ('Jim Halpert', DATE '1978-01-10', 0003, '54 Steam St', '514-172-4321', 24, 'M', 'Sales');
INSERT INTO employee VALUES ('Stanley Hudson', DATE '1958-09-02', 0004, '421 Willow St', '514-329-1000', 24, 'M', 'Sales');
INSERT INTO employee VALUES ('Phyllis Vance', DATE '1964-05-03', 0005, '790 Maple St', '514-300-2741',  24, 'F', 'Sales');
INSERT INTO employee VALUES ('Andrew Bernard', DATE '1973-04-01', 0006, '47 Ash St', '514-271-3810', 23, 'M', 'Sales');

#Accounting
INSERT INTO employee VALUES ('Angela Schrute', DATE '1971-05-06', 0007, '27 Elm St', '514-378-1432', 22, 'F', 'Accounting');
INSERT INTO employee VALUES ('Kevin Malone', DATE '1968-01-06', 0008, '24 Stanford Ave', '514-390-3478', 20, 'M', 'Accounting');
INSERT INTO employee VALUES ('Oscar Martinez', DATE '1958-10-11', 0009, '33 Fir St', '514-128-9039', 20, 'M', 'Accounting');

#Quality Assurance
INSERT INTO employee VALUES ('Creed Bratton', DATE '1943-08-02', 0010, '75 Staple Ave', '514-222-1420', 20, 'M', 'Quality Assurance');
INSERT INTO employee VALUES ('Meredith Palmer', DATE '1959-12-05', 0011, '33 Charleston St', '514-333-3857', 20, 'F', 'Quality Assurance');

#Customer Service
INSERT INTO employee VALUES ('Kelly Kapoor', DATE '1980-05-02', 0012, '72 Prince Ave', '514-123-0947', 21, 'F', 'Customer Service');
INSERT INTO employee VALUES ('Ryan Howard', DATE '1979-05-05', 0013, '46 King Crescent', '514-957-3840', 22, 'M', 'Customer Service');

#Human Resources
INSERT INTO employee VALUES ('Toby Flenderson', DATE '1971-02-02', 0014, '957 Park Ave', '514-119-6778', 23, 'M', 'Human Resources');
INSERT INTO employee VALUES ('Holly Flax', DATE '1958-08-11', 0015, '12 Oak St', '514-121-9039', 22, 'F', 'Human Resources');
INSERT INTO employee VALUES ('Pamela Halpert', DATE '1979-05-03', 0016, '54 Steam St','514-120-9039', 21, 'F', 'Human Resources');

#Shipping
INSERT INTO employee VALUES ('Darryl Philbin', DATE '1971-02-10', 0017, '12 Jackson St', '514-987-3739', 25, 'M', 'Shipping');
INSERT INTO employee VALUES ('Roy Anderson', DATE '1973-06-07', 0018, '154 Park Ave', '514-205-2820', 21, 'M', 'Shipping');
INSERT INTO employee VALUES ('Madge Madsen', DATE '1973-09-10', 0019, '743 Ford St', '514-297-1205', 20, 'F', 'Shipping');

-- INSERT INTO employee VALUES ('herm', DATE '1973-09-10', 0020, '743 Ford St', '514-297-1000', -4, 'H', 'Shipping');
-- 
-- delete from employee where empSIN = 0020;

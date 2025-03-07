 drop database lodge;
 create database Lodge;
use lodge;




CREATE TABLE Lodge (
    LodgeID INT PRIMARY KEY,
    LodgeName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    ContactInfo VARCHAR(50)
);

-- Insert 2 records into Lodge table
INSERT INTO Lodge (LodgeID, LodgeName, City, State, ZipCode, ContactInfo) VALUES 
(1, 'Maharashtra Lodge', 'Mumbai', 'Maharashtra', '400001', '022-9876543210'),
(2, 'Deccan Retreat', 'Pune', 'Maharashtra', '411001', '020-1234567890');


CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    Email VARCHAR(100),
    lodgeid int,
    foreign key(lodgeid) references lodge(lodgeid)
);

-- Insert 10 records into Employee table
INSERT INTO Employee (EmployeeID, FirstName, LastName, Position, HireDate, Salary, Email, lodgeid) VALUES
(101, 'Suresh', 'Deshmukh', 'Manager', '2022-01-10', 50000, 'suresh.d@example.com',2),
(102, 'Rahul', 'Patil', 'Receptionist', '2021-05-12', 25000, 'rahul.p@example.com',1),
(103, 'Sneha', 'Jadhav', 'Housekeeper', '2020-03-15', 20000, 'sneha.j@example.com',2),
(104, 'Rohit', 'Pawar', 'Security', '2019-11-08', 18000, 'rohit.p@example.com',2),
(105, 'Anita', 'Kadam', 'Chef', '2022-07-01', 35000, 'anita.k@example.com',1),
(106, 'Vijay', 'Kulkarni', 'Waiter', '2023-04-09', 15000, 'vijay.k@example.com',2),
(107, 'Amit', 'Shinde', 'Maintenance', '2021-09-14', 22000, 'amit.s@example.com',1),
(108, 'Prachi', 'Sawant', 'Manager', '2020-02-18', 48000, 'prachi.s@example.com',2),
(109, 'Maya', 'Naik', 'Receptionist', '2021-01-27', 24000, 'maya.n@example.com',1),
(110, 'Rakesh', 'Bhosale', 'Security', '2022-08-23', 19000, 'rakesh.b@example.com',2);

-- Multivalued Table for Employee Phone Numbers
CREATE TABLE EmployeePhoneNumber (
    EmployeeID INT,
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (EmployeeID, PhoneNumber),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Insert multivalued phone numbers for employees
INSERT INTO EmployeePhoneNumber (EmployeeID, PhoneNumber) VALUES
(101, '9876543210'), (101, '9123456780'),
(102, '9812345678'), (103, '9898989898'),
(104, '9123456789'), (105, '9876781234'),
(106, '9123451212'), (107, '9131231234'),
(108, '9801234567'), (109, '9845673210'),
(110, '9812323456');




CREATE TABLE Room (
    RoomID INT PRIMARY KEY,
    RoomNumber INT,
    RoomType VARCHAR(50),
    Capacity INT,
    RatePerNight DECIMAL(10, 2),
    IsAvailable BOOLEAN default 0,
    LodgeID INT,
    FOREIGN KEY (LodgeID) REFERENCES Lodge(LodgeID)
);


-- Insert 10 records into Room table
INSERT INTO Room (RoomID, RoomNumber, RoomType, Capacity, RatePerNight,  LodgeID) VALUES
(201, 101, 'Deluxe', 2, 3000,  1),
(202, 102, 'Deluxe', 2, 3000,  1),
(203, 103, 'Suite', 4, 5000,  1),
(204, 104, 'Suite', 4, 5000,  2),
(205, 105, 'Standard', 2, 2000,  2),
(206, 106, 'Standard', 2, 2000,  2),
(207, 107, 'Deluxe', 3, 3500,  1),
(208, 108, 'Suite', 4, 5200,  2),
(209, 109, 'Standard', 2, 2500,  2),
(210, 110, 'Deluxe', 3, 3800,  1);

CREATE TABLE Guest (
    GuestID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10)
);

-- Insert 10 records into Guest table
INSERT INTO Guest (GuestID, FirstName, LastName, Phone, Email, Street, City, State, ZipCode) VALUES
(301, 'Aditya', 'Joshi', '9876543211', 'aditya.j@example.com', 'MG Road', 'Mumbai', 'Maharashtra', '400002'),
(302, 'Neha', 'Patil', '9123456781', 'neha.p@example.com', 'JM Road', 'Pune', 'Maharashtra', '411002'),
(303, 'Vikram', 'Shinde', '9812345679', 'vikram.s@example.com', 'FC Road', 'Mumbai', 'Maharashtra', '400003'),
(304, 'Priya', 'Kulkarni', '9898989899', 'priya.k@example.com', 'SB Road', 'Pune', 'Maharashtra', '411003'),
(305, 'Swapnil', 'Kale', '9123456782', 'swapnil.k@example.com', 'Linking Road', 'Mumbai', 'Maharashtra', '400004'),
(306, 'Aarti', 'Phadke', '9876781235', 'aarti.p@example.com', 'Laxmi Road', 'Pune', 'Maharashtra', '411004'),
(307, 'Tejas', 'Naik', '9123451213', 'tejas.n@example.com', 'Baner Road', 'Pune', 'Maharashtra', '411005'),
(308, 'Manoj', 'Deshpande', '9131231235', 'manoj.d@example.com', 'Nariman Point', 'Mumbai', 'Maharashtra', '400005'),
(309, 'Snehal', 'Sawant', '9801234568', 'snehal.s@example.com', 'Wakad', 'Pune', 'Maharashtra', '411006'),
(310, 'Raj', 'Bhosale', '9845673211', 'raj.b@example.com', 'Koregaon Park', 'Pune', 'Maharashtra', '411007');



CREATE TABLE Services (
    ServiceID INT,
    ServiceType VARCHAR(100),
    Cost DECIMAL(10, 2),
    RoomID INT,
    PRIMARY KEY (ServiceID, RoomID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- Insert 10 records into Services table
INSERT INTO Services (ServiceID, ServiceType, Cost, RoomID) VALUES
(1, 'Room Cleaning', 500.00, 201),
(2, 'Laundry Service', 300.00, 202),
(3, 'Spa Treatment', 1500.00, 203),
(4, 'Free Breakfast', 0.00, 204),
(5, 'Airport Transfer', 2000.00, 205),
(6, 'Guided Tour', 1000.00, 206),
(7, 'Yoga Session', 800.00, 207),
(8, 'Dinner Package', 2500.00, 208),
(9, 'Conference Room Booking', 3000.00, 209),
(10, 'City Exploration', 1500.00, 210);


CREATE TABLE GuestServices (
    GuestID INT,
    ServiceID INT,
    RoomID INT,
    Date DATE,
    PRIMARY KEY (GuestID, ServiceID, RoomID),
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    FOREIGN KEY (ServiceID, RoomID) REFERENCES Services(ServiceID, RoomID)
);

-- Insert 10 records into GuestServices table
INSERT INTO GuestServices (GuestID, ServiceID, RoomID, Date) VALUES
(301, 1, 201, '2023-08-02'),
(302, 2, 202, '2023-08-11'),
(303, 3, 203, '2023-09-02'),
(304, 4, 204, '2023-09-16'),
(305, 5, 205, '2023-09-26'),
(306, 6, 206, '2023-10-02'),
(307, 7, 207, '2023-10-11'),
(308, 8, 208, '2023-10-21'),
(309, 9, 209, '2023-10-15'),
(310, 10, 210, '2023-10-28');

CREATE TABLE Reservation (
    ReservationID INT,
    GuestID INT,
    RoomID INT,
    ReservationDate DATE,
    CheckInDate DATE,
    CheckOutDate DATE,
    Status VARCHAR(20), -- e.g., 'Confirmed', 'Pending', 'Cancelled'
    TotalAmount DECIMAL(10, 2),
    PRIMARY KEY (ReservationID, GuestID),
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- Insert 10 records into Reservation table
INSERT INTO Reservation (ReservationID, GuestID, RoomID, ReservationDate, CheckInDate, CheckOutDate, Status, TotalAmount) VALUES
(1, 301, 201, '2023-09-01', '2023-09-05', '2023-09-10', 'Confirmed', 15000.00),CreateUserTable
(2, 302, 202, '2023-09-02', '2023-09-06', '2023-09-09', 'Confirmed', 9000.00),
(3, 303, 203, '2023-09-03', '2023-09-07', '2023-09-12', 'Confirmed', 18000.00),
(4, 304, 204, '2023-09-04', '2023-09-08', '2023-09-13', 'Cancelled', 0.00),
(5, 305, 205, '2023-09-05', '2023-09-09', '2023-09-14', 'Confirmed', 20000.00),
(6, 306, 206, '2023-09-06', '2023-09-10', '2023-09-15', 'Cancelled', 00.00),
(7, 307, 207, '2023-09-07', '2023-09-11', '2023-09-16', 'Confirmed', 18000.00),
(8, 308, 208, '2023-09-08', '2023-09-12', '2023-09-17', 'Cancelled', 00.00),
(9, 309, 209, '2023-09-09', '2023-09-13', '2023-09-18', 'Confirmed', 12500.00),
(10,310, 210, '2023-09-10', '2023-09-14', '2023-09-19', 'Confirmed', 23000.00);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    GuestID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50), -- e.g., 'Credit Card', 'Cash', 'Online Transfer'
    AmountPaid DECIMAL(10, 2),
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);

-- Insert 10 records into Payment table
INSERT INTO Payment (PaymentID, GuestID, PaymentDate, PaymentMethod, AmountPaid) VALUES
(1, 301, '2023-09-05', 'Credit Card', 15000.00),
(2, 302, '2023-09-06', 'Cash', 9000.00),
(3, 303, '2023-09-07', 'Online Transfer', 18000.00),
(4, 304, '2023-09-08', 'Credit Card', 0.00), -- Cancelled reservation, no payment
(5, 305, '2023-09-09', 'Cash', 20000.00),
(6, 306, '2023-09-10', 'Online Transfer', 10000.00),
(7, 307, '2023-09-11', 'Credit Card', 18000.00),
(8, 308, '2023-09-12', 'Cash', 21000.00),
(9, 309, '2023-09-13', 'Online Transfer', 12500.00),
(10, 310, '2023-09-14', 'Credit Card', 23000.00);




-- DCL Commands

CREATE USER 'manager' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT, UPDATE, DELETE ON Lodge TO 'manager';
 

CREATE USER 'receptionist' IDENTIFIED BY 'password123';
GRANT SELECT ON Lodge TO 'receptionist';

 
-- Employee Table
 
CREATE USER 'hr' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT, UPDATE, DELETE ON Employee TO 'hr';

CREATE USER 'supervisor' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT, UPDATE ON Employee TO 'supervisor';

GRANT SELECT, INSERT, UPDATE, DELETE ON Room TO 'manager';

CREATE USER 'cleaner' IDENTIFIED BY 'password123';
GRANT SELECT ON Room TO 'cleaner';

GRANT SELECT, INSERT, UPDATE, DELETE ON Guest TO 'manager';

CREATE USER 'receptionist' IDENTIFIED BY 'password123';
GRANT SELECT ON Guest TO 'receptionist';


-- 5.Reservation Table:
-- - Users: ` manager`, ` receptionist`
CREATE USER 'manager' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT, UPDATE, DELETE ON Reservation TO 'manager';

CREATE USER 'receptionist' IDENTIFIED BY 'password123';
GRANT SELECT ON Reservation TO 'receptionist';

-- 6.Payment Table:
-- - Users: ` manager`, ` accountant`

CREATE USER 'manager' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT, UPDATE, DELETE ON Payment TO 'manager';

CREATE USER 'accountant' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT ON Payment TO 'accountant';

-- 7.Services Table:
-- - Users: `manager`.

CREATE USER 'manager' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT, UPDATE, DELETE ON Services TO 'manager';

GRANT SELECT, INSERT, UPDATE, DELETE ON EmployeePhoneNumber TO 'manager';


create table users(
userid int primary key ,
name varchar(20),
perhrsalary int default 0,
workingHR int default 0,
totalsalary int default 0
);

select * from users;


insert into users(userid,name,perhrsalary,workinghr)
value(1,'gautam',5000,6);

DELIMITER //

create trigger before_insert_user
before insert 
on users for each row
begin
-- body
set new.totalsalary = new.perhrsalary * new.workinghr ;

end;//

delimiter ;

insert into users(userid,name,perhrsalary,workinghr)
value(2,'rohit',4000,15);


DELIMITER //

create trigger before_update_user
before update
on users for each row 
begin
set new.totalsalary= old.perhrsalary * new.workinghr;
end;//

delimiter ;

update users set workinghr=16 where userid=1;
select * from users;


delimiter //

create trigger befor_delete_user
before delete
on users for each row 

begin

set old.totalsalary= old.perhrsalary * old.workinghr ;

end;//
delimiter ;

use lodge;


-- Implicit Cursor Example
DELIMITER //

CREATE PROCEDURE implicit_cursor_example()
BEGIN
    DECLARE total_employees INT;

    -- Implicit cursor in a SELECT INTO statement
    SELECT COUNT(*) INTO total_employees FROM Employee;
    
    -- Output the result
    SELECT CONCAT('Total Employees: ', total_employees) AS Result;
END //

DELIMITER ;

CALL implicit_cursor_example();


DELIMITER //

CREATE PROCEDURE explicit_cursor_example()
BEGIN
    DECLARE empID INT;
    DECLARE empName VARCHAR(100);
    DECLARE done INT DEFAULT 0;

    -- Declare a cursor
    DECLARE emp_cursor CURSOR FOR 
    SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) 
    FROM Employee;

    -- Declare a handler for end of data
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN emp_cursor;

    -- Loop through the cursor
    read_loop: LOOP
        FETCH emp_cursor INTO empID, empName;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Output the employee data
        SELECT CONCAT('Employee ID: ', empID, ' Name: ', empName) AS EmployeeInfo;
    END LOOP;

    -- Close the cursor
    CLOSE emp_cursor;
END //

DELIMITER ;

CALL explicit_cursor_example();


DELIMITER //

CREATE PROCEDURE cursor_for_loop_examplee()
BEGIN
    DECLARE empID INT;
    DECLARE empName VARCHAR(100);
    DECLARE done INT DEFAULT 0;

    -- Declare the cursor
    DECLARE cur CURSOR FOR
    SELECT EmployeeID, CONCAT(FirstName, ' ', LastName)
    FROM Employee;

    -- Declare a handler for NOT FOUND condition (end of rows)
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN cur;

    -- Cursor FOR loop: Loop through the result set
    read_loop: LOOP
        FETCH cur INTO empID, empName;

        -- If done fetching all rows, leave the loop
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Output each employee data
        SELECT CONCAT('Employee ID: ', empID, ' Name: ', empName) AS EmployeeDetails;
    END LOOP;

    -- Close the cursor
    CLOSE cur;
END //

DELIMITER ;

CALL cursor_for_loop_examplee();

CREATE VIEW HighSalaryEmployees AS
SELECT EmployeeID, FirstName, LastName, Position, Salary
FROM Employee
WHERE Salary > 20000;


UPDATE HighSalaryEmployees
SET Salary = Salary + 5000
WHERE EmployeeID = 102;

select * from HighSalaryEmployees;

select * from employee;

CREATE VIEW TotalSpentPerGuest AS
SELECT GuestID, SUM(TotalAmount) AS TotalSpent
FROM Reservation
GROUP BY GuestID;


use watersystem;
select * from watersource;
select * from customer;
select * from employee;
select * from waterconnection;
select * from meterreading;
select * from billing;

desc meterreading;
desc waterconnection;




drop table MeterReading;
drop TABLE Billing;
drop TABLE WaterConnection;
drop TABLE Customer;

CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    ConnectionType VARCHAR(20)
);

CREATE TABLE WaterConnection (
    ConnectionID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ConnectionDate DATE,
    MeterNumber VARCHAR(50),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE MeterReading (
    MeterReadingID INT AUTO_INCREMENT PRIMARY KEY,
    ReadingDate DATE,
    UnitsConsumed INT,
    ConnectionID INT,
    FOREIGN KEY (ConnectionID) REFERENCES WaterConnection(ConnectionID)
);


CREATE TABLE Billing (
    BillID INT  AUTO_INCREMENT ,
    BillDate DATE,
    Amount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),
    CustomerID INT,
    ConnectionID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ConnectionID) REFERENCES WaterConnection(ConnectionID)
);

use watersystem;
SELECT * FROM Customer;
select * from waterconnection;

INSERT INTO Customer (Name, Address, Phone, Email, ConnectionType)
VALUES ('John Doe', '123 Main St', '1234567890', 'john@example.com', 'Residential');
INSERT INTO WaterConnection (CustomerID, ConnectionDate, MeterNumber, Status)
VALUES (2, '2024-10-20', 'MTR123', 'Active');  -- Assuming CustomerID = 1
INSERT INTO Billing (BillDate, Amount, PaymentStatus, CustomerID, ConnectionID)
VALUES ('2024-10-21', 1000.00, 'Pending', 2, 3);  -- Ensure these IDs exist
INSERT INTO MeterReading (ReadingDate, UnitsConsumed, ConnectionID)
VALUES ('2024-10-22', 150, 3);  -- Ensure ConnectionID = 1 exists




DELIMITER //

CREATE TRIGGER BeforeInsertCustomer
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    DECLARE phone_exists INT;

    SELECT COUNT(*) INTO phone_exists
    FROM Customer
    WHERE Phone = NEW.Phone;

    IF phone_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Phone number must be unique.';
    END IF;
END;
//

DELIMITER ;

CREATE TABLE BillingLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    BillID INT,
    OldAmount DECIMAL(10, 2),
    NewAmount DECIMAL(10, 2),
    UpdateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER AfterUpdateBilling
AFTER UPDATE ON Billing
FOR EACH ROW
BEGIN
    INSERT INTO BillingLog (BillID, OldAmount, NewAmount)
    VALUES (OLD.BillID, OLD.Amount, NEW.Amount);
END;
//

DELIMITER ;

DELIMITER $$

CREATE FUNCTION CalculateTotalBilledAmount(
    inputCustomerID INT,
    startDate DATE,
    endDate DATE
)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE totalAmount DECIMAL(10, 2);

    SELECT COALESCE(SUM(Amount), 0) INTO totalAmount
    FROM Billing
    WHERE CustomerID = inputCustomerID
      AND BillDate BETWEEN startDate AND endDate
      AND PaymentStatus = 'Paid';

    RETURN totalAmount;
END $$

DELIMITER ;
use watersystem;


DELIMITER //

CREATE FUNCTION GetCustomerDetails(p_CustomerID INT) 
RETURNS VARCHAR(400) 
DETERMINISTIC 
BEGIN
    DECLARE v_CustomerDetails VARCHAR(400);
    
    SELECT CONCAT('Name: ', Name, ', Address: ', Address, ', Phone: ', Phone) 
    INTO v_CustomerDetails
    FROM Customer
    WHERE CustomerID = p_CustomerID;

    RETURN IFNULL(v_CustomerDetails, 'Customer not found'); -- Return message if no customer found
END //

DELIMITER ;
  
  SELECT GetCustomerDetails(1);


DELIMITER //

CREATE PROCEDURE UpdateMeterReading(
    p_ConnectionID INT,
    p_UnitsConsumed INT,
    p_ReadingDate DATE
)
BEGIN
    INSERT INTO MeterReading (ReadingDate, UnitsConsumed, ConnectionID)
    VALUES (p_ReadingDate, p_UnitsConsumed, p_ConnectionID);
END //

DELIMITER ;

select * from waterconnection;


CALL UpdateMeterReading(7, 150, '2024-10-22');




DELIMITER //

CREATE PROCEDURE AddNewCustomer(
    p_Name VARCHAR(100),
    p_Address VARCHAR(200),
    p_Phone VARCHAR(20),
    p_Email VARCHAR(100),
    p_ConnectionType VARCHAR(20)
)
BEGIN
    INSERT INTO Customer (Name, Address, Phone, Email, ConnectionType)
    VALUES (p_Name, p_Address, p_Phone, p_Email, p_ConnectionType);
END //

DELIMITER ;

CALL AddNewCustomer('Rahul Patil', '123 ABC Street, Pune', '9876543210', 'rahul.patil@example.com', 'Residential');

-- **************  Cursor   *************

DELIMITER $$

CREATE PROCEDURE count_residential_customers()
BEGIN
    DECLARE customer_count INT;  -- Declare the variable

    -- Implicit cursor used here
    SELECT COUNT(*)
    INTO customer_count
    FROM Customer
    WHERE ConnectionType = 'Residential';
    
    SELECT CONCAT('Number of Residential Customers: ', customer_count) AS result;
END$$

DELIMITER ;
--    ******** call the viwe *****
CALL count_residential_customers();


DELIMITER $$

CREATE PROCEDURE fetch_customer_details()
BEGIN
    DECLARE done INT DEFAULT FALSE;  -- Declare a flag to exit the loop
    DECLARE customer_id INT;
    DECLARE customer_name VARCHAR(100);
    DECLARE customer_address VARCHAR(200);
    DECLARE customer_phone VARCHAR(20);
    DECLARE customer_email VARCHAR(100);
    
    -- Declare the cursor
    DECLARE customer_cursor CURSOR FOR
        SELECT CustomerID, Name, Address, Phone, Email
        FROM Customer;
    
    -- Declare a handler for when the cursor is finished
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN customer_cursor;  -- Open the cursor
    
    read_loop: LOOP
        FETCH customer_cursor INTO customer_id, customer_name, customer_address, customer_phone, customer_email;
        
        IF done THEN
            LEAVE read_loop;  -- Exit the loop when done
        END IF;
        
        -- Output the customer details
        SELECT CONCAT('CustomerID: ', customer_id, ', Name: ', customer_name, ', Address: ', customer_address, 
                      ', Phone: ', customer_phone, ', Email: ', customer_email) AS customer_details;
    END LOOP;
    
    CLOSE customer_cursor;  -- Close the cursor
END$$

DELIMITER ;

CALL fetch_customer_details();


-- Create a view for customers without showing the email
CREATE VIEW CustomerView AS
SELECT CustomerID, Name, Address, Phone, ConnectionType
FROM Customer;

-- Query to select data from the view
SELECT * FROM CustomerView;


-- Create a view that joins the Customer and WaterConnection tables
CREATE VIEW CustomerConnectionView AS
SELECT C.CustomerID, C.Name, C.Address, WC.ConnectionID, WC.ConnectionDate, WC.MeterNumber, WC.Status
FROM Customer C
JOIN WaterConnection WC ON C.CustomerID = WC.CustomerID;

-- Query to select data from the view
SELECT * FROM CustomerConnectionView;

-- Update customer address using the view
UPDATE CustomerView
SET Address = 'New Address, City'
WHERE CustomerID = 1;

-- Verify the update on the base table
SELECT * FROM Customer WHERE CustomerID = 1;

-- Try updating the view created from multiple tables
UPDATE CustomerConnectionView
SET MeterNumber = 'NEW12345'
WHERE CustomerID = 2;


-- This will throw an error because the view is non-updatable.

-- Create a restricted view (non-updatable) using WITH CHECK OPTION
CREATE VIEW RestrictedCustomerView AS
SELECT CustomerID, Name, Address
FROM Customer
WITH CHECK OPTION;

-- Now, updates are restricted
-- The following update will fail:
UPDATE RestrictedCustomerView
SET Address = 'Another Address'
WHERE CustomerID = 1;

-- Check the Customer table
SELECT * FROM billing;

-- Check the WaterConnection table
SELECT * FROM WaterConnection;

-- Check the CustomerView
SELECT * FROM CustomerView;

-- Check the CustomerConnectionView
SELECT * FROM CustomerConnectionView;


-- ********* nested quiree*********
SELECT Name FROM Customer
WHERE CustomerID IN (
    SELECT CustomerID FROM Billing
    WHERE Amount > 2000
);

select * from billing;



DELIMITER $$

CREATE TRIGGER after_meter_reading_insert
AFTER INSERT ON MeterReading
FOR EACH ROW
BEGIN
    -- Check if UnitsConsumed is greater than 1000
    IF NEW.UnitsConsumed > 1000 AND NEW.UnitsConsumed <= 1500 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Warning: You have consumed more than 1000 units of water.';

    -- Check if UnitsConsumed is greater than 1500 but less than or equal to 2000
    ELSEIF NEW.UnitsConsumed > 1500 AND NEW.UnitsConsumed <= 2000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Warning: You have consumed more than 1500 units. If your consumption exceeds 2000 units, the water supply will be stopped.';

    -- Check if UnitsConsumed is greater than 2000
    ELSEIF NEW.UnitsConsumed > 2000 THEN
        -- Simulate stopping the water supply
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Water supply stopped: Your consumption has exceeded 2000 units.';

    END IF;
END$$

DELIMITER ;
use watersystem;

DELIMITER $$

CREATE TRIGGER before_water_connection_insert
BEFORE INSERT ON WaterConnection
FOR EACH ROW
BEGIN
    -- Check the number of existing connections for the customer
    DECLARE connection_count INT;

    -- Count how many connections the customer already has
    SELECT COUNT(*)
    INTO connection_count
    FROM WaterConnection
    WHERE CustomerID = NEW.CustomerID;

    -- If the customer already has 2 or more connections, raise an error
    IF connection_count >= 2 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer is not eligible for a 3rd water connection.';
    END IF;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER before_billing_insert
BEFORE INSERT ON Billing
FOR EACH ROW
BEGIN
    -- Check if the BillDate is more than 2 months ago
    IF NEW.BillDate < DATE_SUB(CURDATE(), INTERVAL 2 MONTH) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Warning: If the bill is not paid, your water connection may be cut off.';

    -- Check if the BillDate is more than 3 months ago
    ELSEIF NEW.BillDate < DATE_SUB(CURDATE(), INTERVAL 3 MONTH) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Water connection will be cut off due to non-payment.';
    END IF;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER before_billing_update
BEFORE UPDATE ON Billing
FOR EACH ROW
BEGIN
    -- Check if the BillDate is more than 2 months ago
    IF NEW.BillDate < DATE_SUB(CURDATE(), INTERVAL 2 MONTH) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Warning: If the bill is not paid, your water connection may be cut off.';

    -- Check if the BillDate is more than 3 months ago
    ELSEIF NEW.BillDate < DATE_SUB(CURDATE(), INTERVAL 3 MONTH) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Water connection will be cut off due to non-payment.';
    END IF;
END$$

DELIMITER ;

use watersystem;
select * from meterreading;
DROP TRIGGER IF EXISTS after_meter_reading_insert;


DELIMITER $$

CREATE TRIGGER after_meter_reading_insert
AFTER INSERT ON MeterReading
FOR EACH ROW
BEGIN

    
    -- Block if UnitsConsumed is greater than 2000
		IF NEW.UnitsConsumed > 2000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Water supply stopped: Your consumption has exceeded 2000 units.';
    
    END IF;
END$$

DELIMITER ;

select * from meterreading;
select * from waterconnection;
select * from customer;
delete from meterreading where connection_id=3;
DELETE FROM MeterReading
WHERE connectionid = 3;

INSERT INTO MeterReading (ReadingDate, UnitsConsumed, ConnectionID) 
VALUES ('2024-10-23', 1700, 5);

use watersystem;

CREATE TABLE DeletedWaterConnection (
    ConnectionID INT,
    CustomerID INT,
    ConnectionDate DATE,
    MeterNumber VARCHAR(50),
    Status VARCHAR(50)
);


DELIMITER //

CREATE TRIGGER after_water_connection_delete
AFTER DELETE ON WaterConnection
FOR EACH ROW
BEGIN
    INSERT INTO DeletedWaterConnection (ConnectionID, CustomerID, ConnectionDate, MeterNumber, Status)
    VALUES (OLD.ConnectionID, OLD.CustomerID, OLD.ConnectionDate, OLD.MeterNumber, OLD.Status);
END//

DELIMITER ;

delete from waterconnection where customerid=2;

DELETE FROM billing WHERE ConnectionID = 2;
DELETE FROM waterconnection WHERE ConnectionID = 2;
ALTER TABLE billing DROP FOREIGN KEY billing_ibfk_2;

ALTER TABLE billing
ADD CONSTRAINT billing_ibfk_2 FOREIGN KEY (ConnectionID)
REFERENCES waterconnection(ConnectionID) ON DELETE CASCADE;

DELIMITER $$

CREATE TRIGGER check_payment_conditions
AFTER INSERT ON Billing
FOR EACH ROW
BEGIN
    DECLARE bill_age INT;

    -- Calculate the age of the bill in months
    SET bill_age = TIMESTAMPDIFF(MONTH, NEW.BillDate, CURDATE());

    -- Check if the BillDate is more than two months old and show a warning
    IF bill_age > 2 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Warning: Bill is over two months old. Connection may be cut off soon.';
    END IF;

    -- Check if the BillDate is more than three months old
    IF bill_age > 3 THEN
        -- Disconnect the water connection by updating the WaterConnection status
        UPDATE WaterConnection
        SET Status = 'Disconnected'
        WHERE ConnectionID = NEW.ConnectionID;

        -- Show a message about cutting off the water connection
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Bill is over three months old. Water connection has been cut off.';
    END IF;

END $$

DELIMITER ;
INSERT INTO Billing (BillID, BillDate, Amount, PaymentStatus, CustomerID, ConnectionID)
VALUES (1, '2024-07-01', 500.00, 'Pending', 11, 22);

INSERT INTO Billing (BillID, BillDate, Amount, PaymentStatus, CustomerID, ConnectionID)
VALUES (2, '2024-01-01', 1000.00, 'Pending', 11, 22);


DELIMITER //

CREATE TRIGGER before_insert_billing
BEFORE INSERT ON Billing
FOR EACH ROW
BEGIN
    DECLARE error_message VARCHAR(255);
    DECLARE cutoff_date DATE;

    -- Calculate the cutoff date (3 months prior to today)
    SET cutoff_date = DATE_SUB(CURDATE(), INTERVAL 3 MONTH);

    -- Check if BillDate exceeds 3 months
    IF NEW.BillDate < cutoff_date THEN
        -- Remove or mark the related water connection as inactive
        UPDATE WaterConnection
        SET Status = 'Disconnected'
        WHERE CustomerID = NEW.CustomerID;

        -- Set an error message and signal the failure
        SET error_message = 'Error: Bill is over three months old. Water connection will be cut off.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;
END //

DELIMITER ;

CREATE TABLE EmployeeBackup (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Phone VARCHAR(20),
    AssignedArea VARCHAR(100),
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER before_employee_delete
BEFORE DELETE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO EmployeeBackup (EmployeeID, Name, Role, Phone, AssignedArea, DeletedAt)
    VALUES (OLD.EmployeeID, OLD.Name, OLD.Role, OLD.Phone, OLD.AssignedArea, NOW());
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_customer_insert
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    IF NEW.Email NOT LIKE '%_@__%.__%' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;
END;

//

DELIMITER ;


DELIMITER //

CREATE TRIGGER before_customer_phone_insert_or_update
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    IF NEW.Phone NOT REGEXP '^[0-9]{10}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid phone number format';
    END IF;
END; //

DELIMITER ;

CREATE TABLE CustomerBackup (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    ConnectionType ENUM('Residential', 'Commercial') NOT NULL,
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //
CREATE TRIGGER backup_customer_before_delete
BEFORE DELETE ON Customer
FOR EACH ROW
BEGIN
    INSERT INTO CustomerBackup (CustomerID, Name, Address, Phone, Email, ConnectionType)
    VALUES (OLD.CustomerID, OLD.Name, OLD.Address, OLD.Phone, OLD.Email, OLD.ConnectionType);
END; //

DELIMITER ;


DELIMITER //
CREATE TRIGGER update_payment_status
AFTER INSERT ON Billing
FOR EACH ROW
BEGIN
    DECLARE days_due INT;
    
    SET days_due = DATEDIFF(CURDATE(), NEW.BillDate);
    
    IF days_due > 30 AND NEW.PaymentStatus = 'Pending' THEN
        UPDATE Billing
        SET PaymentStatus = 'Overdue'
        WHERE BillID = NEW.BillID;
    END IF;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER add_late_fee
BEFORE UPDATE ON Billing
FOR EACH ROW
BEGIN
    DECLARE days_due INT;
    
    SET days_due = DATEDIFF(CURDATE(), NEW.BillDate);
    
    IF days_due > 60 AND OLD.PaymentStatus = 'Pending' AND NEW.PaymentStatus = 'Pending' THEN
        SET NEW.Amount = OLD.Amount * 1.05; -- Adds a 5% late fee
    END IF;
END; //
DELIMITER ;

CREATE TABLE BillingBackup (
    BackupID INT PRIMARY KEY AUTO_INCREMENT,
    BillID INT,
    BillDate DATE,
    Amount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),
    CustomerID INT,
    ConnectionID INT,
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ConnectionID) REFERENCES WaterConnection(ConnectionID)
);

DELIMITER //

CREATE TRIGGER before_billing_delete
BEFORE DELETE ON Billing
FOR EACH ROW
BEGIN
    INSERT INTO BillingBackup (BillID, BillDate, Amount, PaymentStatus, CustomerID, ConnectionID)
    VALUES (OLD.BillID, OLD.BillDate, OLD.Amount, OLD.PaymentStatus, OLD.CustomerID, OLD.ConnectionID);
END //

DELIMITER ;

CREATE TABLE EmployeeBackup (
    BackupID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Phone VARCHAR(20),
    AssignedArea VARCHAR(100),
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //

CREATE TRIGGER before_employee_delete
BEFORE DELETE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO EmployeeBackup (EmployeeID, Name, Role, Phone, AssignedArea)
    VALUES (OLD.EmployeeID, OLD.Name, OLD.Role, OLD.Phone, OLD.AssignedArea);
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER capacity_check_before_insert
BEFORE INSERT ON WaterSource
FOR EACH ROW
BEGIN
    DECLARE max_capacity DECIMAL(10,2) DEFAULT 25000.00; -- Example maximum capacity
    DECLARE min_capacity DECIMAL(10,2) DEFAULT 100.00;    -- Example minimum capacity
    
    -- Check if the capacity is within a valid range
    IF NEW.Capacity > max_capacity THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Capacity exceeds the maximum allowable limit!';
    ELSEIF NEW.Capacity < min_capacity THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Capacity is below the minimum required limit!';
    END IF;
END;
//

DELIMITER ;

CREATE TABLE WaterSourceAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    SourceID INT,
    OldSourceType VARCHAR(50),
    NewSourceType VARCHAR(50),
    ChangedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ChangedBy VARCHAR(100)
);


DELIMITER //

CREATE TRIGGER log_sourcetype_change
BEFORE UPDATE ON WaterSource
FOR EACH ROW
BEGIN
    -- Check if SourceType is being updated
    IF OLD.SourceType <> NEW.SourceType THEN
        INSERT INTO WaterSourceAudit (SourceID, OldSourceType, NewSourceType, ChangedBy)
        VALUES (OLD.SourceID, OLD.SourceType, NEW.SourceType, USER());
    END IF;
END;
//

DELIMITER ;

CREATE TABLE WaterSourceAlerts (
    AlertID INT AUTO_INCREMENT PRIMARY KEY,
    SourceID INT,
    Capacity DECIMAL(10,2),
    AlertMessage VARCHAR(255),
    AlertDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER check_low_capacity
BEFORE UPDATE ON WaterSource
FOR EACH ROW
BEGIN
    -- Define the capacity threshold
    DECLARE capacity_threshold DECIMAL(10, 2);
    SET capacity_threshold = 500.00;

    -- Check if Capacity is being updated and falls below the threshold
    IF NEW.Capacity < capacity_threshold AND OLD.Capacity >= capacity_threshold THEN
        INSERT INTO WaterSourceAlerts (SourceID, Capacity, AlertMessage)
        VALUES (NEW.SourceID, NEW.Capacity, CONCAT('Warning: Low capacity detected for SourceID ', NEW.SourceID));
    END IF;
END;
//

DELIMITER ;


create database biometricattendancesystem;
use biometricattendancesystem;

-- Create users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    department VARCHAR(50),
    role ENUM('employee', 'manager') NOT NULL,
    biometric_data BLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create AttendanceRecords table
CREATE TABLE AttendanceRecords (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    timestamp TIMESTAMP NOT NULL,
    status ENUM('present', 'absent', 'late', 'leave') NOT NULL,
    device_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
    -- If there is a Devices table, you would add the foreign key constraint for device_id like this:
    -- FOREIGN KEY (device_id) REFERENCES Devices(device_id)
);

-- Create Devices table
CREATE TABLE Devices (
    device_id INT AUTO_INCREMENT PRIMARY KEY,
    device_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    ip_address VARCHAR(45) NOT NULL,
    status ENUM('active', 'inactive') NOT NULL,
    last_maintenance_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Departments table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Roles table
CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Users
INSERT INTO Users (first_name, last_name, email, phone_number, department, role, biometric_data, created_at, updated_at) VALUES
('John', 'Doe', 'john.doe1@example.com', '1234567890', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Jane', 'Smith', 'jane.smith2@example.com', '0987654321', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Alice', 'Johnson', 'alice.johnson3@example.com', '5555555555', 'HR', 'employee', NULL, NOW(), NOW()),
('Bob', 'Brown', 'bob.brown4@example.com', '4444444444', 'Finance', 'manager', NULL, NOW(), NOW()),
('Charlie', 'Davis', 'charlie.davis5@example.com', '3333333333', 'Engineering', 'employee', NULL, NOW(), NOW()),
('David', 'Clark', 'david.clark6@example.com', '1231231231', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Emily', 'Moore', 'emily.moore7@example.com', '3213213213', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Frank', 'Miller', 'frank.miller8@example.com', '4564564564', 'HR', 'manager', NULL, NOW(), NOW()),
('Grace', 'Lee', 'grace.lee9@example.com', '7897897897', 'Finance', 'employee', NULL, NOW(), NOW()),
('Hannah', 'Wilson', 'hannah.wilson10@example.com', '1010101010', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Isaac', 'Martinez', 'isaac.martinez11@example.com', '1111111111', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Jack', 'Anderson', 'jack.anderson12@example.com', '2222222222', 'HR', 'manager', NULL, NOW(), NOW()),
('Katie', 'Thomas', 'katie.thomas13@example.com', '3333333333', 'Finance', 'employee', NULL, NOW(), NOW()),
('Liam', 'Taylor', 'liam.taylor14@example.com', '4444444444', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Mia', 'Lewis', 'mia.lewis15@example.com', '5555555555', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Noah', 'Walker', 'noah.walker16@example.com', '6666666666', 'HR', 'employee', NULL, NOW(), NOW()),
('Olivia', 'Hall', 'olivia.hall17@example.com', '7777777777', 'Finance', 'employee', NULL, NOW(), NOW()),
('Paul', 'Allen', 'paul.allen18@example.com', '8888888888', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Quincy', 'Young', 'quincy.young19@example.com', '9999999999', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Rachel', 'Hernandez', 'rachel.hernandez20@example.com', '1212121212', 'HR', 'manager', NULL, NOW(), NOW()),
('Sam', 'King', 'sam.king21@example.com', '2323232323', 'Finance', 'employee', NULL, NOW(), NOW()),
('Tina', 'Wright', 'tina.wright22@example.com', '3434343434', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Uma', 'Lopez', 'uma.lopez23@example.com', '4545454545', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Victor', 'Scott', 'victor.scott24@example.com', '5656565656', 'HR', 'employee', NULL, NOW(), NOW()),
('Wendy', 'Green', 'wendy.green25@example.com', '6767676767', 'Finance', 'employee', NULL, NOW(), NOW()),
('Xander', 'Adams', 'xander.adams26@example.com', '7878787878', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Yara', 'Baker', 'yara.baker27@example.com', '8989898989', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Zane', 'Nelson', 'zane.nelson28@example.com', '9090909090', 'HR', 'manager', NULL, NOW(), NOW()),
('Abby', 'Carter', 'abby.carter29@example.com', '1010101011', 'Finance', 'employee', NULL, NOW(), NOW()),
('Ben', 'Mitchell', 'ben.mitchell30@example.com', '1212121213', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Cara', 'Perez', 'cara.perez31@example.com', '1313131314', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Dan', 'Roberts', 'dan.roberts32@example.com', '1414141415', 'HR', 'employee', NULL, NOW(), NOW()),
('Ella', 'Turner', 'ella.turner33@example.com', '1515151516', 'Finance', 'employee', NULL, NOW(), NOW()),
('Finn', 'Phillips', 'finn.phillips34@example.com', '1616161617', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Gina', 'Campbell', 'gina.campbell35@example.com', '1717171718', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Henry', 'Parker', 'henry.parker36@example.com', '1818181819', 'HR', 'manager', NULL, NOW(), NOW()),
('Isla', 'Evans', 'isla.evans37@example.com', '1919191920', 'Finance', 'employee', NULL, NOW(), NOW()),
('Jake', 'Edwards', 'jake.edwards38@example.com', '2020202021', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Kara', 'Collins', 'kara.collins39@example.com', '2121212122', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Luke', 'Stewart', 'luke.stewart40@example.com', '2222222223', 'HR', 'employee', NULL, NOW(), NOW()),
('Mia', 'Sanchez', 'mia.sanchez41@example.com', '2323232324', 'Finance', 'employee', NULL, NOW(), NOW()),
('Nina', 'Morris', 'nina.morris42@example.com', '2424242425', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Omar', 'Rogers', 'omar.rogers43@example.com', '2525252526', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Pia', 'Reed', 'pia.reed44@example.com', '2626262627', 'HR', 'manager', NULL, NOW(), NOW()),
('Quinn', 'Cook', 'quinn.cook45@example.com', '2727272728', 'Finance', 'employee', NULL, NOW(), NOW()),
('Rose', 'Morgan', 'rose.morgan46@example.com', '2828282829', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Sam', 'Bell', 'sam.bell47@example.com', '2929292930', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Tina', 'Murphy', 'tina.murphy48@example.com', '3030303031', 'HR', 'employee', NULL, NOW(), NOW()),
('Umar', 'Bailey', 'umar.bailey49@example.com', '3131313132', 'Finance', 'employee', NULL, NOW(), NOW()),
('Vera', 'Rivera', 'vera.rivera50@example.com', '3232323233', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Will', 'Cooper', 'will.cooper51@example.com', '3333333334', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Xena', 'Richardson', 'xena.richardson52@example.com', '3434343435', 'HR', 'manager', NULL, NOW(), NOW()),
('Yasmin', 'Cox', 'yasmin.cox53@example.com', '3535353536', 'Finance', 'employee', NULL, NOW(), NOW()),
('Zack', 'Howard', 'zack.howard54@example.com', '3636363637', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Ava', 'Ward', 'ava.ward55@example.com', '3737373738', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Blake', 'Brooks', 'blake.brooks56@example.com', '3838383839', 'HR', 'employee', NULL, NOW(), NOW()),
('Cleo', 'Gray', 'cleo.gray57@example.com', '3939393940', 'Finance', 'employee', NULL, NOW(), NOW()),
('Drew', 'James', 'drew.james58@example.com', '4040404041', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Ella', 'Watson', 'ella.watson59@example.com', '4141414142', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Finn', 'Russell', 'finn.russell60@example.com', '4242424243', 'HR', 'manager', NULL, NOW(), NOW()),
('Gail', 'Harrison', 'gail.harrison61@example.com', '4343434344', 'Finance', 'employee', NULL, NOW(), NOW()),
('Hank', 'Graham', 'hank.graham62@example.com', '4444444445', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Ivy', 'Woods', 'ivy.woods63@example.com', '4545454546', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Jack', 'West', 'jack.west64@example.com', '4646464647', 'HR', 'employee', NULL, NOW(), NOW()),
('Kara', 'Murray', 'kara.murray65@example.com', '4747474748', 'Finance', 'employee', NULL, NOW(), NOW()),
('Liam', 'Freeman', 'liam.freeman66@example.com', '4848484849', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Maya', 'Wells', 'maya.wells67@example.com', '4949494950', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Nina', 'Shaw', 'nina.shaw68@example.com', '5050505051', 'HR', 'manager', NULL, NOW(), NOW()),
('Oscar', 'Griffin', 'oscar.griffin69@example.com', '5151515152', 'Finance', 'employee', NULL, NOW(), NOW()),
('Paul', 'Fisher', 'paul.fisher70@example.com', '5252525253', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Quinn', 'Ellis', 'quinn.ellis71@example.com', '5353535354', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Rose', 'Palmer', 'rose.palmer72@example.com', '5454545455', 'HR', 'employee', NULL, NOW(), NOW()),
('Sam', 'Gomez', 'sam.gomez73@example.com', '5555555556', 'Finance', 'employee', NULL, NOW(), NOW()),
('Tara', 'Henderson', 'tara.henderson74@example.com', '5656565657', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Uma', 'Gibson', 'uma.gibson75@example.com', '5757575758', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Vince', 'Fox', 'vince.fox76@example.com', '5858585859', 'HR', 'manager', NULL, NOW(), NOW()),
('Wade', 'Marshall', 'wade.marshall77@example.com', '5959595960', 'Finance', 'employee', NULL, NOW(), NOW()),
('Xena', 'Peterson', 'xena.peterson78@example.com', '6060606061', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Yara', 'Knight', 'yara.knight79@example.com', '6161616162', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Zack', 'Hunt', 'zack.hunt80@example.com', '6262626263', 'HR', 'employee', NULL, NOW(), NOW()),
('Ava', 'Rose', 'ava.rose81@example.com', '6363636364', 'Finance', 'employee', NULL, NOW(), NOW()),
('Blake', 'Stone', 'blake.stone82@example.com', '6464646465', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Cara', 'Bradley', 'cara.bradley83@example.com', '6565656566', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Dan', 'Hudson', 'dan.hudson84@example.com', '6666666667', 'HR', 'manager', NULL, NOW(), NOW()),
('Ella', 'Webb', 'ella.webb85@example.com', '6767676768', 'Finance', 'employee', NULL, NOW(), NOW()),
('Finn', 'Simpson', 'finn.simpson86@example.com', '6868686869', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Gina', 'Hunter', 'gina.hunter87@example.com', '6969696970', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Henry', 'Warren', 'henry.warren88@example.com', '7070707071', 'HR', 'employee', NULL, NOW(), NOW()),
('Isla', 'Dixon', 'isla.dixon89@example.com', '7171717172', 'Finance', 'employee', NULL, NOW(), NOW()),
('Jake', 'Cunningham', 'jake.cunningham90@example.com', '7272727273', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Kara', 'Arnold', 'kara.arnold91@example.com', '7373737374', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Liam', 'Duncan', 'liam.duncan92@example.com', '7474747475', 'HR', 'manager', NULL, NOW(), NOW()),
('Mia', 'Davidson', 'mia.davidson93@example.com', '7575757576', 'Finance', 'employee', NULL, NOW(), NOW()),
('Noah', 'Hamilton', 'noah.hamilton94@example.com', '7676767677', 'Engineering', 'employee', NULL, NOW(), NOW()),
('Olivia', 'Gordon', 'olivia.gordon95@example.com', '7777777778', 'Marketing', 'manager', NULL, NOW(), NOW()),
('Paul', 'Berry', 'paul.berry96@example.com', '7878787879', 'HR', 'employee', NULL, NOW(), NOW()),
('Quinn', 'Frazier', 'quinn.frazier97@example.com', '7979797980', 'Finance', 'employee', NULL, NOW(), NOW()),
('Rose', 'Henry', 'rose.henry98@example.com', '8080808081', 'Engineering', 'manager', NULL, NOW(), NOW()),
('Sam', 'Larson', 'sam.larson99@example.com', '8181818182', 'Marketing', 'employee', NULL, NOW(), NOW()),
('Tina', 'Myers', 'tina.myers100@example.com', '8282828283', 'HR', 'manager', NULL, NOW(), NOW());

select * from Users;
select count(*) from Users;

-- AttendanceRecords
INSERT INTO AttendanceRecords (user_id, timestamp, status, device_id, created_at, updated_at) VALUES
(1, '2024-06-01 08:00:00', 'present', 1, NOW(), NOW()),
(2, '2024-06-01 08:05:00', 'present', 1, NOW(), NOW()),
(3, '2024-06-01 08:10:00', 'present', 1, NOW(), NOW()),
(4, '2024-06-01 08:15:00', 'present', 1, NOW(), NOW()),
(5, '2024-06-01 08:20:00', 'present', 1, NOW(), NOW()),
(6, '2024-06-01 08:25:00', 'present', 1, NOW(), NOW()),
(7, '2024-06-01 08:30:00', 'present', 1, NOW(), NOW()),
(8, '2024-06-01 08:35:00', 'present', 1, NOW(), NOW()),
(9, '2024-06-01 08:40:00', 'present', 1, NOW(), NOW()),
(10, '2024-06-01 08:45:00', 'present', 1, NOW(), NOW()),
(11, '2024-06-01 08:50:00', 'present', 1, NOW(), NOW()),
(12, '2024-06-01 08:55:00', 'present', 1, NOW(), NOW()),
(13, '2024-06-01 09:00:00', 'present', 1, NOW(), NOW()),
(14, '2024-06-01 09:05:00', 'present', 1, NOW(), NOW()),
(15, '2024-06-01 09:10:00', 'present', 1, NOW(), NOW()),
(16, '2024-06-01 09:15:00', 'present', 1, NOW(), NOW()),
(17, '2024-06-01 09:20:00', 'present', 1, NOW(), NOW()),
(18, '2024-06-01 09:25:00', 'present', 1, NOW(), NOW()),
(19, '2024-06-01 09:30:00', 'present', 1, NOW(), NOW()),
(20, '2024-06-01 09:35:00', 'present', 1, NOW(), NOW()),
(21, '2024-06-01 09:40:00', 'present', 1, NOW(), NOW()),
(22, '2024-06-01 09:45:00', 'present', 1, NOW(), NOW()),
(23, '2024-06-01 09:50:00', 'present', 1, NOW(), NOW()),
(24, '2024-06-01 09:55:00', 'present', 1, NOW(), NOW()),
(25, '2024-06-01 10:00:00', 'present', 1, NOW(), NOW()),
(26, '2024-06-01 10:05:00', 'present', 1, NOW(), NOW()),
(27, '2024-06-01 10:10:00', 'present', 1, NOW(), NOW()),
(28, '2024-06-01 10:15:00', 'present', 1, NOW(), NOW()),
(99, '2024-06-01 10:20:00', 'present', 1, NOW(), NOW()),
(30, '2024-06-01 10:25:00', 'present', 1, NOW(), NOW()),
(31, '2024-06-01 08:50:00', 'present', 1, NOW(), NOW()),
(32, '2024-06-01 08:55:00', 'present', 1, NOW(), NOW()),
(33, '2024-06-01 09:00:00', 'present', 1, NOW(), NOW()),
(34, '2024-06-01 09:05:00', 'present', 1, NOW(), NOW()),
(35, '2024-06-01 09:10:00', 'present', 1, NOW(), NOW()),
(36, '2024-06-01 09:15:00', 'present', 1, NOW(), NOW()),
(37, '2024-06-01 09:20:00', 'present', 1, NOW(), NOW()),
(38, '2024-06-01 09:25:00', 'present', 1, NOW(), NOW()),
(39, '2024-06-01 09:30:00', 'present', 1, NOW(), NOW()),
(40, '2024-06-01 09:35:00', 'present', 1, NOW(), NOW()),
(41, '2024-06-01 08:50:00', 'present', 1, NOW(), NOW()),
(42, '2024-06-01 08:55:00', 'present', 1, NOW(), NOW()),
(43, '2024-06-01 09:00:00', 'present', 1, NOW(), NOW()),
(44, '2024-06-01 09:05:00', 'present', 1, NOW(), NOW()),
(45, '2024-06-01 09:10:00', 'present', 1, NOW(), NOW()),
(46, '2024-06-01 09:15:00', 'present', 1, NOW(), NOW()),
(47, '2024-06-01 09:20:00', 'present', 1, NOW(), NOW()),
(48, '2024-06-01 09:25:00', 'present', 1, NOW(), NOW()),
(49, '2024-06-01 09:30:00', 'present', 1, NOW(), NOW()),
(50, '2024-06-01 09:35:00', 'present', 1, NOW(), NOW()),
(51, '2024-06-01 08:50:00', 'present', 1, NOW(), NOW()),
(52, '2024-06-01 08:55:00', 'present', 1, NOW(), NOW()),
(53, '2024-06-01 09:00:00', 'present', 1, NOW(), NOW()),
(54, '2024-06-01 09:05:00', 'present', 1, NOW(), NOW()),
(55, '2024-06-01 09:10:00', 'present', 1, NOW(), NOW()),
(56, '2024-06-01 09:15:00', 'present', 1, NOW(), NOW()),
(57, '2024-06-01 09:20:00', 'present', 1, NOW(), NOW()),
(58, '2024-06-01 09:25:00', 'present', 1, NOW(), NOW()),
(59, '2024-06-01 09:30:00', 'present', 1, NOW(), NOW()),
(60, '2024-06-01 09:35:00', 'present', 1, NOW(), NOW()),
(61, '2024-06-01 08:50:00', 'present', 1, NOW(), NOW()),
(62, '2024-06-01 08:55:00', 'present', 1, NOW(), NOW()),
(63, '2024-06-01 09:00:00', 'present', 1, NOW(), NOW()),
(64, '2024-06-01 09:05:00', 'present', 1, NOW(), NOW()),
(65, '2024-06-01 09:10:00', 'present', 1, NOW(), NOW()),
(66, '2024-06-01 09:15:00', 'present', 1, NOW(), NOW()),
(67, '2024-06-01 09:20:00', 'present', 1, NOW(), NOW()),
(68, '2024-06-01 09:25:00', 'present', 1, NOW(), NOW()),
(69, '2024-06-01 09:30:00', 'present', 1, NOW(), NOW()),
(70, '2024-06-01 09:35:00', 'present', 1, NOW(), NOW()),
(71, '2024-06-01 08:00:00', 'present', 1, NOW(), NOW()),
(72, '2024-06-01 08:05:00', 'present', 1, NOW(), NOW()),
(73, '2024-06-01 08:10:00', 'present', 1, NOW(), NOW()),
(74, '2024-06-01 08:15:00', 'present', 1, NOW(), NOW()),
(75, '2024-06-01 08:20:00', 'present', 1, NOW(), NOW()),
(76, '2024-06-01 08:25:00', 'present', 1, NOW(), NOW()),
(77, '2024-06-01 08:30:00', 'present', 1, NOW(), NOW()),
(78, '2024-06-01 08:35:00', 'present', 1, NOW(), NOW()),
(79, '2024-06-01 08:40:00', 'present', 1, NOW(), NOW()),
(80, '2024-06-01 08:45:00', 'present', 1, NOW(), NOW()),
(81, '2024-06-01 08:50:00', 'present', 1, NOW(), NOW()),
(82, '2024-06-01 08:55:00', 'present', 1, NOW(), NOW()),
(83, '2024-06-01 09:00:00', 'present', 1, NOW(), NOW()),
(84, '2024-06-01 09:05:00', 'present', 1, NOW(), NOW()),
(85, '2024-06-01 09:10:00', 'present', 1, NOW(), NOW()),
(86, '2024-06-01 09:15:00', 'present', 1, NOW(), NOW()),
(87, '2024-06-01 09:20:00', 'present', 1, NOW(), NOW()),
(88, '2024-06-01 09:25:00', 'present', 1, NOW(), NOW()),
(89, '2024-06-01 09:30:00', 'present', 1, NOW(), NOW()),
(90, '2024-06-01 09:35:00', 'present', 1, NOW(), NOW()),
(91, '2024-06-01 09:40:00', 'present', 1, NOW(), NOW()),
(92, '2024-06-01 09:45:00', 'present', 1, NOW(), NOW()),
(93, '2024-06-01 09:50:00', 'present', 1, NOW(), NOW()),
(94, '2024-06-01 09:55:00', 'present', 1, NOW(), NOW()),
(95, '2024-06-01 10:00:00', 'present', 1, NOW(), NOW()),
(96, '2024-06-01 10:05:00', 'present', 1, NOW(), NOW()),
(97, '2024-06-01 10:10:00', 'present', 1, NOW(), NOW()),
(98, '2024-06-01 10:15:00', 'present', 1, NOW(), NOW()),
(99, '2024-06-01 10:20:00', 'present', 1, NOW(), NOW()),
(100, '2024-06-01 10:25:00', 'present', 1, NOW(), NOW());

select * from AttendanceRecords;
select count(*) from AttendanceRecords;

-- Devices
INSERT INTO Devices (device_name, location, ip_address, status, last_maintenance_date, created_at, updated_at) VALUES
('Device 1', 'Location 1', '192.168.1.1', 'active', '2024-05-30', NOW(), NOW()),
('Device 2', 'Location 2', '192.168.1.2', 'active', '2024-05-30', NOW(), NOW()),
('Device 3', 'Location 3', '192.168.1.3', 'active', '2024-05-30', NOW(), NOW()),
('Device 4', 'Location 4', '192.168.1.4', 'active', '2024-05-30', NOW(), NOW()),
('Device 5', 'Location 5', '192.168.1.5', 'active', '2024-05-30', NOW(), NOW()),
('Device 6', 'Location 6', '192.168.1.6', 'active', '2024-05-30', NOW(), NOW()),
('Device 7', 'Location 7', '192.168.1.7', 'active', '2024-05-30', NOW(), NOW()),
('Device 8', 'Location 8', '192.168.1.8', 'active', '2024-05-30', NOW(), NOW()),
('Device 9', 'Location 9', '192.168.1.9', 'active', '2024-05-30', NOW(), NOW()),
('Device 10', 'Location 10', '192.168.1.10', 'active', '2024-05-30', NOW(), NOW()),
('Device 11', 'Location 11', '192.168.1.11', 'active', '2024-05-30', NOW(), NOW()),
('Device 12', 'Location 12', '192.168.1.12', 'active', '2024-05-30', NOW(), NOW()),
('Device 13', 'Location 13', '192.168.1.13', 'active', '2024-05-30', NOW(), NOW()),
('Device 14', 'Location 14', '192.168.1.14', 'active', '2024-05-30', NOW(), NOW()),
('Device 15', 'Location 15', '192.168.1.15', 'active', '2024-05-30', NOW(), NOW()),
('Device 16', 'Location 16', '192.168.1.16', 'active', '2024-05-30', NOW(), NOW()),
('Device 17', 'Location 17', '192.168.1.17', 'active', '2024-05-30', NOW(), NOW()),
('Device 18', 'Location 18', '192.168.1.18', 'active', '2024-05-30', NOW(), NOW()),
('Device 19', 'Location 19', '192.168.1.19', 'active', '2024-05-30', NOW(), NOW()),
('Device 20', 'Location 20', '192.168.1.20', 'active', '2024-05-30', NOW(), NOW()),
('Device 21', 'Location 21', '192.168.1.21', 'active', '2024-05-30', NOW(), NOW()),
('Device 22', 'Location 22', '192.168.1.22', 'active', '2024-05-30', NOW(), NOW()),
('Device 23', 'Location 23', '192.168.1.23', 'active', '2024-05-30', NOW(), NOW()),
('Device 24', 'Location 24', '192.168.1.24', 'active', '2024-05-30', NOW(), NOW()),
('Device 25', 'Location 25', '192.168.1.25', 'active', '2024-05-30', NOW(), NOW()),
('Device 26', 'Location 26', '192.168.1.26', 'active', '2024-05-30', NOW(), NOW()),
('Device 27', 'Location 27', '192.168.1.27', 'active', '2024-05-30', NOW(), NOW()),
('Device 28', 'Location 28', '192.168.1.28', 'active', '2024-05-30', NOW(), NOW()),
('Device 29', 'Location 29', '192.168.1.29', 'active', '2024-05-30', NOW(), NOW()),
('Device 30', 'Location 30', '192.168.1.30', 'active', '2024-05-30', NOW(), NOW()),
('Device 31', 'Location 31', '192.168.1.31', 'active', '2024-05-30', NOW(), NOW()),
('Device 32', 'Location 32', '192.168.1.32', 'active', '2024-05-30', NOW(), NOW()),
('Device 33', 'Location 33', '192.168.1.33', 'active', '2024-05-30', NOW(), NOW()),
('Device 34', 'Location 34', '192.168.1.34', 'active', '2024-05-30', NOW(), NOW()),
('Device 35', 'Location 35', '192.168.1.35', 'active', '2024-05-30', NOW(), NOW()),
('Device 36', 'Location 36', '192.168.1.36', 'active', '2024-05-30', NOW(), NOW()),
('Device 37', 'Location 37', '192.168.1.37', 'active', '2024-05-30', NOW(), NOW()),
('Device 38', 'Location 38', '192.168.1.38', 'active', '2024-05-30', NOW(), NOW()),
('Device 39', 'Location 39', '192.168.1.39', 'active', '2024-05-30', NOW(), NOW()),
('Device 40', 'Location 40', '192.168.1.40', 'active', '2024-05-30', NOW(), NOW()),
('Device 41', 'Location 41', '192.168.1.41', 'active', '2024-05-30', NOW(), NOW()),
('Device 42', 'Location 42', '192.168.1.42', 'active', '2024-05-30', NOW(), NOW()),
('Device 43', 'Location 43', '192.168.1.43', 'active', '2024-05-30', NOW(), NOW()),
('Device 44', 'Location 44', '192.168.1.44', 'active', '2024-05-30', NOW(), NOW()),
('Device 45', 'Location 45', '192.168.1.45', 'active', '2024-05-30', NOW(), NOW()),
('Device 46', 'Location 46', '192.168.1.46', 'active', '2024-05-30', NOW(), NOW()),
('Device 47', 'Location 47', '192.168.1.47', 'active', '2024-05-30', NOW(), NOW()),
('Device 48', 'Location 48', '192.168.1.48', 'active', '2024-05-30', NOW(), NOW()),
('Device 49', 'Location 49', '192.168.1.49', 'active', '2024-05-30', NOW(), NOW()),
('Device 50', 'Location 50', '192.168.1.50', 'active', '2024-05-30', NOW(), NOW()),
('Device 51', 'Location 51', '192.168.1.51', 'active', '2024-05-30', NOW(), NOW()),
('Device 52', 'Location 52', '192.168.1.52', 'active', '2024-05-30', NOW(), NOW()),
('Device 53', 'Location 53', '192.168.1.53', 'active', '2024-05-30', NOW(), NOW()),
('Device 54', 'Location 54', '192.168.1.54', 'active', '2024-05-30', NOW(), NOW()),
('Device 55', 'Location 55', '192.168.1.55', 'active', '2024-05-30', NOW(), NOW()),
('Device 56', 'Location 56', '192.168.1.56', 'active', '2024-05-30', NOW(), NOW()),
('Device 57', 'Location 57', '192.168.1.57', 'active', '2024-05-30', NOW(), NOW()),
('Device 58', 'Location 58', '192.168.1.58', 'active', '2024-05-30', NOW(), NOW()),
('Device 59', 'Location 59', '192.168.1.59', 'active', '2024-05-30', NOW(), NOW()),
('Device 60', 'Location 60', '192.168.1.60', 'active', '2024-05-30', NOW(), NOW()),
('Device 61', 'Location 61', '192.168.1.61', 'active', '2024-05-30', NOW(), NOW()),
('Device 62', 'Location 62', '192.168.1.62', 'active', '2024-05-30', NOW(), NOW()),
('Device 63', 'Location 63', '192.168.1.63', 'active', '2024-05-30', NOW(), NOW()),
('Device 64', 'Location 64', '192.168.1.64', 'active', '2024-05-30', NOW(), NOW()),
('Device 65', 'Location 65', '192.168.1.65', 'active', '2024-05-30', NOW(), NOW()),
('Device 66', 'Location 66', '192.168.1.66', 'active', '2024-05-30', NOW(), NOW()),
('Device 67', 'Location 67', '192.168.1.67', 'active', '2024-05-30', NOW(), NOW()),
('Device 68', 'Location 68', '192.168.1.68', 'active', '2024-05-30', NOW(), NOW()),
('Device 69', 'Location 69', '192.168.1.69', 'active', '2024-05-30', NOW(), NOW()),
('Device 70', 'Location 70', '192.168.1.70', 'active', '2024-05-30', NOW(), NOW()),
('Device 71', 'Location 71', '192.168.1.71', 'active', '2024-05-30', NOW(), NOW()),
('Device 72', 'Location 72', '192.168.1.72', 'active', '2024-05-30', NOW(), NOW()),
('Device 73', 'Location 73', '192.168.1.73', 'active', '2024-05-30', NOW(), NOW()),
('Device 74', 'Location 74', '192.168.1.74', 'active', '2024-05-30', NOW(), NOW()),
('Device 75', 'Location 75', '192.168.1.75', 'active', '2024-05-30', NOW(), NOW()),
('Device 76', 'Location 76', '192.168.1.76', 'active', '2024-05-30', NOW(), NOW()),
('Device 77', 'Location 77', '192.168.1.77', 'active', '2024-05-30', NOW(), NOW()),
('Device 78', 'Location 78', '192.168.1.78', 'active', '2024-05-30', NOW(), NOW()),
('Device 79', 'Location 79', '192.168.1.79', 'active', '2024-05-30', NOW(), NOW()),
('Device 80', 'Location 80', '192.168.1.80', 'active', '2024-05-30', NOW(), NOW()),
('Device 81', 'Location 81', '192.168.1.81', 'active', '2024-05-30', NOW(), NOW()),
('Device 82', 'Location 82', '192.168.1.82', 'active', '2024-05-30', NOW(), NOW()),
('Device 83', 'Location 83', '192.168.1.83', 'active', '2024-05-30', NOW(), NOW()),
('Device 84', 'Location 84', '192.168.1.84', 'active', '2024-05-30', NOW(), NOW()),
('Device 85', 'Location 85', '192.168.1.85', 'active', '2024-05-30', NOW(), NOW()),
('Device 86', 'Location 86', '192.168.1.86', 'active', '2024-05-30', NOW(), NOW()),
('Device 87', 'Location 87', '192.168.1.87', 'active', '2024-05-30', NOW(), NOW()),
('Device 88', 'Location 88', '192.168.1.88', 'active', '2024-05-30', NOW(), NOW()),
('Device 89', 'Location 89', '192.168.1.89', 'active', '2024-05-30', NOW(), NOW()),
('Device 90', 'Location 90', '192.168.1.90', 'active', '2024-05-30', NOW(), NOW()),
('Device 91', 'Location 91', '192.168.1.91', 'active', '2024-05-30', NOW(), NOW()),
('Device 92', 'Location 92', '192.168.1.92', 'active', '2024-05-30', NOW(), NOW()),
('Device 93', 'Location 93', '192.168.1.93', 'active', '2024-05-30', NOW(), NOW()),
('Device 94', 'Location 94', '192.168.1.94', 'active', '2024-05-30', NOW(), NOW()),
('Device 95', 'Location 95', '192.168.1.95', 'active', '2024-05-30', NOW(), NOW()),
('Device 96', 'Location 96', '192.168.1.96', 'active', '2024-05-30', NOW(), NOW()),
('Device 97', 'Location 97', '192.168.1.97', 'active', '2024-05-30', NOW(), NOW()),
('Device 98', 'Location 98', '192.168.1.98', 'active', '2024-05-30', NOW(), NOW()),
('Device 99', 'Location 99', '192.168.1.99', 'active', '2024-05-30', NOW(), NOW()),
('Device 100', 'Location 100', '192.168.1.100', 'active', '2024-05-30', NOW(), NOW());

select * from Devices;
select count(*) from Devices;

-- Departments
INSERT INTO Departments (department_name, created_at, updated_at) VALUES
('Department 1', NOW(), NOW()),
('Department 2', NOW(), NOW()),
('Department 3', NOW(), NOW()),
('Department 4', NOW(), NOW()),
('Department 5', NOW(), NOW()),
('Department 6', NOW(), NOW()),
('Department 7', NOW(), NOW()),
('Department 8', NOW(), NOW()),
('Department 9', NOW(), NOW()),
('Department 10', NOW(), NOW()),
('Department 11', NOW(), NOW()),
('Department 12', NOW(), NOW()),
('Department 13', NOW(), NOW()),
('Department 14', NOW(), NOW()),
('Department 15', NOW(), NOW()),
('Department 16', NOW(), NOW()),
('Department 17', NOW(), NOW()),
('Department 18', NOW(), NOW()),
('Department 19', NOW(), NOW()),
('Department 20', NOW(), NOW()),
('Department 21', NOW(), NOW()),
('Department 22', NOW(), NOW()),
('Department 23', NOW(), NOW()),
('Department 24', NOW(), NOW()),
('Department 25', NOW(), NOW()),
('Department 26', NOW(), NOW()),
('Department 27', NOW(), NOW()),
('Department 28', NOW(), NOW()),
('Department 29', NOW(), NOW()),
('Department 30', NOW(), NOW()),
('Department 31', NOW(), NOW()),
('Department 32', NOW(), NOW()),
('Department 33', NOW(), NOW()),
('Department 34', NOW(), NOW()),
('Department 35', NOW(), NOW()),
('Department 36', NOW(), NOW()),
('Department 37', NOW(), NOW()),
('Department 38', NOW(), NOW()),
('Department 39', NOW(), NOW()),
('Department 40', NOW(), NOW()),
('Department 41', NOW(), NOW()),
('Department 42', NOW(), NOW()),
('Department 43', NOW(), NOW()),
('Department 44', NOW(), NOW()),
('Department 45', NOW(), NOW()),
('Department 46', NOW(), NOW()),
('Department 47', NOW(), NOW()),
('Department 48', NOW(), NOW()),
('Department 49', NOW(), NOW()),
('Department 50', NOW(), NOW()),
('Department 51', NOW(), NOW()),
('Department 52', NOW(), NOW()),
('Department 53', NOW(), NOW()),
('Department 54', NOW(), NOW()),
('Department 55', NOW(), NOW()),
('Department 56', NOW(), NOW()),
('Department 57', NOW(), NOW()),
('Department 58', NOW(), NOW()),
('Department 59', NOW(), NOW()),
('Department 60', NOW(), NOW()),
('Department 61', NOW(), NOW()),
('Department 62', NOW(), NOW()),
('Department 63', NOW(), NOW()),
('Department 64', NOW(), NOW()),
('Department 65', NOW(), NOW()),
('Department 66', NOW(), NOW()),
('Department 67', NOW(), NOW()),
('Department 68', NOW(), NOW()),
('Department 69', NOW(), NOW()),
('Department 70', NOW(), NOW()),
('Department 71', NOW(), NOW()),
('Department 72', NOW(), NOW()),
('Department 73', NOW(), NOW()),
('Department 74', NOW(), NOW()),
('Department 75', NOW(), NOW()),
('Department 76', NOW(), NOW()),
('Department 77', NOW(), NOW()),
('Department 78', NOW(), NOW()),
('Department 79', NOW(), NOW()),
('Department 80', NOW(), NOW()),
('Department 81', NOW(), NOW()),
('Department 82', NOW(), NOW()),
('Department 83', NOW(), NOW()),
('Department 84', NOW(), NOW()),
('Department 85', NOW(), NOW()),
('Department 86', NOW(), NOW()),
('Department 87', NOW(), NOW()),
('Department 88', NOW(), NOW()),
('Department 89', NOW(), NOW()),
('Department 90', NOW(), NOW()),
('Department 91', NOW(), NOW()),
('Department 92', NOW(), NOW()),
('Department 93', NOW(), NOW()),
('Department 94', NOW(), NOW()),
('Department 95', NOW(), NOW()),
('Department 96', NOW(), NOW()),
('Department 97', NOW(), NOW()),
('Department 98', NOW(), NOW()),
('Department 99', NOW(), NOW()),
('Department 100', NOW(), NOW());

select * from Departments;
select count(*) from Departments;

-- Roles
INSERT INTO Roles (role_name, created_at, updated_at) VALUES
('Role 1', NOW(), NOW()),
('Role 2', NOW(), NOW()),
('Role 3', NOW(), NOW()),
('Role 4', NOW(), NOW()),
('Role 5', NOW(), NOW()),
('Role 6', NOW(), NOW()),
('Role 7', NOW(), NOW()),
('Role 8', NOW(), NOW()),
('Role 9', NOW(), NOW()),
('Role 10', NOW(), NOW()),
('Role 11', NOW(), NOW()),
('Role 12', NOW(), NOW()),
('Role 13', NOW(), NOW()),
('Role 14', NOW(), NOW()),
('Role 15', NOW(), NOW()),
('Role 16', NOW(), NOW()),
('Role 17', NOW(), NOW()),
('Role 18', NOW(), NOW()),
('Role 19', NOW(), NOW()),
('Role 20', NOW(), NOW()),
('Role 21', NOW(), NOW()),
('Role 22', NOW(), NOW()),
('Role 23', NOW(), NOW()),
('Role 24', NOW(), NOW()),
('Role 25', NOW(), NOW()),
('Role 26', NOW(), NOW()),
('Role 27', NOW(), NOW()),
('Role 28', NOW(), NOW()),
('Role 29', NOW(), NOW()),
('Role 30', NOW(), NOW()),
('Role 31', NOW(), NOW()),
('Role 32', NOW(), NOW()),
('Role 33', NOW(), NOW()),
('Role 34', NOW(), NOW()),
('Role 35', NOW(), NOW()),
('Role 36', NOW(), NOW()),
('Role 37', NOW(), NOW()),
('Role 38', NOW(), NOW()),
('Role 39', NOW(), NOW()),
('Role 40', NOW(), NOW()),
('Role 41', NOW(), NOW()),
('Role 42', NOW(), NOW()),
('Role 43', NOW(), NOW()),
('Role 44', NOW(), NOW()),
('Role 45', NOW(), NOW()),
('Role 46', NOW(), NOW()),
('Role 47', NOW(), NOW()),
('Role 48', NOW(), NOW()),
('Role 49', NOW(), NOW()),
('Role 50', NOW(), NOW()),
('Role 51', NOW(), NOW()),
('Role 52', NOW(), NOW()),
('Role 53', NOW(), NOW()),
('Role 54', NOW(), NOW()),
('Role 55', NOW(), NOW()),
('Role 56', NOW(), NOW()),
('Role 57', NOW(), NOW()),
('Role 58', NOW(), NOW()),
('Role 59', NOW(), NOW()),
('Role 60', NOW(), NOW()),
('Role 61', NOW(), NOW()),
('Role 62', NOW(), NOW()),
('Role 63', NOW(), NOW()),
('Role 64', NOW(), NOW()),
('Role 65', NOW(), NOW()),
('Role 66', NOW(), NOW()),
('Role 67', NOW(), NOW()),
('Role 68', NOW(), NOW()),
('Role 69', NOW(), NOW()),
('Role 70', NOW(), NOW()),
('Role 71', NOW(), NOW()),
('Role 72', NOW(), NOW()),
('Role 73', NOW(), NOW()),
('Role 74', NOW(), NOW()),
('Role 75', NOW(), NOW()),
('Role 76', NOW(), NOW()),
('Role 77', NOW(), NOW()),
('Role 78', NOW(), NOW()),
('Role 77', NOW(), NOW()),
('Role 80', NOW(), NOW()),
('Role 81', NOW(), NOW()),
('Role 82', NOW(), NOW()),
('Role 83', NOW(), NOW()),
('Role 84', NOW(), NOW()),
('Role 85', NOW(), NOW()),
('Role 86', NOW(), NOW()),
('Role 87', NOW(), NOW()),
('Role 88', NOW(), NOW()),
('Role 89', NOW(), NOW()),
('Role 90', NOW(), NOW()),
('Role 91', NOW(), NOW()),
('Role 92', NOW(), NOW()),
('Role 93', NOW(), NOW()),
('Role 94', NOW(), NOW()),
('Role 95', NOW(), NOW()),
('Role 96', NOW(), NOW()),
('Role 97', NOW(), NOW()),
('Role 98', NOW(), NOW()),
('Role 99', NOW(), NOW()),
('Role 100', NOW(), NOW());

select * from Roles;
select count(*) from Roles;






-- Create table
CREATE TABLE login_logs (
    LogID INT,
    UserID VARCHAR(10),
    LoginTime DATETIME,
    IPAddress VARCHAR(20),
    Location VARCHAR(50),
    Device VARCHAR(20),
    Status VARCHAR(10)
);

-- Insert sample data
INSERT INTO login_logs VALUES
(1, 'U001', '2025-01-01 08:00', '192.168.1.1', 'Johannesburg', 'Mobile', 'Success'),
(2, 'U001', '2025-01-01 08:02', '192.168.1.1', 'Johannesburg', 'Mobile', 'Failed'),
(3, 'U001', '2025-01-01 08:05', '192.168.1.1', 'Johannesburg', 'Mobile', 'Failed'),
(4, 'U001', '2025-01-01 08:10', '192.168.1.1', 'Johannesburg', 'Mobile', 'Success'),

(5, 'U002', '2025-01-01 09:00', '10.0.0.1', 'Cape Town', 'Laptop', 'Success'),
(6, 'U002', '2025-01-01 22:30', '185.23.45.2', 'Russia', 'Unknown', 'Failed'),
(7, 'U002', '2025-01-01 22:32', '185.23.45.2', 'Russia', 'Unknown', 'Failed'),

(8, 'U003', '2025-01-02 10:00', '172.16.0.5', 'Pretoria', 'Desktop', 'Success'),
(9, 'U003', '2025-01-02 10:01', '172.16.0.5', 'Pretoria', 'Desktop', 'Success'),

(10, 'U004', '2025-01-02 23:50', '203.0.113.1', 'China', 'Unknown', 'Failed'),
(11, 'U004', '2025-01-02 23:52', '203.0.113.1', 'China', 'Unknown', 'Failed'),
(12, 'U004', '2025-01-02 23:55', '203.0.113.1', 'China', 'Unknown', 'Failed'),

(13, 'U005', '2025-01-03 07:30', '192.168.0.2', 'Durban', 'Mobile', 'Success'),

(14, 'U006', '2025-01-03 03:00', '8.8.8.8', 'USA', 'Laptop', 'Failed'),
(15, 'U006', '2025-01-03 03:02', '8.8.8.8', 'USA', 'Laptop', 'Failed'),
(16, 'U006', '2025-01-03 03:05', '8.8.8.8', 'USA', 'Laptop', 'Success'),

(17, 'U007', '2025-01-04 12:00', '192.168.1.10', 'Johannesburg', 'Desktop', 'Success'),

(18, 'U008', '2025-01-04 01:00', '91.198.174.2', 'Germany', 'Unknown', 'Failed'),
(19, 'U008', '2025-01-04 01:02', '91.198.174.2', 'Germany', 'Unknown', 'Failed'),

(20, 'U009', '2025-01-05 14:00', '192.168.1.20', 'Pretoria', 'Mobile', 'Success'),

-- Impossible Travel (Same user, different countries within 1 hour)
(21, 'U010', '2025-01-06 10:00', '192.168.1.50', 'Johannesburg', 'Mobile', 'Success'),
(22, 'U010', '2025-01-06 11:00', '203.0.113.5', 'Germany', 'Laptop', 'Success'),

-- Rapid Failed Attempts (Brute-force pattern)
(23, 'U011', '2025-01-06 14:00', '8.8.8.8', 'USA', 'Unknown', 'Failed'),
(24, 'U011', '2025-01-06 14:01', '8.8.8.8', 'USA', 'Unknown', 'Failed'),
(25, 'U011', '2025-01-06 14:02', '8.8.8.8', 'USA', 'Unknown', 'Failed'),

-- Night-time suspicious login
(26, 'U012', '2025-01-06 02:30', '91.198.174.2', 'Russia', 'Unknown', 'Success'),

-- Multi-location same user
(27, 'U013', '2025-01-06 09:00', '192.168.1.70', 'Cape Town', 'Mobile', 'Success'),
(28, 'U013', '2025-01-06 09:30', '172.16.0.10', 'Pretoria', 'Laptop', 'Success');
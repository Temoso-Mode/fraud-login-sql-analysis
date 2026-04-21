-- ============================================
-- PROJECT: Fraud & Suspicious Login Analysis
-- ============================================

-- 1. View Data
SELECT * FROM login_logs;

-- ============================================
-- 2. Basic Metrics
-- ============================================

-- Total logins
SELECT COUNT(*) AS TotalLogs FROM login_logs;

-- Failed vs Successful logins
SELECT Status, COUNT(*) AS Count
FROM login_logs
GROUP BY Status;

-- ============================================
-- 3. Suspicious Behaviour Detection
-- ============================================

-- Multiple failed attempts
SELECT UserID, COUNT(*) AS FailedAttempts
FROM login_logs
WHERE Status = 'Failed'
GROUP BY UserID
HAVING COUNT(*) >= 2;

-- Late night logins
SELECT *
FROM login_logs
WHERE DATEPART(HOUR, LoginTime) BETWEEN 0 AND 5;

-- ============================================
-- 4. Impossible Travel Detection
-- ============================================

SELECT *
FROM (
    SELECT 
        UserID,
        Location,
        LoginTime,

        LAG(Location) OVER (
            PARTITION BY UserID 
            ORDER BY LoginTime
        ) AS PreviousLocation,

        DATEDIFF(HOUR, 
            LAG(LoginTime) OVER (PARTITION BY UserID ORDER BY LoginTime),
            LoginTime
        ) AS HoursBetween

    FROM login_logs
) AS TravelCheck

WHERE Location <> PreviousLocation
  AND HoursBetween IS NOT NULL
  AND HoursBetween < 2;

-- ============================================
-- 5. Risk Scoring Model
-- ============================================

--Risk Scoring System
SELECT 
    UserID,

    COUNT(*) AS TotalLogins,

    COUNT(CASE WHEN Status = 'Failed' THEN 1 END) AS FailedAttempts,

    COUNT(DISTINCT Location) AS UniqueLocations,

    CASE 
        WHEN COUNT(CASE WHEN Status = 'Failed' THEN 1 END) >= 3 THEN 2
        ELSE 0
    END
    +
    CASE 
        WHEN COUNT(DISTINCT Location) > 1 THEN 2
        ELSE 0
    END
    +
    CASE 
        WHEN MIN(DATEPART(HOUR, LoginTime)) BETWEEN 0 AND 5 THEN 1
        ELSE 0
    END
    AS RiskScore

FROM login_logs
GROUP BY UserID;

--RiskLevel
SELECT *,
CASE 
    WHEN RiskScore >= 4 THEN 'High Risk'
    WHEN RiskScore >= 2 THEN 'Medium Risk'
    ELSE 'Low Risk'
END AS RiskLevel
FROM (
    SELECT 
        UserID,

        COUNT(*) AS TotalLogins,

        COUNT(CASE WHEN Status = 'Failed' THEN 1 END) AS FailedAttempts,

        COUNT(DISTINCT Location) AS UniqueLocations,

        CASE 
            WHEN COUNT(CASE WHEN Status = 'Failed' THEN 1 END) >= 3 THEN 2
            ELSE 0
        END
        +
        CASE 
            WHEN COUNT(DISTINCT Location) > 1 THEN 2
            ELSE 0
        END
        +
        CASE 
            WHEN MIN(DATEPART(HOUR, LoginTime)) BETWEEN 0 AND 5 THEN 1
            ELSE 0
        END
        AS RiskScore

    FROM login_logs
    GROUP BY UserID
) AS RiskTable;


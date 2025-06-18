-- Simple Queries

--Total Number of Tickets
SELECT COUNT(*) AS total_tickets FROM tickets;

--Average Resolution Time
SELECT AVG(Resolution_Time_hours) AS avg_resolution_time FROM tickets;

--Tickets Per Technician
SELECT [Assigned_Technician], COUNT(*) AS ticket_count
FROM tickets
GROUP BY [Assigned_Technician]
ORDER BY ticket_count DESC;

--Most Common Issue Types
SELECT [Issue_Type], COUNT(*) AS issue_count
FROM tickets
GROUP BY [Issue_Type]
ORDER BY issue_count DESC;

--Daily Ticket Volume
SELECT [Opened_Date], COUNT(*) AS tickets_opened
FROM tickets
GROUP BY [Opened_Date]
ORDER BY [Opened_Date];


--Advanced Queries

--Technician Performance (Avg Resolution Time per Technician)
SELECT 
    [Assigned_Technician],
    COUNT(*) AS ticket_count,
    AVG([Resolution_Time_hours]) AS avg_resolution_time
FROM tickets
GROUP BY [Assigned_Technician]
ORDER BY avg_resolution_time ASC;

--Resolution Time by Issue Type
SELECT 
    [Issue_Type],
    COUNT(*) AS total_tickets,
    AVG([Resolution_Time_hours]) AS avg_resolution_time
FROM tickets
GROUP BY [Issue_Type]
ORDER BY avg_resolution_time DESC;

--Monthly Ticket Trends (Grouped by Month)
SELECT 
    FORMAT([Opened_Date], 'yyyy-MM') AS Month,
    COUNT(*) AS tickets_opened
FROM tickets
GROUP BY FORMAT([Opened_Date], 'yyyy-MM')
ORDER BY Month;

--Average Resolution Time by Day of Week
SELECT 
    DATENAME(WEEKDAY, [Opened_Date]) AS DayOfWeek,
    AVG([Resolution_Time_hours]) AS avg_resolution_time
FROM tickets
GROUP BY DATENAME(WEEKDAY, [Opened_Date])
ORDER BY AVG([Resolution_Time_hours]) ASC;
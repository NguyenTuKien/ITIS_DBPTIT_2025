SELECT
    Team,
    AVG(CASE WHEN Site = 'Home' THEN Attendance END) AS Avg_As_Home,
    AVG(CASE WHEN Site = 'Away' THEN Attendance END) AS Avg_As_Away
FROM (
    SELECT HomeTeam AS Team, HomeAttendance AS Attendance, 'Home' AS Site
    FROM TeamStats
    UNION ALL
    SELECT AwayTeam AS Team, AwayAttendance AS Attendance, 'Away' AS Site
    FROM TeamStats
) AS AllGames
GROUP BY Team;
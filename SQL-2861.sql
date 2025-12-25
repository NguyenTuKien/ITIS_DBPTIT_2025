select (case when HomeTeam < AwayTeam then HomeTeam else AwayTeam end) as TeamA,
       (case when HomeTeam > AwayTeam then HomeTeam else AwayTeam end) as TeamB,
        avg(HomeAttendance + AwayAttendance) as Avg_Total_Attendance
from TeamStats
group by TeamA, TeamB
order by Avg_Total_Attendance desc 

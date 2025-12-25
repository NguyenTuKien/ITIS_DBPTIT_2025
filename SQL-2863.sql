select Team, sum(Attendance) as Total_Attendance from (
  select HomeTeam as Team, HomeAttendance as Attendance from TeamStats
  union all
  select AwayTeam as Team, AwayAttendance as Attendance from TeamStats
) as ts 
group by Team
order by Total_Attendance desc
limit 3
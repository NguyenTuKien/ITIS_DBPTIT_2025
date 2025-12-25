select vr.Horsepower as horsepower from Vehicle_Releases vr
join Vehicle_Types vt on vt.id = vr.Vehicle_Type_Id
where vr.Release_Date >= '2020-01-01' and vt.name = "Sedan"
order by vr.Horsepower desc
limit 1
CREATE PROCEDURE GetEmployeeById(
  in p_employeesId INT
)
BEGIN 
  Select * from Employees where id = p_employeesId;
END$$
DELIMITER ;
$$
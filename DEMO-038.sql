select s.OrderID, c.CustomerName, s.OrderDate, s.TotalAmount from SaleOrder s 
join Customer c on c.CustID = s.CustID 
where c.City = 'Ha Noi' and s.TotalAmount > 500
order by s.OrderID
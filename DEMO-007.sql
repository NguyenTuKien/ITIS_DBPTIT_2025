update SALEORDER s
join PAYMENT p on p.OrderID = s.OrderID and p.Status = 'Paid'
set s.Status = 'PAID'
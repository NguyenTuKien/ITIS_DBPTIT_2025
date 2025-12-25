delete from CUSTOMER
where CustID not in (
  select CustID from SALEORDER 
)

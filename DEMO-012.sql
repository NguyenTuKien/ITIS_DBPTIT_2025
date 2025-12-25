create table SALEORDER(
  OrderID int primary key,
  CustID int not null,
  TotalAmount DECIMAL(12,2) not null,
  Status ENUM('NEW','PAID','CANCELLED') not null,
  constraint fk_cust foreign key (CustId) references CUSTOMER(CustID),
  constraint check_total check (TotalAmount > 0)
)
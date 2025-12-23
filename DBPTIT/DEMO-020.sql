create table SALE_TRANSACTION(
  TxnID INT primary key,
  CustID INT not null,
  ProductID INT not null,
  EmpID INT not null,
  TxnDate DATE not null,
  Quantity INT not null,
  UnitPrice DECIMAL(10,2) not null,
  Discount DECIMAL(5,2) not null default 0,
  PaymentMethod ENUM('CASH','CARD','TRANSFER') not null,
  Notes VARCHAR(255),
  constraint fk_cust foreign key (CustID) references CUSTOMER(CustID),
  constraint fk_product foreign key (ProductID) references PRODUCT(ProductID),
  constraint fk_emp foreign key (EmpID) references EMPLOYEE(EmpID)
)
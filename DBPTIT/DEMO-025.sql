create table REVIEW(
  Comment varchar(500),
  CreatedAt datetime2 not null default sysdatetime(),
  CustID int not null unique,
  constraint fk_cust foreign key (CustID) references CUSTOMER(CustID),
  ProductID int not null unique,
  constraint fk_product foreign key (ProductID) references PRODUCT(ProductID),
  Rating int not null,
  constraint chk_rating check(Rating >= 1 and Rating <= 5),
  ReviewID int primary key
)
create table SUPPLY(
  SID int not null,
  PID int not null,
  Price DECIMAL(10,2) not null,
  primary key (SID, PID),
  constraint fk_sid foreign key (SID) references SUPPLIER(SID),
  constraint fk_cid foreign key (PID) references PART(PID),
  constraint ck_price check (Price > 0)
)
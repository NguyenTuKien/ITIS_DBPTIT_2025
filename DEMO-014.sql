create table TXN(
  TxnID int primary key,
  AccountID int not null,
  Amount decimal(12,2) not null,
  Type enum('DEPOSIT','WITHDRAW') not null,
  TxnTime timestamp not null default current_timestamp,
  constraint fk_accountId foreign key (AccountID) references Account(AccountID),
  constraint chk_amount check (Amount > 0)
);
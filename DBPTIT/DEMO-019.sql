create table LOAN(
  LoanID int primary key,
  MemberID int not null,
  BookID int not null,
  LoanDate date not null,
  DueDate date not null,
  ReturnDate date,
  Status ENUM('BORROWED','RETURNED','OVERDUE') not null default 'BORROWED',
  Fine DECIMAL(8,2) not null default 0,
  constraint fk_member foreign key (MemberID) references MEMBER(MemberID),
  constraint fk_book foreign key (BookID) references BOOK(BookID)
)
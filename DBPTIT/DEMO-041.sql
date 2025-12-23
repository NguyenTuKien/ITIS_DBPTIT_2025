create table RESERVATION(
  ReservationID int primary key,
  GuestID int not null,
  RoomID int not null,
  CheckIn date not null,
  CheckOut date not null,
  BookingDate date not null,
  NumGuests int not null,
  Status varchar(20) not null,
  Notes varchar(255),
  constraint fk_guest foreign key (GuestID) references Guest(GuestID),
  constraint fk_room foreign key (RoomID) references Room(RoomID)
)
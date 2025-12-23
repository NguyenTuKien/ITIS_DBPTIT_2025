create table ENROLL(
  SID int not null,
  CID int not null,
  EnrollmentDate date not null,
  primary key (SID, CID),
  constraint fk_student foreign key (SID) references STUDENT(SID),
  constraint fk_course foreign key (CID) references COURSE(CID)
)
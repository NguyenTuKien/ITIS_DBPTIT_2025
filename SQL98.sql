delete p1 from person p1
  join person p2 on p2.email = p1.email and p2.id < p1.id;
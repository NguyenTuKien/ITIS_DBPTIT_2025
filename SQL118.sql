CREATE TABLE enrollments (
  enrollment_id INT,
  student_id INT,
  course_id INT,
  enrollment_date DATE,
  PRIMARY KEY (enrollment_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
CREATE INDEX "student_index" ON "students" ("name");

CREATE INDEX "course_index" ON "courses" ("department", "number", "semester", "title");

CREATE INDEX "enrollment_index" ON "enrollments" ("student_id", "course_id");

CREATE INDEX "requirement_index" ON "requirements" ("name");

CREATE INDEX "satisfie_index" ON "satisfies" ("course_id", "requirement_id") 

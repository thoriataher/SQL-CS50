CREATE TABLE "users"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools"(
    "id" INTEGER,
    "user_id" INTEGER,
    "name" TEXT,
    "type" TEXT CHECK("type" IN ("Elementary School", "Middle School", "High School", "Lower School", "Upper School", "College", "University")),
    "location" TEXT,
    "establish_year" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);

CREATE TABLE "compaines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT CHECK ("industry" IN ("Education", "Technology", "Finance")),
    "location" TEXT,
    PRIMARY KEY("id")
);
CREATE TABLE "connections"(
    "user1ID" INTEGER,
    "user2ID" INTEGER,
    PRIMARY KEY ("user1ID", "user2ID"),
    FOREIGN KEY ("user1ID") REFERENCES "users"("id"),
    FOREIGN KEY ("user2ID") REFERENCES "users"("id")
);

CREATE TABLE "school_connection"(
    "school_id" INTEGER,
    "user_id" INTEGER,
    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC  DEFAULT CURRENT_TIMESTAMP,
    "degree" TEXT CHECK ("degree" IN ("MA", "BA", "PhD")),
    FOREIGN KEY("school_id") REFERENCES "schools"("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);

CREATE TABLE "companies_connection" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "title" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);

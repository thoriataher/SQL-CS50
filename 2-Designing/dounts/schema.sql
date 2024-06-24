CREATE TABLE "ingredients"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price" NUMERIC NOT NULL,
    "unit" TEXT NOT NULL ,
    PRIMARY KEY ("id")
);

CREATE TABLE "dounts"(
    "id" INTEGER,
    "ingredients_id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "is_gluten_free" TEXT CHECK("is_gluten_free" IN ('Y', 'N')),
    "price" REAL NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("ingredients_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "ordrs"(
    "id" INTEGER,
    "dount_id" INTEGER,
    "customer_address" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("dount_id") REFERENCES "dounts"("id")
);

CREATE TABLE "customers"(
    "id" INTEGER,
    "order_id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id")
);


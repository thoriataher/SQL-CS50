CREATE TABLE
    "meteorites_temp" (
        "name" TEXT,
        "id" INTEGER,
        "nameType" TEXT,
        "class" TEXT,
        "mass" REAL,
        "discovery" TEXT,
        "year" NUMERIC,
        "lat" REAL,
        "long" REAL,
    );

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" ='';
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" ='';
UPDATE "meteorites_temp" SET "lat" = NULL WHERE "lat" ='';
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" ='';

UPDATE "meteorites_temp" SET "mass" =  ROUND("mass", 2);
UPDATE "meteorites_temp" SET "long" =  ROUND("long", 2);
UPDATE "meteorites_temp" SET "lat" =  ROUND("lat", 2);

DELETE FROM "meteorites_temp" WHERE "nameType" = 'Relict';

CREATE TABLE
    "meteorites" (
        "id" INTEGER,
        "name" TEXT,
        "class" TEXT,
        "mass" REAL,
        "discovery" TEXT,
        "year" NUMERIC,
        "lat" REAL,
        "long" REAL,
        PRIMARY KEY ("id")
    );

INSERT INTO
    "meteorites" (
        "name",
        "class",
        "discovery",
        "year",
        "lat",
        "long"
    )
SELECT ("name",
        "class",
        "discovery",
        "year",
        "lat",
        "long") FROM "meteorites_temp"
        ORDER BY "year" ASC, "name" ASC

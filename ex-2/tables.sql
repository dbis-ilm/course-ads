CREATE TABLE IF NOT EXISTS "Customers" (
    "CNo"  INTEGER PRIMARY KEY,
    "Name" VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS "Products" (
    "PNo"         INTEGER PRIMARY KEY,
    "Description" VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS "Stores" (
    "SID"     INTEGER PRIMARY KEY,
    "Name"    VARCHAR NOT NULL,
    "Address" VARCHAR
);

CREATE TABLE IF NOT EXISTS "Sales" (
    "RNo"  INTEGER PRIMARY KEY,
    "SID"  INTEGER NOT NULL REFERENCES "Stores"("SID"),
    "Date" DATE    NOT NULL,
    "Time" TIME    NOT NULL,
    "CNo"  INTEGER REFERENCES "Customers"("CNo")
);

CREATE TABLE IF NOT EXISTS "SpecialOffers" (
    "SID" INTEGER NOT NULL,
    "PNo" INTEGER NOT NULL,
    PRIMARY KEY ("SID", "PNo"),
    FOREIGN KEY ("SID") REFERENCES "Stores"("SID"),
    FOREIGN KEY ("PNo") REFERENCES "Products"("PNo")
);

CREATE TABLE IF NOT EXISTS "Receipts" (
    "RNo"      INTEGER NOT NULL,
    "PNo"      INTEGER NOT NULL,
    "Quantity" INTEGER NOT NULL CHECK ("Quantity" > 0),
    PRIMARY KEY ("RNo", "PNo"),
    FOREIGN KEY ("RNo") REFERENCES "Sales"("RNo"),
    FOREIGN KEY ("PNo") REFERENCES "Products"("PNo")
);

INSERT INTO "Customers" ("CNo", "Name") VALUES
    (123, 'Müller, F'),
    (456, 'Abel, M'),
    (789, 'Schulz, R'),
    (109, 'Jahn, E'),
    (403, 'Meier, T');

INSERT INTO "Products" ("PNo", "Description") VALUES
    (45, 'Butter'),
    (56, 'Cake'),
    (11, 'Milk'),
    (67, 'Orange'),
    (13, 'Potatoes');

INSERT INTO "Stores" ("SID", "Name", "Address") VALUES
    (27, 'Aldi',  'Hüttenholz'),
    (23, 'Netto', 'Herderstrasse'),
    (24, 'Tegut', 'Goethepassage'),
    (20, 'Rewe',  'Mühlgraben');

INSERT INTO "Sales" ("RNo", "SID", "Date", "Time", "CNo") VALUES
    ( 1, 23, DATE '2025-09-27', TIME '08:13', 456),
    ( 3, 20, DATE '2025-09-30', TIME '09:59', 123),
    ( 5, 24, DATE '2025-10-18', TIME '12:07', 789),
    ( 7, 27, DATE '2025-10-19', TIME '10:43', 456),
    ( 9, 27, DATE '2025-10-19', TIME '21:01', 123),
    (17, 20, DATE '2025-11-03', TIME '11:34', 403);

INSERT INTO "SpecialOffers" ("SID", "PNo") VALUES
    (27, 13),
    (27, 56),
    (23, 67),
    (23, 13),
    (24, 56),
    (27, 67),
    (24, 67);

INSERT INTO "Receipts" ("RNo", "PNo", "Quantity") VALUES
    (1, 45, 2),
    (1, 67, 10),
    (3, 11, 2),
    (5, 67, 5),
    (7, 56, 1),
    (7, 67, 11),
    (9, 45, 1),
    (9, 56, 3),
    (9, 67, 7);

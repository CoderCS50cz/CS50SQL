-- Represent users, which having device and subscription
CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "nickname" TEXT NOT NULL UNIQUE,
    "login" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "birthday" DATE NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent user's devices
CREATE TABLE "devices" (
    "id" INTEGER,
    "user_id" INTEGER,
    "type" TEXT NOT NULL CHECK("type" IN ('PC', 'notebook', 'tablet', 'cell phone', 'watch', 'AR/VR', 'headphone', 'TV')),
    "storage" TEXT CHECK("storage" IN ('32GB', '64GB', '128GB', '256GB', '512GB', '1TB', '2TB', '4TB', '8TB')),
    "price" REAL,
    "production_year" YEAR,
    "coverage" BOOLEAN NOT NULL CHECK("coverage" IN (0, 1)),
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);

-- Represent user's subscriptions
CREATE TABLE "subscriptions" (
    "id" INTEGER,
    "user_id" INTEGER,
    "device_id" INTEGER,
    "service" TEXT CHECK("service" IN ('cloud', 'television', 'music', 'games', 'fitness', 'news', 'podcasts', 'books', 'care')),
    "began" DATE NOT NULL,
    "end" DATE NOT NULL,
    "cost" REAL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("device_id") REFERENCES "devices"("id")
);

-- Create indexes to speed common searches
CREATE INDEX "person_index" ON "users" ("first_name", "last_name");
CREATE INDEX "device_index" ON "devices" ("type") WHERE "production_year" = 2023;
CREATE INDEX "service_index" ON "subscriptions" ("device_id") WHERE "service" = 'cloud';

-- Represent view of user's nicknames hiding personal data
CREATE VIEW "nicknames" AS
SELECT "nickname" FROM "users";

-- Represent view of users with their devices and subscriptions
CREATE VIEW "user_subscriptions" AS
SELECT "nickname", "type" AS "device", "service" FROM "subscriptions"
JOIN "users" ON "users"."id" = "subscriptions"."user_id"
JOIN "devices" ON "devices"."id" = "subscriptions"."device_id"
ORDER BY "device";

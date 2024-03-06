-- Find user's data by his first and last name
SELECT "id", "nickname", "login", "password", "birthday", "location" FROM "users"
WHERE "first_name" = 'John' AND "last_name" = '117';

-- Find all subscription data for user "Tim C"
SELECT "service", "began", "end", "cost" FROM "subscriptions"
WHERE "user_id" = (
    SELECT "id" FROM "users"
    WHERE "first_name" = 'Tim' AND "birthday" = '1960-11-01'
);

-- Find all nicknames and their locations by device type and subscription
SELECT "nickname", "location" FROM "users"
JOIN "devices" ON "devices"."user_id" = "users"."id"
JOIN "subscriptions" ON "subscriptions"."device_id" = "devices"."id"
WHERE "type" = 'cell phone' AND "service" = 'care';

-- Find the total amount of mobile phone subscriptions for all users
SELECT SUM("cost") FROM "subscriptions"
WHERE "device_id" IN (
    SELECT "id" FROM "devices"
    WHERE "type" = 'cell phone'
);

-- Add a new user
INSERT INTO "users" ("first_name", "last_name", "nickname", "login", "password", "birthday", "location")
VALUES
('Tim', 'C', 'appleceo01', 'tim_c', 'applerules', '1960-11-01', 'CA'),
('Bill', 'G', 'microsoftcofounder02', 'bill_g', 'windows12?', '1955-10-28', 'WA'),
('John', '117', 'masterchief', 'john-117', 'cortana', '2001-11-15', 'IL');

-- Add a new device
INSERT INTO "devices" ("user_id", "type", "storage", "price", "production_year", "coverage")
VALUES
('1', 'PC', '8TB', 12948.98, 2023, 1),
('1', 'notebook', '1TB', 5498.98, 2023, 1),
('1', 'tablet', '2TB', 2478.00, 2023, 1),
('1', 'cell phone', '512GB', 1399.00, 2023, 1),
('1', 'watch', '64GB', 1049.00, 2023, 1),
('1', 'AR/VR', '256GB', 3499.00, 2024, 1),
('1', 'headphone', NULL, 549.00, 2023, 1),
('1', 'TV', '128GB', 149.00, 2022, 1),
('2', 'PC', '256GB', 599.00, 2022, 1),
('2', 'notebook', '512GB', 1000.00, 2020, 0),
('2', 'cell phone', '64GB', 499.00, 2018, 0),
('3', 'cell phone', '128GB', 999.00, 2023, 1),
('3', 'AR/VR', '1TB', 3899.00, 2024, 1);

-- Add new subscription
INSERT INTO "subscriptions" ("user_id", "device_id", "service", "began", "end", "cost")
VALUES
('1', '1', 'cloud', '2011-10-12', '2025-12-31', 1.99),
('1', '2', 'music', '2015-06-30', '2025-12-31', 6.99),
('1', '3', 'podcasts', '2016-01-26', '2025-06-30', 2.49),
('1', '4', 'care', '2011-07-01', '2025-11-11', 249.00),
('1', '5', 'fitness', '2020-12-14', '2024-09-01', 69.99),
('1', '6', 'books', '2010-04-02', '2024-03-02', 15.89),
('1', '7', 'care', '2023-07-01', '2024-07-01', 20.00),
('1', '8', 'television', '2007-01-09', '2026-01-05', 15.55),
('2', '9', 'games', '2020-01-20', '2030-12-31', 55.01),
('2', '10', 'news', '2015-09-16', '2024-03-18', 25.45),
('2', '11', 'care', '2020-07-10', '2021-07-09', NULL),
('3', '12', 'music', '2021-12-08', '2660-12-31', 6.00),
('3', '13', 'cloud', '2021-12-08', '2660-12-31', 6.00);

-- Updating subscription for device with id = 11
UPDATE "subscriptions"
SET "service" = 'cloud', "began" = '2024-02-03', "end" = '2025-02-03', "cost"= 1.99
WHERE "device_id" = 11;

-- Deleting data older than January 01, 2023
DELETE FROM "subscriptions"
WHERE "began" < '2023-01-01';

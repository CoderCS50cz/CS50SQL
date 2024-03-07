
-- *** The Lost Letter ***
-- By first query we want to find id from which address letter was send (in that case id is 432):
SELECT * FROM addresses WHERE address = '900 Somerville Avenue';
-- By second query we want to realize if the content of letter matches with from_address and set up id for to_address (case for Congratulatory letter id is 384 and goes to adress with id 854):
SELECT * FROM packages WHERE from_address_id = 432;
-- By last query we want to know the address where Congratulatory letter comes to:
SELECT * FROM addresses WHERE id = 854;

-- *** The Devious Delivery ***
-- By first query we should find a content of parcel knowing there is no address from it comes and id of content (item is Duck debugger with id 5098):
SELECT id FROM packages WHERE from_address_id IS NULL;
-- Second query will show us content of a package (Duck debugger):
SELECT * FROM scans
WHERE package_id = (
    SELECT id FROM packages
    WHERE from_address_id IS NULL
);
-- Third query will give us address id according id of the package:
SELECT address_id FROM scans
WHERE package_id = (
    SELECT id FROM packages
    WHERE from_address_id IS NULL
) AND action = 'Drop';
-- Forth query will tell us type of the address:
SELECT type FROM addresses
WHERE id = (
    SELECT address_id FROM scans
    WHERE package_id = (
        SELECT id FROM packages
        WHERE from_address_id IS NULL
    ) AND action = 'Drop'
);

-- *** The Forgotten Gift ***
-- By first query we shoud indent id from sender's address (9873):
SELECT id FROM addresses
WHERE address = '109 Tileston Street';
-- Second query will show us id of recepient address (4983)
SELECT id FROM addresses
WHERE address = '728 Maple Place';
-- Third query will give us id of a content and items inside (9523, Flowers)
SELECT id, contents FROM packages
WHERE from_address_id = (
    SELECT id FROM addresses
    WHERE address = '109 Tileston Street'
) AND to_address_id = (
    SELECT id FROM addresses
    WHERE address = '728 Maple Place'
);
-- Forth query will show us driver's id which only pick up the parcel, but didn't deliver it yet (17)
SELECT driver_id FROM scans
WHERE package_id = (
    SELECT id FROM packages
    WHERE from_address_id = (
        SELECT id FROM addresses
        WHERE address = '109 Tileston Street'
    ) AND to_address_id = (
        SELECT id FROM addresses
        WHERE address = '728 Maple Place'
        )
)
ORDER BY timestamp DESC
LIMIT 1;
-- Fith query will give us name of a delivery driver:
SELECT name FROM drivers
WHERE id = (
    SELECT driver_id FROM scans
    WHERE package_id = (
        SELECT id FROM packages
        WHERE from_address_id = (
            SELECT id FROM addresses
            WHERE address = '109 Tileston Street'
        ) AND to_address_id = (
            SELECT id FROM addresses
            WHERE address = '728 Maple Place'
            )
    )
    ORDER BY timestamp DESC
    LIMIT 1
);

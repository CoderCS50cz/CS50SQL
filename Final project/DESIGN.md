# Design Document

By Iaroslav Smirnov

Video overview: <[URL FOR THE PROJECT](https://www.youtube.com/watch?v=uR791i38KkA)>

## Scope

The CS50 SQL database includes all the objects needed to facilitate the process of tracking subscriptions on specific devices of specific users. Thus, the scope of the database includes:

* Users, including their identifying information
* Devices with a specific type and characteristics, such as internal memory capacity, year of manufacture and coverage, owned by users and on which certain services are installed in the form of subscriptions
* Subscriptions indicating the type of service, period and cost of each

Out of scope are items such as websites (where users purchase subscriptions), payment details (e.g. payment cards, services, etc.).

## Functional Requirements

This database will support:

* Tracking all device and subscriptions, which belongs to users
* Adding, updating, deleting new users, devices, subscriptions in the database

Note that in this iteration, the system will not support informing users with confirmation or when their subscriptions have expired. And cases where the user has a subscription but does not own the devices are not supported.

## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

The database includes the following entities:

#### Users

The `users` table includes:

* `id`, which specifies the unique ID for the user as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `first_name`, which specifies the user's first name as `TEXT`, given `TEXT` is appropriate for name fields.
* `last_name`, which specifies the user's last name. `TEXT` is used for the same reason as `first_name`.
* `nickname`, which specifies the user's nickname. `TEXT` is used for the same reason as `first_name`. A `UNIQUE` constraint ensures no two users have the same nickname.
* `login`, which specifies the user's login. `TEXT` is used for the same reason as `first_name`.
* `password`, which specifies the user's password as `TEXT`. Because it can consist of letters, digits and special characters.
* `birthday`, which specifies the user's date of birth as `DATE`. Because the format shoud be YYYY-MM-DD.
* `location`, which specifies the user's password as `TEXT`. States with abbreviations were selected for location.

All columns in the `users` table (besides `id`) are required and hence should have the `NOT NULL` constraint applied. No other constraints are necessary.

#### Devices

The `devices` table includes:

* `id`, which specifies the unique ID for the device as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `user_id`, which is the ID of the user who ownes the device as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `users` table to ensure data integrity.
* `type`, which specifies the device type as `TEXT`. And this is strictly determined by the device type with `CHECK`, which can only be from the list of: PC, notebook, tablet, cell phone, watch, AR/VR, headphone or TV.
* `storage`, which specifies the device storage as `TEXT`. And this is strictly determined by the device type with `CHECK`, which can only be from the list of: 32Gb, 64GB, 128GB, 256GB, 512GB, 1TB, 2TB, 4TB and 8TB.
* `price`, which specifies the price of device as `REAL`. This can be any number with a decimal point.
* `production_year`, which specifies the production year of device as `YEAR`. It should be a number with four digits in format YYYY.
* `coverage`, which defines the device's warranty or coverage as `BOOLEAN`. In this case, the TRUE or FALSE operator uses CHECK constraints with 0 for FALSE and 1 for TRUE.

Two columns `type` and `coverage` are required and hence have the `NOT NULL` constraint applied where a `PRIMARY KEY` or `FOREIGN KEY` constraint is not also.

#### Subscriptions

The `subscriptions` table includes:

* `id`, which specifies the unique ID for the subscription as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `user_id`, which specifies the ID of the user who have a subscription as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `users` tableto ensure data integrity.
* `device_id`, which specifies the ID of the user's device as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `devices` table, which ensures each device belongs to a user.
* `service`, which specifies the type of subscription as `TEXT`. And this is strictly determined by the type with `CHECK`, which can only be from the list of: cloud, television, music, games, fitness, news, podcasts, books and care.
* `began`, which specifies the begining of subscription date as `DATE`. Because the format shoud be YYYY-MM-DD.
* `end`, which specifies the finishing of subscription date as `DATE`. Because the format shoud be YYYY-MM-DD.
* `cost`, which specifies the cost of subscription as `REAL`. This can be any number with a decimal point.

Two columns `began` and `end` are required and hence have the `NOT NULL` constraint applied where a `PRIMARY KEY` or `FOREIGN KEY`s constraint is not also.

### Relationships

The below entity relationship diagram describes the relationships among the entities in the database.

![ER Diagram](diagram.png)

* One user is capable of having zero to many devices. If he doesn't have a device, and many if he has more than one device. A device has its own only one user.
* A device is associated with zero to many subscriptions. At the same time, a subscription could belong to only one device.
* A subscription could be owned by only one user and also provided to only one user's device. And user could have zero or many subscriptions per one device or many subscriptions for different devices owned by user.

## Optimizations

Per the typical query in `queries.sql`, it is common for users of the database to access all data by any particular user. For that reason, indexes are created on the `first_name`, `last_name` columns to speed the identification of users by those columns.

It is also very useful to find the device type by indexing the `device` table by `type` and selecting a specific `production_year` for example.

Sometimes it is useful to speed up the search for `device_id` by indexing it with some `service`.

## Limitations

The database in this project is very useful for finding specific user devices and user subscriptions. The database has a limitation: the user only has a subscription, but does not own his device - there is no such case like that, cause subscription should belong to device too.

CREATE TABLE passengers (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE check_ins (
    id INTEGER,
    passenger_id INTEGER,
    datetime NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    flight_id TEXT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(passenger_id) REFERENCES passengers(id),
    FOREIGN KEY(flight_id) REFERENCES flights(id)
);


CREATE TABLE airlines (
    id INTEGER,
    airline TEXT NOT NULL,
    concourse TEXT NOT NULL CHECK(concourse IN ("A", "B", "C", "D", "E", "F", "T")),
    PRIMARY KEY(id)
);


CREATE TABLE flights (
    id INTEGER,
    flight_number INTEGER NOT NULL,
    airline_id TEXT NOT NULL,
    airport_departure TEXT NOT NULL,
    airport_heading TEXT NOT NULL,
    departure_date NUMERIC NOT NULL DEFAULT CURRENT_DATESTAMP,
    arrival_date NUMERIC NOT NULL DEFAULT CURRENT_DATESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(airline_id) REFERENCES airlines(id)
);

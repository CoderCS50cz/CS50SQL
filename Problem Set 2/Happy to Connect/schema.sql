CREATE TABLE users (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT UNIQUE,
    password TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE schools (
    id INTEGER,
    name TEXT,
    type TEXT CHECK(type IN ("Elementary School", "Middle School", "High School", "Lower School", "Upper School", "College", "University")),
    location TEXT,
    foundation_year TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE companies (
    id INTEGER,
    name TEXT,
    industry TEXT CHECK(industry IN ("Education", "Technology", "Finance")),
    location TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE user_connection (
    user1_id INTEGER,
    user2_id INTEGER,
    PRIMARY KEY(user1_id, user2_id)
);

CREATE TABLE schools_connection (
    user_id INTEGER,
    school_id INTEGER,
    start NUMERIC,
    end NUMERIC,
    degree TEXT CHECK(degree IN ("BA", "MA", "PhD")),
    PRIMARY KEY(user_id, school_id)
);

CREATE TABLE companies_connection (
    user_id INTEGER,
    company_id INTEGER,
    start NUMERIC,
    end NUMERIC,
    title TEXT,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(company_id) REFERENCES companies(id)
);

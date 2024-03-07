CREATE TABLE ingredients (
    id INTEGER,
    ingredient TEXT,
    price REAL,
    unit TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE donuts (
    id INTEGER,
    name TEXT,
    gluten TEXT,
    price REAL,
    PRIMARY KEY(id)
);

CREATE TABLE donut_ingredients (
    ingredient_id INTEGER,
    donut_id INTEGER,
    FOREIGN KEY(ingredient_id) REFERENCES ingredients(id),
    FOREIGN KEY(donut_id) REFERENCES donuts(id)
);

CREATE TABLE customers (
    id INTEGER,
    first_name TEXT,
    last_name TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE orders (
    id INTEGER,
    customer_id INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

CREATE TABLE donut_order (
    donut_id INTEGER,
    order_id INTEGER,
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(donut_id) REFERENCES donuts(id)
);

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    mobile TEXT NOT NULL,
    password TEXT NOT NULL,
    image TEXT
);

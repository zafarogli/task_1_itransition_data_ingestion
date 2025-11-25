DROP TABLE IF EXISTS books;

CREATE TABLE books (
    id VARCHAR(30) PRIMARY KEY,
    title TEXT,
    author TEXT,
    genre TEXT,
    publisher TEXT,
    year INT,
    price_raw TEXT
);

CREATE TABLE Authors (
    author_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT
);

CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    author_id INTEGER,
    published_year INTEGER,
    price REAL DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone TEXT
);

CREATE TABLE Borrowings (
    borrow_id INTEGER PRIMARY KEY,
    member_id INTEGER,
    book_id INTEGER,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Authors
INSERT INTO Authors (author_id, name, country)
VALUES (1, 'J.K. Rowling', 'UK'),
       (2, 'George R.R. Martin', NULL),          -- country missing
       (3, 'Agatha Christie', 'UK');

-- Books
INSERT INTO Books (book_id, title, author_id, published_year, price)
VALUES (1, 'Harry Potter', 1, 1997, 450.00),
       (2, 'Game of Thrones', 2, 1996, 550.00),
       (3, 'Murder on the Orient Express', 3, 1934, NULL);  -- price missing

-- MembersSELECT * FROM Books;
SELECT * FROM Members;

INSERT INTO Members (member_id, name, email, phone)
VALUES (1, 'Aarav Mehta', 'aarav@example.com', NULL),
       (2, 'Sara Khan', NULL, '9876543210');

-- Borrowings
INSERT INTO Borrowings (borrow_id, member_id, book_id, borrow_date, return_date)
VALUES (1, 1, 1, '2025-10-10', NULL),
       (2, 2, 3, '2025-10-12', '2025-10-17');

-- Update missing author country
UPDATE Authors
SET country = 'USA'
WHERE name = 'George R.R. Martin';

-- Update book price that was NULL
UPDATE Books
SET price = 400
WHERE price IS NULL;


-- Delete member with no email and phone (incomplete record)
DELETE FROM Members
WHERE email IS NULL AND phone IS NULL;





-- Users Table
CREATE TABLE users (
    user_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR2(50),
    email VARCHAR2(50) UNIQUE,
    password VARCHAR2(50)
);

-- Books Table
CREATE TABLE books (
    book_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR2(100),
    author VARCHAR2(50),
    genre VARCHAR2(50),
    availability CHAR(1) DEFAULT 'Y' CHECK (availability IN ('Y', 'N'))
);

-- Transactions Table (Issue/Return)
CREATE TABLE transactions (
    transaction_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id NUMBER REFERENCES users(user_id),
    book_id NUMBER REFERENCES books(book_id),
    issue_date DATE DEFAULT SYSDATE,
    return_date DATE,
    fine NUMBER DEFAULT 0
);
-- Accounts Table
CREATE TABLE accounts (
    account_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR2(50),
    email VARCHAR2(50) UNIQUE,
    balance NUMBER DEFAULT 0
);

-- Transactions Table
CREATE TABLE transactions (
    transaction_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    from_account NUMBER REFERENCES accounts(account_id),
    to_account NUMBER REFERENCES accounts(account_id),
    amount NUMBER,
    transaction_date DATE DEFAULT SYSDATE
);
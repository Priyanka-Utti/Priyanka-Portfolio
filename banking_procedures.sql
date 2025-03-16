CREATE OR REPLACE PROCEDURE transfer_money (
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
) AS
    v_balance NUMBER;
BEGIN
    -- Check sender balance
    SELECT balance INTO v_balance FROM accounts WHERE account_id = p_from_account;
    
    IF v_balance >= p_amount THEN
        -- Deduct from sender
        UPDATE accounts SET balance = balance - p_amount WHERE account_id = p_from_account;
        
        -- Add to receiver
        UPDATE accounts SET balance = balance + p_amount WHERE account_id = p_to_account;
        
        -- Insert transaction record
        INSERT INTO transactions (from_account, to_account, amount) VALUES (p_from_account, p_to_account, p_amount);
        
        DBMS_OUTPUT.PUT_LINE('Transaction successful!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient funds.');
    END IF;
END;
/
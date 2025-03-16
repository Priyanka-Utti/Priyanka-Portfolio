CREATE OR REPLACE PROCEDURE issue_book (
    p_user_id IN NUMBER,
    p_book_id IN NUMBER
) AS
    v_available CHAR(1);
BEGIN
    -- Check if book is available
    SELECT availability INTO v_available FROM books WHERE book_id = p_book_id;
    
    IF v_available = 'Y' THEN
        -- Update book status
        UPDATE books SET availability = 'N' WHERE book_id = p_book_id;
        
        -- Insert transaction record
        INSERT INTO transactions (user_id, book_id) VALUES (p_user_id, p_book_id);
        
        DBMS_OUTPUT.PUT_LINE('Book issued successfully!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Book is not available.');
    END IF;
END;
/
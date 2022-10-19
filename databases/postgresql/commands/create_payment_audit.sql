CREATE TABLE payment_audit (
        payment_id INTEGER,
        customer_id INTEGER,
        amount NUMERIC(6, 2),
        payment_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
        username VARCHAR(20),
        delete_date TIMESTAMP
);
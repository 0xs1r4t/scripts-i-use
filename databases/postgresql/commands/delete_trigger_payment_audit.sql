-- function
CREATE FUNCTION audit_payment_deletes() RETURNS trigger AS $$
    BEGIN
        INSERT INTO payment_audit VALUES((OLD).*, current_user, current_timestamp);
        RETURN OLD;
    END
$$ LANGUAGE plpgsql;

-- trigger
CREATE TRIGGER audit_payment_deletes
BEFORE DELETE ON sales.payment
FOR EACH ROW
EXECUTE PROCEDURE audit_payment_deletes();
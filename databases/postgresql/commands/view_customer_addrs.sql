CREATE VIEW sales.customer_addresses AS
    SELECT c.first_name, c.last_name, a.address, ct.name AS city, s.name AS state, a.postal_code
    FROM sales.customer c
    LEFT JOIN sales.address a ON c.addr_id = a.addr_id
    LEFT JOIN sales.city ct ON a.city_id = ct.city_id
    LEFT JOIN sales.state s ON ct.state_id = s.state_id;
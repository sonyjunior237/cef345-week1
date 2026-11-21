PRAGMA foreign_keys = ON;

-- creating sales Table
CREATE TABLE sales (
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id        INTEGER NOT NULL,
    customer_id    INTEGER,
    payment_method TEXT    NOT NULL,
    total          INTEGER NOT NULL CHECK (total >= 0),
    created_at     TEXT    NOT NULL DEFAULT (datetime('now')),
    FOREIGN KEY (user_id)     REFERENCES users (id),
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);

-- creating sales_items Table
CREATE TABLE sale_items (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    sale_id    INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity   INTEGER NOT NULL CHECK (quantity > 0),
    unit_price INTEGER NOT NULL CHECK (unit_price >= 0),
    unit_cost  INTEGER NOT NULL CHECK (unit_cost >= 0),
    FOREIGN KEY (sale_id)    REFERENCES sales (id),
    FOREIGN KEY (product_id) REFERENCES products (id)
);
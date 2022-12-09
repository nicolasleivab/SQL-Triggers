CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(255) NOT NULL
);

CREATE TABLE preferences (
    greater_product_id INT NOT NULL,
    lesser_product_id INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    FOREIGN KEY (greater_product_id)
        REFERENCES products (product_id),
    FOREIGN KEY (lesser_product_id)
        REFERENCES products (product_id)
);

CREATE TABLE computed_preferences (
    greater_product_id INT NOT NULL,
    lesser_product_id INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    FOREIGN KEY (greater_product_id)
        REFERENCES products (product_id),
    FOREIGN KEY (lesser_product_id)
        REFERENCES products (product_id)
);


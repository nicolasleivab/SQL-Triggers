CREATE TABLE lockers (
    locker_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(255) NOT NULL,
    zipcode VARCHAR(255) NOT NULL,
    coordinates POINT NOT NULL
);

CREATE TABLE cells (
    cell_id INT PRIMARY KEY AUTO_INCREMENT,
    locker_id INT,
	FOREIGN KEY (locker_id)
        REFERENCES lockers (locker_id),
    total_large INT NOT NULL DEFAULT 0,
    total_small INT NOT NULL DEFAULT 0
);

CREATE TABLE parcels (
    parcel_id VARCHAR(36) PRIMARY KEY,
    cell_id INT,
	FOREIGN KEY (cell_id)
        REFERENCES cells (cell_id),
    size VARCHAR(255),
    description VARCHAR(255),
    image_url VARCHAR(255)
);


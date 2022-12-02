CREATE TABLE persons (
    Pid INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    Cid INT PRIMARY KEY AUTO_INCREMENT,
    dept VARCHAR(50) NOT NULL,
    credits TINYINT NOT NULL
);

CREATE TABLE schedules (
    Sid INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (Cid)
        REFERENCES courses (Cid),
	FOREIGN KEY (Pid)
        REFERENCES persons (Pid)
);

CREATE TABLE registrations (
    Rid INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (Cid)
        REFERENCES courses (Cid),
	FOREIGN KEY (Pid)
        REFERENCES persons (Pid)
);

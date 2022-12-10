CREATE TABLE persons (
    Pid INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    Cid INT PRIMARY KEY AUTO_INCREMENT,
    dept VARCHAR(50) NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    credits TINYINT NOT NULL
);

CREATE TABLE schedules (
    Sid INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    professor_id INT UNIQUE,
    FOREIGN KEY (course_id)
        REFERENCES courses (Cid)
        ON DELETE CASCADE,
    FOREIGN KEY (professor_id)
        REFERENCES persons (Pid)
        ON DELETE CASCADE
);

CREATE TABLE registrations (
    Rid INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    student_id INT UNIQUE,
    FOREIGN KEY (course_id)
        REFERENCES courses (Cid)
        ON DELETE CASCADE,
    FOREIGN KEY (student_id)
        REFERENCES persons (Pid)
        ON DELETE CASCADE
);


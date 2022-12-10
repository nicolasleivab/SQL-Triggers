CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    number_of_students INT NOT NULL DEFAULT 0
);

CREATE TABLE enrolled_students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    room_id INT NOT NULL,
    FOREIGN KEY (room_id)
        REFERENCES rooms (room_id)
);

INSERT INTO persons(first_name, last_name) VALUES
('Nicolas', 'Leiva'),
('John', 'Doe'),
('Carlos', 'Herrera'),
('Ahmed', 'Habib'),
('Kevin', 'Hart'),
('Will', 'Ferrel'),
('Jack', 'Sparrow'),
('Satoshi', 'Tajiri'),
('Cristoforo', 'Colombo'),
('Ted', 'Mosby');

INSERT INTO courses(course_name, dept, credits) VALUES
('Data Bases', 'CS', 10),
('Internet of Things', 'CS', 10),
('Computing Infrastructures', 'CS', 5),
('Calculus II', 'ENG', 10),
('Physics I', 'ENG', 10);

INSERT INTO registrations(course_id, student_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 1),
(3, 5),
(3, 2),
(3, 1),
(4, 2),
(4, 5),
(5, 1);

INSERT INTO schedules(course_id, professor_id) VALUES
(1, 6),
(2, 2),
(3, 3),
(4, 9),
(5, 10);


-- data.sql

USE attendance_db;

-- 1. Create Users
-- Passwords are all 'password' hashed with BCrypt
INSERT INTO users (name, email, password_hash, role) VALUES 
('Admin User', 'admin@example.com', '$2a$10$wTf3rD5d9w0e9T5d9w0e9eT5d9w0e9T5d9w0e9T5d9w0e9T5d9w', 'ADMIN'),
('Dr. Smith', 'smith@faculty.example.com', '$2a$10$wTf3rD5d9w0e9T5d9w0e9eT5d9w0e9T5d9w0e9T5d9w0e9T5d9w', 'FACULTY'),
('Prof. Jones', 'jones@faculty.example.com', '$2a$10$wTf3rD5d9w0e9T5d9w0e9eT5d9w0e9T5d9w0e9T5d9w0e9T5d9w', 'FACULTY'),
('Alice Brown', 'alice@student.example.com', '$2a$10$wTf3rD5d9w0e9T5d9w0e9eT5d9w0e9T5d9w0e9T5d9w0e9T5d9w', 'STUDENT'),
('Bob White', 'bob@student.example.com', '$2a$10$wTf3rD5d9w0e9T5d9w0e9eT5d9w0e9T5d9w0e9T5d9w0e9T5d9w', 'STUDENT'),
('Charlie Green', 'charlie@student.example.com', '$2a$10$wTf3rD5d9w0e9T5d9w0e9eT5d9w0e9T5d9w0e9T5d9w0e9T5d9w', 'STUDENT');

-- 2. Create Faculty
INSERT INTO faculty (user_id, dept) VALUES 
((SELECT id FROM users WHERE email='smith@faculty.example.com'), 'Computer Science'),
((SELECT id FROM users WHERE email='jones@faculty.example.com'), 'Information Technology');

-- 3. Create Students
INSERT INTO students (user_id, dept, year, section, roll_number) VALUES 
((SELECT id FROM users WHERE email='alice@student.example.com'), 'Computer Science', 3, 'A', 'CS101'),
((SELECT id FROM users WHERE email='bob@student.example.com'), 'Computer Science', 3, 'A', 'CS102'),
((SELECT id FROM users WHERE email='charlie@student.example.com'), 'Information Technology', 2, 'B', 'IT201');

-- 4. Create Subjects
INSERT INTO subjects (name, code, dept) VALUES 
('Database Management Systems', 'DBMS301', 'Computer Science'),
('Operating Systems', 'OS302', 'Computer Science'),
('Web Technologies', 'WT201', 'Information Technology');

-- 5. Create Classes
INSERT INTO classes (dept, year, section, subject_id, faculty_id) VALUES 
('Computer Science', 3, 'A', (SELECT id FROM subjects WHERE code='DBMS301'), (SELECT id FROM faculty WHERE user_id=(SELECT id FROM users WHERE email='smith@faculty.example.com'))),
('Computer Science', 3, 'A', (SELECT id FROM subjects WHERE code='OS302'), (SELECT id FROM faculty WHERE user_id=(SELECT id FROM users WHERE email='smith@faculty.example.com'))),
('Information Technology', 2, 'B', (SELECT id FROM subjects WHERE code='WT201'), (SELECT id FROM faculty WHERE user_id=(SELECT id FROM users WHERE email='jones@faculty.example.com')));

-- 6. Create Timetables
INSERT INTO timetables (class_id, day_of_week, period, room) VALUES 
(1, 'Monday', 1, 'Room 101'),
(1, 'Wednesday', 2, 'Room 101'),
(2, 'Tuesday', 3, 'Room 102'),
(3, 'Thursday', 1, 'Lab 1');

-- 7. Create Sample Attendance
-- Let's mark Alice and Bob for DBMS301 class on a specific date
INSERT INTO attendance (student_id, class_id, date, status) VALUES 
((SELECT id FROM students WHERE roll_number='CS101'), 1, '2026-05-10', 'PRESENT'),
((SELECT id FROM students WHERE roll_number='CS102'), 1, '2026-05-10', 'ABSENT'),
((SELECT id FROM students WHERE roll_number='CS101'), 1, '2026-05-12', 'PRESENT'),
((SELECT id FROM students WHERE roll_number='CS102'), 1, '2026-05-12', 'PRESENT');

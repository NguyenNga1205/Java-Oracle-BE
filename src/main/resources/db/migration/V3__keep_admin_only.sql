-- Remove all demo/business data; only the admin account is kept.
DELETE FROM users WHERE role <> 'ADMIN';
DELETE FROM attendance;
DELETE FROM class_sessions;
DELETE FROM weekly_schedules;
DELETE FROM student_subjects;
DELETE FROM classroom_subjects;
DELETE FROM students;
DELETE FROM classrooms;
DELETE FROM subjects;
DELETE FROM teachers;
DELETE FROM faculties;
DELETE FROM course_years;

ALTER SEQUENCE seq_course_code RESTART WITH 1;
ALTER SEQUENCE seq_faculty_code RESTART WITH 1;
ALTER SEQUENCE seq_classroom_code RESTART WITH 1;
ALTER TABLE attendance ALTER COLUMN id RESTART WITH 1;
ALTER TABLE class_sessions ALTER COLUMN id RESTART WITH 1;
ALTER TABLE weekly_schedules ALTER COLUMN id RESTART WITH 1;
ALTER TABLE student_subjects ALTER COLUMN id RESTART WITH 1;
ALTER TABLE classroom_subjects ALTER COLUMN id RESTART WITH 1;
ALTER TABLE students ALTER COLUMN id RESTART WITH 1;
ALTER TABLE classrooms ALTER COLUMN id RESTART WITH 1;
ALTER TABLE subjects ALTER COLUMN id RESTART WITH 1;
ALTER TABLE teachers ALTER COLUMN id RESTART WITH 1;
ALTER TABLE faculties ALTER COLUMN id RESTART WITH 1;
ALTER TABLE course_years ALTER COLUMN id RESTART WITH 1;

-- Demo seed data (homework project). Teacher/student/admin accounts share the demo password Demo@2026!

INSERT INTO course_years (code, name, start_year) VALUES
  ('K24', 'Khóa 2024', 2024),
  ('K25', 'Khóa 2025', 2025),
  ('K26', 'Khóa 2026', 2026)
ON CONFLICT (code) DO NOTHING;

INSERT INTO faculties (code, name, course_year_id)
SELECT v.code, v.name, cy.id FROM (VALUES
  ('CNTT', 'Công nghệ thông tin', 'K24'),
  ('QTKD', 'Quản trị kinh doanh', 'K24'),
  ('KT', 'Kế toán', 'K25'),
  ('NN', 'Ngoại ngữ', 'K25'),
  ('DL', 'Du lịch', 'K26')
) AS v(code, name, cy_code) JOIN course_years cy ON cy.code = v.cy_code
ON CONFLICT (code) DO NOTHING;

INSERT INTO classrooms (code, name, faculty_id, max_students)
SELECT v.code, v.name, f.id, 50 FROM (VALUES
  ('CNTT01', 'Công nghệ thông tin 01', 'CNTT'),
  ('CNTT02', 'Công nghệ thông tin 02', 'CNTT'),
  ('QTKD01', 'Quản trị kinh doanh 01', 'QTKD'),
  ('KT01', 'Kế toán 01', 'KT'),
  ('NN01', 'Ngoại ngữ 01', 'NN'),
  ('DL01', 'Du lịch 01', 'DL')
) AS v(code, name, f_code) JOIN faculties f ON f.code = v.f_code
ON CONFLICT (code) DO NOTHING;

INSERT INTO subjects (code, name, faculty_id)
SELECT v.code, v.name, f.id FROM (VALUES
  ('JAVA', 'Lập trình Java', 'CNTT'),
  ('CSDL', 'Cơ sở dữ liệu', 'CNTT'),
  ('WEB', 'Phát triển Web', 'CNTT'),
  ('CTDL', 'Cấu trúc dữ liệu', 'CNTT'),
  ('QT01', 'Quản trị học', 'QTKD'),
  ('MKT', 'Marketing căn bản', 'QTKD'),
  ('KTTC', 'Kế toán tài chính', 'KT'),
  ('TA01', 'Tiếng Anh cơ bản', 'NN'),
  ('TA02', 'Tiếng Anh giao tiếp', 'NN'),
  ('DL01', 'Tổng quan du lịch', 'DL')
) AS v(code, name, f_code) JOIN faculties f ON f.code = v.f_code
ON CONFLICT (code) DO NOTHING;

INSERT INTO teachers (code, full_name, email, faculty_id)
SELECT v.code, v.full_name, v.email, f.id FROM (VALUES
  ('GV001', 'Nguyễn Văn An', 'an.gv@example.com', 'CNTT'),
  ('GV002', 'Trần Thị Bình', 'binh.gv@example.com', 'CNTT'),
  ('GV003', 'Lê Minh Cường', 'cuong.gv@example.com', 'QTKD'),
  ('GV004', 'Phạm Thu Dung', 'dung.gv@example.com', 'KT'),
  ('GV005', 'Hoàng Quốc Huy', 'huy.gv@example.com', 'NN'),
  ('GV006', 'Vũ Thị Lan', 'lan.gv@example.com', 'DL'),
  ('GV007', 'Đỗ Thanh Nam', 'nam.gv@example.com', 'CNTT'),
  ('GV008', 'Bùi Mai Phương', 'phuong.gv@example.com', 'QTKD')
) AS v(code, full_name, email, f_code) JOIN faculties f ON f.code = v.f_code
ON CONFLICT (code) DO NOTHING;

INSERT INTO students (code, full_name, date_of_birth, gender, email, phone, status, classroom_id)
SELECT v.code, v.full_name, v.dob::date, v.gender, v.email, v.phone, v.status, c.id FROM (VALUES
  ('SV001', 'Nguyễn Tấn Minh', '2004-02-11', 'MALE', 'sv001@example.com', '0900000001', 'STUDYING', 'CNTT01'),
  ('SV002', 'Trần Quốc Bảo', '2005-03-12', 'FEMALE', 'sv002@example.com', '0900000002', 'STUDYING', 'CNTT02'),
  ('SV003', 'Lê Ngọc Anh', '2006-04-13', 'MALE', 'sv003@example.com', '0900000003', 'STUDYING', 'QTKD01'),
  ('SV004', 'Phạm Gia Huy', '2003-05-14', 'FEMALE', 'sv004@example.com', '0900000004', 'STUDYING', 'KT01'),
  ('SV005', 'Hoàng Thị Mai', '2004-06-15', 'MALE', 'sv005@example.com', '0900000005', 'STUDYING', 'NN01'),
  ('SV006', 'Võ Minh Khang', '2005-07-16', 'FEMALE', 'sv006@example.com', '0900000006', 'STUDYING', 'DL01'),
  ('SV007', 'Đặng Thảo Vy', '2006-08-17', 'MALE', 'sv007@example.com', '0900000007', 'STUDYING', 'CNTT01'),
  ('SV008', 'Bùi Thanh Tùng', '2003-01-18', 'FEMALE', 'sv008@example.com', '0900000008', 'STUDYING', 'CNTT02'),
  ('SV009', 'Nguyễn Hà Linh', '2004-02-19', 'MALE', 'sv009@example.com', '0900000009', 'STUDYING', 'QTKD01'),
  ('SV010', 'Trịnh Đức Anh', '2005-03-20', 'FEMALE', 'sv010@example.com', '0900000010', 'STUDYING', 'KT01'),
  ('SV011', 'Lê Thị Hoa', '2006-04-21', 'MALE', 'sv011@example.com', '0900000011', 'STUDYING', 'NN01'),
  ('SV012', 'Phan Tuấn Kiệt', '2003-05-22', 'FEMALE', 'sv012@example.com', '0900000012', 'STUDYING', 'DL01'),
  ('SV013', 'Trần Minh Châu', '2004-06-23', 'MALE', 'sv013@example.com', '0900000013', 'STUDYING', 'CNTT01'),
  ('SV014', 'Đỗ Khánh Ngọc', '2005-07-24', 'FEMALE', 'sv014@example.com', '0900000014', 'STUDYING', 'CNTT02'),
  ('SV015', 'Huỳnh Quốc Việt', '2006-08-25', 'MALE', 'sv015@example.com', '0900000015', 'STUDYING', 'QTKD01'),
  ('SV016', 'Nguyễn Thanh Trúc', '2003-01-26', 'FEMALE', 'sv016@example.com', '0900000016', 'STUDYING', 'KT01'),
  ('SV017', 'Phạm Nhật Long', '2004-02-27', 'MALE', 'sv017@example.com', '0900000017', 'STUDYING', 'NN01'),
  ('SV018', 'Vũ Hải Yến', '2005-03-10', 'FEMALE', 'sv018@example.com', '0900000018', 'STUDYING', 'DL01'),
  ('SV019', 'Mai Anh Tuấn', '2006-04-11', 'MALE', 'sv019@example.com', '0900000019', 'STUDYING', 'CNTT01'),
  ('SV020', 'Lý Bảo Ngọc', '2003-05-12', 'FEMALE', 'sv020@example.com', '0900000020', 'GRADUATED', 'CNTT02')
) AS v(code, full_name, dob, gender, email, phone, status, c_code) JOIN classrooms c ON c.code = v.c_code
ON CONFLICT (code) DO NOTHING;

INSERT INTO classroom_subjects (classroom_id, subject_id, teacher_id)
SELECT c.id, su.id, t.id FROM (VALUES
  ('CNTT01', 'JAVA', 'GV001'),
  ('CNTT01', 'CSDL', 'GV002'),
  ('CNTT02', 'WEB', 'GV007'),
  ('CNTT02', 'CTDL', 'GV001'),
  ('QTKD01', 'QT01', 'GV003'),
  ('QTKD01', 'MKT', 'GV008'),
  ('KT01', 'KTTC', 'GV004'),
  ('NN01', 'TA01', 'GV005'),
  ('NN01', 'TA02', 'GV005'),
  ('DL01', 'DL01', 'GV006')
) AS v(c_code, s_code, t_code)
JOIN classrooms c ON c.code = v.c_code JOIN subjects su ON su.code = v.s_code JOIN teachers t ON t.code = v.t_code
ON CONFLICT (classroom_id, subject_id) DO NOTHING;

INSERT INTO student_subjects (student_id, classroom_id, classroom_subject_id)
SELECT st.id, st.classroom_id, cs.id FROM (VALUES
  ('SV001', 'JAVA'),
  ('SV007', 'JAVA'),
  ('SV013', 'CSDL'),
  ('SV019', 'JAVA'),
  ('SV002', 'WEB'),
  ('SV008', 'CTDL'),
  ('SV003', 'QT01'),
  ('SV009', 'MKT'),
  ('SV004', 'KTTC'),
  ('SV010', 'KTTC'),
  ('SV005', 'TA01'),
  ('SV011', 'TA02'),
  ('SV006', 'DL01'),
  ('SV012', 'DL01')
) AS v(st_code, s_code)
JOIN students st ON st.code = v.st_code
JOIN subjects su ON su.code = v.s_code
JOIN classroom_subjects cs ON cs.classroom_id = st.classroom_id AND cs.subject_id = su.id
ON CONFLICT (student_id, classroom_subject_id) DO NOTHING;

INSERT INTO users (username, password_hash, role, enabled) VALUES ('admin', '$2y$10$2R92odDlMAogcBkCVZDU2Ou1f3i5.qCodQZlWHdPKAuq4DGtB5E9S', 'ADMIN', 1)
ON CONFLICT (username) DO NOTHING;

INSERT INTO users (username, password_hash, role, enabled, teacher_id)
SELECT v.username, '$2y$10$2R92odDlMAogcBkCVZDU2Ou1f3i5.qCodQZlWHdPKAuq4DGtB5E9S', 'TEACHER', 1, x.id FROM (VALUES
  ('teacher01', 'GV001'),
  ('teacher02', 'GV002'),
  ('teacher03', 'GV003'),
  ('teacher04', 'GV004'),
  ('teacher05', 'GV005'),
  ('teacher06', 'GV006'),
  ('teacher07', 'GV007'),
  ('teacher08', 'GV008')
) AS v(username, code) JOIN teachers x ON x.code = v.code
ON CONFLICT (username) DO NOTHING;

INSERT INTO users (username, password_hash, role, enabled, student_id)
SELECT v.username, '$2y$10$2R92odDlMAogcBkCVZDU2Ou1f3i5.qCodQZlWHdPKAuq4DGtB5E9S', 'STUDENT', 1, x.id FROM (VALUES
  ('student01', 'SV001'),
  ('student02', 'SV002'),
  ('student03', 'SV003'),
  ('student04', 'SV004'),
  ('student05', 'SV005'),
  ('student06', 'SV006'),
  ('student07', 'SV007'),
  ('student08', 'SV008'),
  ('student09', 'SV009'),
  ('student10', 'SV010'),
  ('student11', 'SV011'),
  ('student12', 'SV012'),
  ('student13', 'SV013'),
  ('student14', 'SV014'),
  ('student15', 'SV015'),
  ('student16', 'SV016'),
  ('student17', 'SV017'),
  ('student18', 'SV018'),
  ('student19', 'SV019'),
  ('student20', 'SV020')
) AS v(username, code) JOIN students x ON x.code = v.code
ON CONFLICT (username) DO NOTHING;

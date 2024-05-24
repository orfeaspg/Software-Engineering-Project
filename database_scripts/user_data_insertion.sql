INSERT INTO roles (role_id, name, label) VALUES
(1, 'user', 'User'),
(2, 'admin', 'Administrator'),
(3, 'moderator', 'Moderator'),
(4, 'therapist', 'Therapist'),
(5, 'volunteer', 'Volunteer');

INSERT INTO user (id, username, password, email, role_id, timestamps) VALUES
(1, 'Akis', 'akis1', 'akis@example.com', 2, NOW()),
(2, 'Elena', 'elena1', 'elena@example.com', 2, NOW()),
(3, 'Iro', 'iro1', 'iro@example.com', 2, NOW()),
(4, 'Orfeas', 'orfeas1', 'orfeas@example.com', 2, NOW()),
(5, 'Thomas', 'thomas1', 'thomas@example.com', 2, NOW());

INSERT INTO user (id, username, password, email, role_id, timestamps) VALUES
(6, 'Chris', 'password1', 'chris@example.com', 1, NOW()),
(7, 'Sia', 'password1', 'sia@example.com', 3, NOW()),
(8, 'Bob', 'password1', 'bob@example.com', 4, NOW()),
(9, 'Mary', 'password1', 'mary@example.com', 5, NOW());

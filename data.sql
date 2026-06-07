TRUNCATE TABLE Match, Team, Venue RESTART IDENTITY CASCADE;

-- =========================
-- TEAMS
-- =========================

INSERT INTO Team (team_id, country_name, country_code, group_name)
VALUES
-- Group A
(1, 'Mexico', 'MEX', 'A'),
(2, 'South Africa', 'RSA', 'A'),
(3, 'Korea Republic', 'KOR', 'A'),
(4, 'Czechia', 'CZE', 'A'),

-- Group B
(5, 'Canada', 'CAN', 'B'),
(6, 'Bosnia and Herzegovina', 'BIH', 'B'),
(7, 'Qatar', 'QAT', 'B'),
(8, 'Switzerland', 'SUI', 'B'),

-- Group C
(9, 'Brazil', 'BRA', 'C'),
(10, 'Morocco', 'MAR', 'C'),
(11, 'Haiti', 'HAI', 'C'),
(12, 'Scotland', 'SCO', 'C'),

-- Group D
(13, 'USA', 'USA', 'D'),
(14, 'Paraguay', 'PAR', 'D'),
(15, 'Australia', 'AUS', 'D'),
(16, 'Turkey', 'TUR', 'D'),

-- Group E
(17, 'Germany', 'GER', 'E'),
(18, 'Curaçao', 'CUW', 'E'),
(19, 'Côte d’Ivoire', 'CIV', 'E'),
(20, 'Ecuador', 'ECU', 'E'),

-- Group F
(21, 'Netherlands', 'NED', 'F'),
(22, 'Japan', 'JPN', 'F'),
(23, 'Sweden', 'SWE', 'F'),
(24, 'Tunisia', 'TUN', 'F'),

-- Group G
(25, 'Belgium', 'BEL', 'G'),
(26, 'Egypt', 'EGY', 'G'),
(27, 'IR Iran', 'IRN', 'G'),
(28, 'New Zealand', 'NZL', 'G'),

-- Group H
(29, 'Spain', 'ESP', 'H'),
(30, 'Cabo Verde', 'CPV', 'H'),
(31, 'Saudi Arabia', 'KSA', 'H'),
(32, 'Uruguay', 'URU', 'H'),

-- Group I
(33, 'France', 'FRA', 'I'),
(34, 'Senegal', 'SEN', 'I'),
(35, 'Iraq', 'IRQ', 'I'),
(36, 'Norway', 'NOR', 'I'),

-- Group J
(37, 'Argentina', 'ARG', 'J'),
(38, 'Algeria', 'ALG', 'J'),
(39, 'Austria', 'AUT', 'J'),
(40, 'Jordan', 'JOR', 'J'),

-- Group K
(41, 'Portugal', 'POR', 'K'),
(42, 'Congo DR', 'COD', 'K'),
(43, 'Uzbekistan', 'UZB', 'K'),
(44, 'Colombia', 'COL', 'K'),

-- Group L
(45, 'England', 'ENG', 'L'),
(46, 'Croatia', 'CRO', 'L'),
(47, 'Ghana', 'GHA', 'L'),
(48, 'Panama', 'PAN', 'L');


-- =========================
-- VENUES
-- =========================

INSERT INTO Venue (venue_id, city_name, region)
VALUES
(1, 'Mexico City', 'Central'),
(2, 'Guadalajara', 'Central'),
(3, 'Monterrey', 'Central'),
(4, 'Toronto', 'Eastern'),
(5, 'Vancouver', 'Western'),
(6, 'San Francisco Bay Area', 'Western'),
(7, 'Los Angeles', 'Western'),
(8, 'Houston', 'Central'),
(9, 'Dallas', 'Central'),
(10, 'Atlanta', 'Eastern'),
(11, 'Miami', 'Eastern'),
(12, 'Boston', 'Eastern'),
(13, 'Kansas City', 'Central'),
(14, 'Seattle', 'Western'),
(15, 'Philadelphia', 'Eastern'),
(16, 'New York New Jersey', 'Eastern');


-- =========================
-- MATCHES - GROUP STAGE
-- =========================

INSERT INTO Match (
    match_id, match_date, match_time, stage,
    home_score, away_score,
    home_team_id, away_team_id, venue_id
)
VALUES
-- Group A
(1,  '2026-06-11', '15:00', 'Group Stage', NULL, NULL, 1, 2, 1),
(2,  '2026-06-12', '22:00', 'Group Stage', NULL, NULL, 3, 4, 2),
(25, '2026-06-17', '12:00', 'Group Stage', NULL, NULL, 4, 2, 10),
(28, '2026-06-18', '21:00', 'Group Stage', NULL, NULL, 1, 3, 2),
(53, '2026-06-24', '21:00', 'Group Stage', NULL, NULL, 4, 1, 1),
(54, '2026-06-24', '21:00', 'Group Stage', NULL, NULL, 2, 3, 3),

-- Group B
(3,  '2026-06-12', '15:00', 'Group Stage', NULL, NULL, 5, 6, 4),
(8,  '2026-06-13', '15:00', 'Group Stage', NULL, NULL, 7, 8, 6),
(26, '2026-06-17', '15:00', 'Group Stage', NULL, NULL, 8, 6, 7),
(27, '2026-06-18', '18:00', 'Group Stage', NULL, NULL, 5, 7, 5),
(51, '2026-06-24', '15:00', 'Group Stage', NULL, NULL, 8, 5, 5),
(52, '2026-06-24', '15:00', 'Group Stage', NULL, NULL, 6, 7, 14),

-- Group C
(5,  '2026-06-13', '21:00', 'Group Stage', NULL, NULL, 11, 12, 12),
(7,  '2026-06-13', '18:00', 'Group Stage', NULL, NULL, 9, 10, 16),
(29, '2026-06-19', '21:00', 'Group Stage', NULL, NULL, 9, 11, 15),
(30, '2026-06-19', '18:00', 'Group Stage', NULL, NULL, 12, 10, 12),
(49, '2026-06-24', '18:00', 'Group Stage', NULL, NULL, 12, 9, 11),
(50, '2026-06-24', '18:00', 'Group Stage', NULL, NULL, 10, 11, 10),

-- Group D
(4,  '2026-06-12', '21:00', 'Group Stage', NULL, NULL, 13, 14, 7),
(6,  '2026-06-13', '00:00', 'Group Stage', NULL, NULL, 15, 16, 5),
(31, '2026-06-19', '00:00', 'Group Stage', NULL, NULL, 16, 14, 6),
(32, '2026-06-19', '15:00', 'Group Stage', NULL, NULL, 13, 15, 14),
(59, '2026-06-25', '22:00', 'Group Stage', NULL, NULL, 16, 13, 7),
(60, '2026-06-25', '22:00', 'Group Stage', NULL, NULL, 14, 15, 6),

-- Group E
(9,  '2026-06-14', '19:00', 'Group Stage', NULL, NULL, 19, 20, 15),
(10, '2026-06-14', '13:00', 'Group Stage', NULL, NULL, 17, 18, 8),
(33, '2026-06-20', '16:00', 'Group Stage', NULL, NULL, 17, 19, 4),
(34, '2026-06-20', '20:00', 'Group Stage', NULL, NULL, 20, 18, 13),
(55, '2026-06-25', '16:00', 'Group Stage', NULL, NULL, 18, 19, 15),
(56, '2026-06-25', '16:00', 'Group Stage', NULL, NULL, 20, 17, 16),

-- Group F
(11, '2026-06-14', '16:00', 'Group Stage', NULL, NULL, 21, 22, 9),
(12, '2026-06-14', '22:00', 'Group Stage', NULL, NULL, 23, 24, 3),
(35, '2026-06-20', '13:00', 'Group Stage', NULL, NULL, 21, 23, 8),
(36, '2026-06-20', '00:00', 'Group Stage', NULL, NULL, 24, 22, 3),
(57, '2026-06-25', '19:00', 'Group Stage', NULL, NULL, 22, 23, 9),
(58, '2026-06-25', '19:00', 'Group Stage', NULL, NULL, 24, 21, 13),

-- Group G
(15, '2026-06-15', '21:00', 'Group Stage', NULL, NULL, 27, 28, 7),
(16, '2026-06-15', '15:00', 'Group Stage', NULL, NULL, 25, 26, 14),
(39, '2026-06-20', '15:00', 'Group Stage', NULL, NULL, 25, 27, 7),
(40, '2026-06-20', '21:00', 'Group Stage', NULL, NULL, 28, 26, 5),
(63, '2026-06-24', '23:00', 'Group Stage', NULL, NULL, 26, 27, 14),
(64, '2026-06-24', '23:00', 'Group Stage', NULL, NULL, 28, 25, 5),

-- Group H
(13, '2026-06-15', '18:00', 'Group Stage', NULL, NULL, 31, 32, 11),
(14, '2026-06-15', '12:00', 'Group Stage', NULL, NULL, 29, 30, 10),
(37, '2026-06-19', '18:00', 'Group Stage', NULL, NULL, 32, 30, 11),
(38, '2026-06-19', '12:00', 'Group Stage', NULL, NULL, 29, 31, 10),
(65, '2026-06-24', '20:00', 'Group Stage', NULL, NULL, 30, 31, 8),
(66, '2026-06-24', '20:00', 'Group Stage', NULL, NULL, 32, 29, 2),

-- Group I
(17, '2026-06-16', '15:00', 'Group Stage', NULL, NULL, 33, 34, 16),
(18, '2026-06-16', '18:00', 'Group Stage', NULL, NULL, 35, 36, 12),
(41, '2026-06-20', '20:00', 'Group Stage', NULL, NULL, 36, 34, 16),
(42, '2026-06-20', '17:00', 'Group Stage', NULL, NULL, 33, 35, 15),
(61, '2026-06-24', '15:00', 'Group Stage', NULL, NULL, 36, 33, 12),
(62, '2026-06-24', '15:00', 'Group Stage', NULL, NULL, 34, 35, 4),

-- Group J
(19, '2026-06-16', '21:00', 'Group Stage', NULL, NULL, 37, 38, 13),
(20, '2026-06-16', '00:00', 'Group Stage', NULL, NULL, 39, 40, 6),
(43, '2026-06-20', '13:00', 'Group Stage', NULL, NULL, 37, 39, 9),
(44, '2026-06-20', '23:00', 'Group Stage', NULL, NULL, 40, 38, 6),
(69, '2026-06-25', '22:00', 'Group Stage', NULL, NULL, 38, 39, 13),
(70, '2026-06-25', '22:00', 'Group Stage', NULL, NULL, 40, 37, 9),

-- Group K
(23, '2026-06-17', '13:00', 'Group Stage', NULL, NULL, 41, 42, 8),
(24, '2026-06-17', '22:00', 'Group Stage', NULL, NULL, 43, 44, 1),
(47, '2026-06-21', '13:00', 'Group Stage', NULL, NULL, 41, 43, 8),
(48, '2026-06-21', '22:00', 'Group Stage', NULL, NULL, 44, 42, 2),
(71, '2026-06-25', '19:30', 'Group Stage', NULL, NULL, 44, 41, 11),
(72, '2026-06-25', '19:30', 'Group Stage', NULL, NULL, 42, 43, 10),

-- Group L
(21, '2026-06-17', '19:00', 'Group Stage', NULL, NULL, 47, 48, 4),
(22, '2026-06-17', '16:00', 'Group Stage', NULL, NULL, 45, 46, 9),
(45, '2026-06-21', '16:00', 'Group Stage', NULL, NULL, 45, 47, 12),
(46, '2026-06-21', '19:00', 'Group Stage', NULL, NULL, 48, 46, 4),
(67, '2026-06-25', '17:00', 'Group Stage', NULL, NULL, 48, 45, 16),
(68, '2026-06-25', '17:00', 'Group Stage', NULL, NULL, 46, 47, 15);


-- Reset serial sequences so future inserts continue correctly
SELECT setval(pg_get_serial_sequence('Team', 'team_id'), (SELECT MAX(team_id) FROM Team));
SELECT setval(pg_get_serial_sequence('Venue', 'venue_id'), (SELECT MAX(venue_id) FROM Venue));
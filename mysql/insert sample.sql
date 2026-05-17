USE Voting_System;

-- sample data for REGION
INSERT INTO region (region_code, region_name) VALUES
(1, 'Addis Ababa'),
(2, 'Oromia'),
(3, 'Amhara');

-- sample data for PARTY
INSERT INTO party (party_name, abbreviation, registration_number, symbol_url, description) VALUES
('Prosperity Party', 'PP', 'REG001', 'pp.png', 'Ruling party'),
('Unity Party', 'UP', 'REG002', 'up.png', 'Opposition party');

-- sample data for POLLING STATION 
INSERT INTO polling_station (station_name, station_code, address, latitude, longitude, region_code) VALUES
('Bole Station', 'BOL001', 'Bole Road', 8.9806, 38.7578, 1),
('Piassa Station', 'PIA001', 'Piassa Area', 9.0333, 38.7500, 1),
('Adama Station', 'ADA001', 'Adama City Center', 8.5400, 39.2700, 2);

-- sample data for ADMIN 

INSERT INTO admin (full_name, email, created_at, username, password_hash, role, last_login) VALUES
('Abebe Kebede', 'abebe@gmail.com', '2025-01-01', 'abebe', 'hash123', 'manager', '2025-05-01');

-- VOTER sample data 
INSERT INTO voter (full_name, date_of_birth, gender, address, national_id, phone_number, email, status, registered_at, region_code) VALUES
('Abel Tesfaye', '2000-01-01', 'Male', 'Bole', 'NID001', '0911111111', 'abel@gmail.com', 'active', '2025-01-10', 1),
('Kidus Haile', '1999-05-12', 'Male', 'Piassa', 'NID002', '0922222222', 'kidus@gmail.com', 'active', '2025-01-11', 2),
('Arsema T', '2001-07-20', 'Female', 'Kazanchis', 'NID003', '0933333333', 'arsema@gmail.com', 'active', '2025-01-12', 1);

-- sample data for CANDIDATE

INSERT INTO candidate (candidate_name, date_of_birth, gender, address, photo_url, status, party_id) VALUES
('Hana M', '1985-03-10', 'Female', 'Addis Ababa', 'hana.jpg', 'active', 1),
('Samuel K', '1980-06-15', 'Male', 'Oromia', 'samuel.jpg', 'active', 2);
-- sample data for VOTE table
INSERT INTO vote (voter_id, candidate_id, polling_station_id, vote_date, is_valid) VALUES
(1, 1, 1, '2025-06-01', TRUE),
(2, 1, 1, '2025-06-01', TRUE),
(3, 2, 2, '2025-06-01', TRUE);
CREATE DATABASE Voting_System;
USE Voting_System;
CREATE TABLE region (
    region_code INT PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL
);
CREATE TABLE voter (
    voter_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) not null,
    date_of_birth DATE,
    gender VARCHAR(10),
    address VARCHAR(255),
    national_id VARCHAR(50) UNIQUE,
    phone_number VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    status VARCHAR(20) DEFAULT 'active',
    registered_at DATE,
    region_code INT,
    FOREIGN KEY (region_code) REFERENCES region(region_code)
);
CREATE TABLE party (
    party_id INT PRIMARY KEY AUTO_INCREMENT,
    party_name VARCHAR(100),
    abbreviation VARCHAR(20),
    registration_number VARCHAR(50) UNIQUE,
    symbol_url VARCHAR(255),
    description TEXT
);
CREATE TABLE polling_station (
    polling_station_id INT PRIMARY KEY AUTO_INCREMENT,
    station_name VARCHAR(100),
    station_code VARCHAR(50) UNIQUE,
    address VARCHAR(255),
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    region_code INT,
    FOREIGN KEY (region_code) REFERENCES region(region_code)
);
CREATE TABLE candidate (
    candidate_id INT PRIMARY KEY AUTO_INCREMENT,
    candidate_name VARCHAR(100) not null,
    date_of_birth DATE,
    gender VARCHAR(10),
    address VARCHAR(255),
    photo_url VARCHAR(255),
   status VARCHAR(20) DEFAULT 'active',
    party_id INT,
    FOREIGN KEY (party_id) REFERENCES party(party_id)
);
CREATE TABLE vote (
    vote_id INT PRIMARY KEY AUTO_INCREMENT,
   voter_id INT UNIQUE,
    candidate_id INT,
    polling_station_id INT,
    vote_date DATE,
    is_valid BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (voter_id) REFERENCES voter(voter_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(candidate_id),
    FOREIGN KEY (polling_station_id) REFERENCES polling_station(polling_station_id)
);
CREATE TABLE admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) not null,
    email VARCHAR(100) UNIQUE,
    created_at DATE,
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    role VARCHAR(50),
    last_login DATE
);
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
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

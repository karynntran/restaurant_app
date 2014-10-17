CREATE DATABASE restaurant_db;

\c restaurant_db;

CREATE TABLE foods (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  cuisine VARCHAR(100),
  price INTEGER
);

CREATE TABLE parties (
  id SERIAL PRIMARY KEY,
  party_name VARCHAR(100),
  guest_num INTEGER,
  paid BOOLEAN
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  party_id INTEGER,
  food_id INTEGER,
  free BOOLEAN
);


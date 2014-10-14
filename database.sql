CREATE DATABASE restaurant_app;

\c food_db;

CREATE TABLE foods (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  cuisine VARCHAR(100),
  price INTEGER,
  allergens VARCHAR(255)
);

CREATE TABLE parties (
  id SERIAL PRIMARY KEY,
  party_name VARCHAR(100),
  guest_num INTEGER,
  paid VARCHAR(100)
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  parties_id INTEGER,
  foods_id INTEGER
);


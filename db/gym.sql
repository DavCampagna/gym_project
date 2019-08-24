DROP TABLE bookings;
DROP TABLE classes;
DROP TABLE members;

CREATE TABLE classes(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  capacity INT4,
  time_slot VARCHAR(255)
);

CREATE TABLE members(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE bookings(
  id SERIAL8 primary key,
  class_id INT8 references classes(id),
  member_id INT8 references members(id)
);

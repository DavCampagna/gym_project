DROP TABLE bookings;
DROP TABLE gym_classes;
DROP TABLE members;

CREATE TABLE gym_classes(
  id SERIAL8 primary key,
  name VARCHAR(255),
  capacity INT2,
  time_slot VARCHAR(255)
);

CREATE TABLE members(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE bookings(
  id SERIAL8 primary key,
  gym_class_id INT8 references gym_classes(id),
  member_id INT8 references members(id)
);

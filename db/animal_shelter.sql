DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  home_check BOOLEAN,
  address VARCHAR(255),
  phone_number VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  health_check BOOLEAN,
  behaviour_check BOOLEAN,
  admission_date VARCHAR(255),
  owners_id INT4 REFERENCES owners(id)
);

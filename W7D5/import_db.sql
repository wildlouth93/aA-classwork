DROP TABLE cats; 
DROP TABLE toys; 
DROP TABLE cattoys; 

CREATE TABLE cats
(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(255) NOT NULL, 
  color VARCHAR(255) NOT NULL, 
  breed VARCHAR(255) NOT NULL
); 

CREATE TABLE toys
(
  id SERIAL PRIMARY KEY, 
  name VARCHAR(255) NOT NULL, 
  price INTEGER NOT NULL, 
  color VARCHAR(255) NOT NULL
);

CREATE TABLE cattoys 
(
  id SERIAL PRIMARY KEY, 
  cat_id INTEGER NOT NULL, 
  toy_id INTEGER NOT NULL, 
  FOREIGN KEY (cat_id) REFERENCES cats(id), 
  FOREIGN KEY (toy_id) REFERENCES toys(id)
); 

INSERT INTO 
  cats(name, color, breed) 
VALUES 
  ('Bob', 'red', 'British Shorthair'), 
  ('Jim', 'white', 'Raas'),
  ('Joe', 'red', 'Lykoi'),
  ('Jon', 'black', 'Chausie'),
  ('AJ', 'green', 'Cyprus'); 

INSERT INTO 
  toys(name, price, color)
VALUES 
  ('fake mouse', 5, 'brown'),
  ('yarn', 2, 'yellow'),
  ('ball', 4, 'blue'),
  ('feather', 3, 'white'),
  ('laser pointer', 6, 'red'); 

INSERT INTO 
  cattoys(cat_id, toy_id)
VALUES
  ((SELECT id 
  FROM cats 
  WHERE name = 'Bob'), 
  (SELECT id 
  FROM toys 
  WHERE name = 'fake mouse')), 
  
  ((SELECT id
  FROM cats
  WHERE name = 'Jim'),
  (SELECT id
  FROM toys
  WHERE name = 'yarn')),
  
  ((SELECT id
  FROM cats
  WHERE name = 'Joe'),
  (SELECT id
  FROM toys
  WHERE name = 'ball')),

  ((SELECT id
  FROM cats
  WHERE name = 'Jon'),
  (SELECT id
  FROM toys
  WHERE name = 'feather')),

  ((SELECT id
  FROM cats
  WHERE name = 'AJ'),
  (SELECT id
  FROM toys
  WHERE name = 'laser pointer')); 

  
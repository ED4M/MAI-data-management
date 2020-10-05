CREATE SCHEMA IF NOT EXISTS HW1;

DROP TABLE IF EXISTS HW1.FILMS, HW1.PERSONS, HW1.PERSONS2CONTENT;

CREATE TABLE IF NOT EXISTS HW1.FILMS(
  TITLE VARCHAR (50) NOT NULL,
  ID INT NOT NULL,
  COUNTRY TEXT,
  BOX_OFFICE BIGINT,
  RELEASE_DATE DATE,
  PRIMARY KEY (ID)
);
CREATE TABLE IF NOT EXISTS HW1.PERSONS(
  ID INT REFERENCES FILMS(ID),
  FIO VARCHAR (25)
);
CREATE TABLE IF NOT EXISTS  HW1.PERSONS2CONTENT(
  PERSON_ID INT NOT NULL,
  FILM_ID INT,
  PERSON_TYPE VARCHAR (25)
);

 INSERT INTO DZ1.FILMS (TITLE, ID, COUNTRY, BOX_OFFICE, RELEASE_DATE) VALUES
  ('Начало', 1, 'США, Великобритания', 882332032, 'Jul 8,2010'),
  ('Маяк', 2, 'Канада, США', 4000000, 'May 19,2019'),
  ('Интерстеллар', 3, 'США, Великобритания, Канада', 677463813, 'Oct 26,2014'),
  ('Иллюзия обмана', 4, 'США, Франция', 351723989, 'May 21,2013'),
  ('Остров проклятых', 5, 'США', 294804195, 'Feb 13,2010');
    
INSERT INTO DZ1.PERSONS ( ID,  FIO)  VALUES 
  ( 1, 'Нолан Кристофер'), 
  ( 2, 'Роберт Эггерс'), 
  ( 3, 'Ханс Циммер'), 
  ( 4, 'Вуди Харрельсон'), 
  ( 5, 'Мартин Скорсезе');
  
INSERT INTO DZ1.PERSONS2CONTENT (  PERSON_ID, FILM_ID, PERSON_TYPE) VALUES 
(1, 1, 'Режиссёр'), 
(2, 2, 'Режиссёр'), 
(3, 3, 'Композитор'), 
(4, 4, 'Актёр'), 
(5, 5, 'Режиссёр');

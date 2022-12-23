/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8.0);
INSERT INTO animals VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals VALUES (4, 'Devimon', '2017-05-12', 5, true, 11.00);
INSERT INTO animals VALUES (5, 'Charmander', '08-02-2020', 0, false, -11);
INSERT INTO animals VALUES (6, 'Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals VALUES (7, 'Squirtle', '02-04-1993', 3, false, -12.13);
INSERT INTO animals VALUES (8, 'Angemon', '12-06-2005', 1, true, -45);
INSERT INTO animals VALUES (9, 'Boarmon', '07-06-2005', 7, true, 20.4);
INSERT INTO animals VALUES (10, 'Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals VALUES (11, 'Ditto', '2022-05-14', 4, true, 22);

-- Insert the following data into the owners table: 
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Insert the following data into the species table:
INSERT INTO species (name)
VALUES ('Pokemon'),
('Digimon');

-- Modify your inserted animals so it includes the species_id value:
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

-- Modify your inserted animals to include owner information (owner_id): 
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';

-- Data for vets (multiple tables)
INSERT INTO vets(
	name, age, date_of_graduation)
	VALUES ('William Tatcher', 45, '2000-04-23'),
	('Maisy Smith', 26, '2019-01-17'),
	('Stephanie Mendez', 64, '1981-05-04'),
	('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (species_id, vets_id)
	VALUES (1, 1),
	(2, 3),
	(1, 3),
	(2, 4);

INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES (1, 1, '2020-05-24'),
	(1, 3, '2020-06-22'),
	(2, 4, '2021-02-02'),
	(3, 2, '2020-01-05'),
	(3, 2, '2020-03-24'),
	(3, 2, '2020-03-14'),
	(4, 3, '2021-05-04'),
	(5, 4, '2021-02-24'),
	(6, 2, '2019-12-21'),
	(6, 1, '2020-08-10'),
	(6, 2, '2021-04-07'),
	(7, 3, '2019-09-29'),
	(8, 4, '2020-10-03'),
	(8, 4, '2020-11-04'),
	(9, 2, '2019-01-24'),
	(9, 2, '2019-05-15'),
	(9, 2, '2020-02-27'),
	(9, 2, '2020-08-03'),
	(10, 3, '2020-05-24'),
	(10, 1, '2021-01-11');

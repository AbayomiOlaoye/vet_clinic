/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth  BETWEEN '2016-01-01' and '2019-12-31';
SELECT name from ANIMALS WHERE neutered=true and escape_attempts<3;
select date_of_birth from animals where name='Agumon' or name='Pikachu';
select (name, escape_attempts) from animals where weight_kg>10.5;
select * from animals where neutered=true;
select * from animals WHERE NOT name='Gabumon';
select * from animals where weight_kg>=10.4 and weight_kg<=17.3;

-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. 
BEGIN;
UPDATE animals 
SET species = 'unspecified';
ROLLBACK;
SELECT * FROM animals;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE animals 
SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals;

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
BEGIN;
UPDATE animals 
SET species = 'pokemon' WHERE species IS null;
COMMIT;
SELECT * FROM animals;

--  Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals
WHERE date_of_birth >= '01-01-2022';

-- Create Savepoint
SAVEPOINT del_greater_than_2022;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint
ROLLBACK TO SAVEPOINT del_greater_than_2022;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals
WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT name FROM animals 
WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals)
GROUP BY name;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

-- What animals belong to Melody Pond?
SELECT anime.name FROM animals as anime
INNER JOIN owners as owned
ON anime.owner_id = owner_id
WHERE owned.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT anime.name FROM animals AS anime
JOIN species AS spec
ON anime.species_id = spec.id
WHERE spec.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT anime.name, owned.full_name FROM animals AS anime
RIGHT JOIN owners AS owned
ON anime.owner_id = owned.id;

-- How many animals are there per species?
SELECT COUNT(*) as pokemons FROM animals AS anime
JOIN species AS spec
ON anime.species_id = spec.id
WHERE spec.name = 'Pokemon';

SELECT COUNT(*) as digimons FROM animals AS anime
JOIN species AS spec
ON anime.species_id = spec.id
WHERE spec.name = 'Digimon';

-- List all Digimon owned by Jennifer Orwell.
SELECT anime.name FROM animals AS anime
JOIN owners AS owned
ON anime.owner_id = owned.id
JOIN species AS spec
ON anime.species_id = spec.id
WHERE owned.full_name = 'Jennifer Orwell' AND spec.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT anime.name FROM animals AS anime
JOIN owners AS owned
ON anime.owner_id = owned.id
WHERE owned.full_name = 'Dean Winchester' AND anime.escape_attempts = 0;

-- Who owns the most animals?
SELECT owned.full_name
FROM owners AS owned
JOIN animals AS anime on owned.id = anime.owner_id
GROUP BY owned.full_name
ORDER BY COUNT(*) DESC
LIMIT 1;
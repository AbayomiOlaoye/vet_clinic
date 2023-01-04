/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id primary key int,
    name varchar(255),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal(4,2)
);

-- Create a table named owners with the following columns:
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(255),
    age int
);

-- Create a table named owners with the following columns:
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(255)
);

-- Modify animals table:
-- Remove species
ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN owner_id integer;

ALTER TABLE animals 
ADD COLUMN species_id integer;

-- Add species_id
ALTER TABLE animals
ADD CONSTRAINT animeSpecie FOREIGN KEY (species_id) REFERENCES species(id);

-- Add Owners_id
ALTER TABLE animals
ADD CONSTRAINT animeOwners FOREIGN KEY (owners_id) REFERENCES  owners(id);

-- Create vets table
CREATE TABLE vets (
    id serial PRIMARY KEY,
    name text,
    age int,
    date_of_graduation date
);

-- Create specialization & Alter db
CREATE TABLE specializations (
	species_id integer,
	vets_id integer
);

ALTER TABLE specializations 
ADD CONSTRAINT specials1 FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE specializations 
ADD CONSTRAINT specials2 FOREIGN KEY (vets_id) REFERENCES vets(id);

CREATE TABLE visits
(
	animals_id integer,
	vets_id integer,
	date_of_visit date
);

ALTER TABLE visits 
ADD CONSTRAINT visits1 FOREIGN KEY (animals_id) REFERENCES animals(id);

ALTER TABLE visits 
ADD CONSTRAINT visits2 FOREIGN KEY (vets_id) REFERENCES vets(id);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
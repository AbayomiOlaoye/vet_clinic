/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth  BETWEEN '2016-01-01' and '2019-12-31';
SELECT * from ANIMALS WHERE neutered=true and escape_attempts<3;
select date_of_birth from animals where name='Agumon' or name='Pikachu';
select (name, escape_attempts) from animals where weight_kg>10.5;
select * from animals where neutered=true;
select * from animals WHERE NOT name='Gabumon';
select * from animals where weight_kg>=10.4 and weight_kg<=17.3;

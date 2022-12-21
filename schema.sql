/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id primary key int,
    name varchar(255),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal(4,2)
);

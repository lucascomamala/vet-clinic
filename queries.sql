/*Queries that provide answers to the questions from all projects.*/

/* Day 1 */
SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered IS true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered IS true;
SELECT * from animals WHERE name NOT IN ('Gabumon');
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Day 2 */
BEGIN; -- start transaction
UPDATE animals SET species = 'unspecified';
SELECT species from animals;
ROLLBACK;
SELECT species from animals;

BEGIN; -- start transaction
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS null;
SELECT species from animals;
COMMIT;
SELECT species from animals;

BEGIN; -- start transaction
DELETE FROM animals;
SELECT COUNT(*) FROM ANIMALS;
ROLLBACK;
SELECT COUNT(*) FROM ANIMALS;

BEGIN; -- start transaction
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO sp1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM ANIMALS WHERE escape_attempts = 0;
SELECT AVG(weight_kg) AS average_weight from ANIMALS;
SELECT MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT MAX(weight_kg), MIN(weight_kg), species FROM animals GROUP BY species;
SELECT AVG(escape_attempts), species FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* Day 3 */
SELECT owners.full_name, owners.id, animals.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id;
SELECT animals.id, animals.name, species.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;
SELECT COUNT(*), species.name FROM animals INNER JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name LIKE 'Jennifer Orwell';
SELECT animals.name, animals.escape_attempts FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name LIKE 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name, count(*) FROM owners LEFT JOIN animals ON animals.owner_id = owners.id GROUP BY owners.full_name;


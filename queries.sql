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
-- What animals belong to Melody Pond?
SELECT owners.full_name, owners.id, animals.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name LIKE 'Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.id, animals.name, species.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;
-- How many animals are there per species?
SELECT COUNT(*), species.name FROM animals INNER JOIN species ON animals.species_id = species.id GROUP BY species.name;
-- List all Digimon owned by Jennifer Orwell.
SELECT animals.* FROM animals
  RIGHT JOIN owners ON animals.owner_id = owners.id
  LEFT JOIN species ON animals.species_id = species.id
  WHERE owners.full_name LIKE 'Jennifer Orwell'
  AND species.name = 'Digimon';
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name, animals.escape_attempts FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name LIKE 'Dean Winchester' AND animals.escape_attempts = 0;
-- Who owns the most animals?
SELECT owners.full_name, count(*) FROM owners LEFT JOIN animals ON animals.owner_id = owners.id GROUP BY owners.full_name;

/* Day 4 */
/* Who was the last animal seen by William Tatcher? */
SELECT visit_date, a.name FROM visits v INNER JOIN vets vt ON v.vet_id=vt.id INNER JOIN animals a ON v.animal_id=a.id WHERE 
visit_date=(SELECT MAX(visit_date) FROM visits v INNER JOIN vets vt ON v.vet_id=vt.id INNER JOIN animals a ON v.animal_id=a.id WHERE vt.name LIKE 'William Tatcher');

/* How many different animals did Stephanie Mendez see? */
SELECT COUNT(*) FROM visits v INNER JOIN vets vt ON v.vet_id=vt.id WHERE vt.name LIKE 'Stephanie Mendez';

/* List all vets and their specialties, including vets with no specialties. */
SELECT v.name, sp.name AS Specialization FROM vets v LEFT JOIN specializations s ON v.id=s.vet_id LEFT JOIN species sp ON s.species_id=sp.id;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
SELECT a.name AS animal_name FROM visits v INNER JOIN vets vt ON v.vet_id=vt.id INNER JOIN animals a ON v.animal_id=a.id 
WHERE vt.name LIKE 'Stephanie Mendez' AND v.visit_date >= '2020-04-01' AND v.visit_date <= '2020-08-30';

/* What animal has the most visits to vets? */
SELECT visit_count, name FROM (SELECT COUNT(*) AS visit_count, a.name FROM visits v INNER JOIN animals a ON v.animal_id=a.id GROUP BY a.name) AS foo 
WHERE visit_count=(SELECT MAX(visit_count) FROM 
(SELECT COUNT(*) AS visit_count, a.name FROM visits v INNER JOIN animals a ON v.animal_id=a.id GROUP BY a.name) AS bar);

/* Who was Maisy Smith's first visit? */
SELECT a.name AS first_visit, vt.name, v.visit_date FROM animals a INNER JOIN visits v ON v.animal_id=a.id INNER JOIN vets vt ON v.vet_id=vt.id 
WHERE v.visit_date = ( SELECT MIN(visit_date) FROM visits as v1 INNER JOIN vets AS vt1 ON v1.vet_id=vt1.id WHERE vt1.name LIKE 'Maisy Smith');

/* Details for most recent visit: animal information, vet information, and date of visit. */
SELECT a.id AS animal_id, a.name AS animal_name, a.date_of_birth, a.escape_attempts, a.neutered, a.weight_kg, s.name AS species, 
vt.id AS vet_id, vt.name AS vet_name, vt.age, vt.date_of_graduation, v.visit_date 
FROM animals AS a INNER JOIN visits AS v ON v.animal_id=a.id INNER JOIN vets AS vt ON v.vet_id=vt.id INNER JOIN species AS s ON s.id=a.species_id 
WHERE v.visit_date = ( SELECT MAX(visit_date) FROM visits as v1 INNER JOIN vets AS vt1 ON v1.vet_id=vt1.id);

/* How many visits were with a vet that did not specialize in that animal's species? */
SELECT COUNT(*) FROM visits v INNER JOIN vets vt ON vt.id = v.vet_id INNER JOIN animals a ON a.id = v.animal_id INNER JOIN specializations s ON s.vet_id = vt.id 
WHERE NOT a.species_id = s.species_id;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
SELECT specialization FROM 
(SELECT COUNT(*) AS species_count, s.name AS specialization FROM visits v INNER JOIN animals a ON v.animal_id=a.id INNER JOIN species s ON a.species_id=s.id 
 INNER JOIN vets vt ON vt.id=v.vet_id WHERE vt.name LIKE 'Maisy Smith' GROUP BY s.name) AS foo 
WHERE species_count = (SELECT MAX(species_count) FROM 
(SELECT COUNT(*) AS species_count 
 FROM visits v INNER JOIN animals a ON v.animal_id=a.id INNER JOIN species s ON a.species_id=s.id INNER JOIN vets vt ON vt.id=v.vet_id 
 WHERE vt.name LIKE 'Maisy Smith' GROUP BY s.name)
AS bar );

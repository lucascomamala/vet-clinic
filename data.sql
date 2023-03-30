/* Populate database with sample data. */

/* Day 1 */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11);

/* Day 2 */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, -11.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22.0);

/* Day 3 */
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS null;

UPDATE animals SET owner_id = 5 WHERE name LIKE 'Agumon';
UPDATE animals SET owner_id = 6 WHERE name LIKE 'Gabumon';
UPDATE animals SET owner_id = 6 WHERE name LIKE 'Pikachu';
UPDATE animals SET owner_id = 7 WHERE name LIKE 'Devimon';
UPDATE animals SET owner_id = 7 WHERE name LIKE 'Plantmon';
UPDATE animals SET owner_id = 8 WHERE name LIKE 'Charmander';
UPDATE animals SET owner_id = 8 WHERE name LIKE 'Squirtle';
UPDATE animals SET owner_id = 8 WHERE name LIKE 'Blossom';
UPDATE animals SET owner_id = 9 WHERE name LIKE 'Angemon';
UPDATE animals SET owner_id = 9 WHERE name LIKE 'Boarmon';

/* Day 4 */
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES (1, 1);
INSERT INTO specializations (vet_id, species_id) VALUES (3, 1);
INSERT INTO specializations (vet_id, species_id) VALUES (3, 2);
INSERT INTO specializations (vet_id, species_id) VALUES (4, 2);

INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-05-24', 1, 1);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-07-22', 3, 1);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2021-02-01', 4, 2);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-01-05', 2, 3);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-03-08', 2, 3);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-05-14', 2, 3);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2021-05-04', 3, 4);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2021-02-24', 4, 5);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2019-12-21', 2, 6);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-08-10', 1, 6);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2021-04-07', 2, 6);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2019-09-29', 3, 7);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-10-03', 4, 8);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-11-04', 5, 8);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2019-01-24', 2, 9);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2019-05-15', 2, 9);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-02-27', 2, 9);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-08-03', 2, 9);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-05-24', 3, 10);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2021-01-11', 1, 10);

-- Création de la base
CREATE DATABASE gestion_etudiants;
USE gestion_etudiants;

-- Table des étudiants
CREATE TABLE Etudiants (
  id_etudiant INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  prenom VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL
);

-- Table des cours
CREATE TABLE Cours (
  id_cours INT AUTO_INCREMENT PRIMARY KEY,
  nom_cours VARCHAR(100) NOT NULL,
  credit INT NOT NULL
);

-- Table des inscriptions (relation N:M entre étudiants et cours)
CREATE TABLE Inscriptions (
  id_etudiant INT,
  id_cours INT,
  date_inscription DATE,
  PRIMARY KEY (id_etudiant, id_cours),
  FOREIGN KEY (id_etudiant) REFERENCES Etudiants(id_etudiant),
  FOREIGN KEY (id_cours) REFERENCES Cours(id_cours)
);

-- Table des professeurs
CREATE TABLE Professeurs (
  id_professeur INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  prenom VARCHAR(100) NOT NULL,
  specialite VARCHAR(100)
);

-- Relation 1:N : un professeur enseigne plusieurs cours
ALTER TABLE Cours
ADD COLUMN id_professeur INT,
ADD FOREIGN KEY (id_professeur) REFERENCES Professeurs(id_professeur);

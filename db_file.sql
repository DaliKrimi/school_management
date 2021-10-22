-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 08 juil. 2021 à 20:19
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestione`
--

-- --------------------------------------------------------

--
-- Structure de la table `admine`
--

DROP TABLE IF EXISTS `admine`;
CREATE TABLE IF NOT EXISTS `admine` (
  `coda` int(11) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `mdp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`coda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admine`
--

INSERT INTO `admine` (`coda`, `user`, `mdp`) VALUES
(1, 'user', 'user');

-- --------------------------------------------------------

--
-- Structure de la table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `refc` varchar(11) NOT NULL,
  `codf` int(11) DEFAULT NULL,
  PRIMARY KEY (`refc`),
  KEY `codf` (`codf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `class`
--

INSERT INTO `class` (`refc`, `codf`) VALUES
('1CS', 1),
('2CS', 1),
('3CS', 1),
('1SE', 2),
('2SE', 2),
('3SE', 2),
('1IRS', 3),
('2IRS', 3),
('3IRS', 3);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `cin` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `codm` int(11) DEFAULT NULL,
  PRIMARY KEY (`cin`),
  KEY `fgm` (`codm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`cin`, `nom`, `prenom`, `mail`, `tel`, `codm`) VALUES
(12346578, 'aabid', 'mohamed', 'mohamed2000@gmail.com', 52618209, 11),
(13245678, 'nizar', 'baki', 'baki.nizzar@gmail.com', 26263811, 11),
(21345678, 'aabid', 'abir', 'abir.2000@gmail.com', 93047487, 111);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `refs` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `codf` int(11) DEFAULT NULL,
  `refc` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`refs`),
  KEY `fgg` (`refc`),
  KEY `fgf` (`codf`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`refs`, `nom`, `prenom`, `mail`, `tel`, `codf`, `refc`) VALUES
(4, 'welhazi', 'ahmed', 'ahmed.welhazir8@gmail.com', 92618209, 1, '2CS'),
(5, 'saddem', 'elyes', 'elyes2000@gmail.com', 26400500, 2, '2SE'),
(6, 'krimi', 'mohamed ali', 'mohamed.ali2000@gmail.com', 96535534, 3, '2IRS'),
(7, 'salah', 'jobrane', 'jobjob2000@.gmail.com', 26252523, 1, '1CS');

-- --------------------------------------------------------

--
-- Structure de la table `filier`
--

DROP TABLE IF EXISTS `filier`;
CREATE TABLE IF NOT EXISTS `filier` (
  `codf` int(11) NOT NULL,
  `libelf` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `filier`
--

INSERT INTO `filier` (`codf`, `libelf`) VALUES
(1, 'CS'),
(2, 'SE'),
(3, 'IRS');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `codm` int(11) NOT NULL,
  `libelm` varchar(50) DEFAULT NULL,
  `codf` int(11) NOT NULL,
  PRIMARY KEY (`codm`),
  KEY `fgff` (`codf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`codm`, `libelm`, `codf`) VALUES
(1, 'math', 1),
(2, 'math', 2),
(3, 'math', 3),
(11, 'algo', 1),
(22, 'algo', 2),
(33, 'algo', 3),
(111, 'IA', 1),
(222, 'physique', 2),
(333, 'reseaux', 3);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `codm` int(11) NOT NULL,
  `refs` bigint(11) UNSIGNED NOT NULL,
  `ds` float DEFAULT NULL,
  `ex` float DEFAULT NULL,
  PRIMARY KEY (`codm`,`refs`),
  KEY `fgrs` (`refs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`codm`, `refs`, `ds`, `ex`) VALUES
(1, 4, 15, 16),
(11, 4, 15, 18),
(111, 4, 10, 15);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `fgc` FOREIGN KEY (`codf`) REFERENCES `filier` (`codf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `fgm` FOREIGN KEY (`codm`) REFERENCES `matiere` (`codm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fgf` FOREIGN KEY (`codf`) REFERENCES `filier` (`codf`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fgg` FOREIGN KEY (`refc`) REFERENCES `class` (`refc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `fgff` FOREIGN KEY (`codf`) REFERENCES `filier` (`codf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `fgmm` FOREIGN KEY (`codm`) REFERENCES `matiere` (`codm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fgrs` FOREIGN KEY (`refs`) REFERENCES `etudiant` (`refs`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

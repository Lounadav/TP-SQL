-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 22 jan. 2026 à 11:00
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `supervision`
--

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE `equipement` (
  `id_equipement` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`id_equipement`, `nom`, `type`, `adresse_ip`) VALUES
(1, 'Routeur Principal', 'Routeur', '192.168.1.254');

-- --------------------------------------------------------

--
-- Structure de la table `interface`
--

CREATE TABLE `interface` (
  `id_interface` int(11) NOT NULL,
  `nom_interface` varchar(20) DEFAULT NULL,
  `id_equipement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `interface`
--

INSERT INTO `interface` (`id_interface`, `nom_interface`, `id_equipement`) VALUES
(1, 'eth0', 1),
(2, 'eth1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `mesure_reseau`
--

CREATE TABLE `mesure_reseau` (
  `id_mesure` int(11) NOT NULL,
  `date_mesure` datetime DEFAULT NULL,
  `debit_mbps` decimal(6,2) DEFAULT NULL,
  `latence_ms` int(11) DEFAULT NULL,
  `id_interface` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD PRIMARY KEY (`id_equipement`);

--
-- Index pour la table `interface`
--
ALTER TABLE `interface`
  ADD PRIMARY KEY (`id_interface`),
  ADD KEY `id_equipement` (`id_equipement`);

--
-- Index pour la table `mesure_reseau`
--
ALTER TABLE `mesure_reseau`
  ADD PRIMARY KEY (`id_mesure`),
  ADD KEY `id_interface` (`id_interface`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `interface`
--
ALTER TABLE `interface`
  ADD CONSTRAINT `interface_ibfk_1` FOREIGN KEY (`id_equipement`) REFERENCES `equipement` (`id_equipement`);

--
-- Contraintes pour la table `mesure_reseau`
--
ALTER TABLE `mesure_reseau`
  ADD CONSTRAINT `mesure_reseau_ibfk_1` FOREIGN KEY (`id_interface`) REFERENCES `interface` (`id_interface`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

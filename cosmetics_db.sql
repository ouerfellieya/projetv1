-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 15 juin 2025 à 05:47
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
-- Base de données : `cosmetics_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('cheveux','visage','corps','main') NOT NULL,
  `quantity` int(11) DEFAULT 0,
  `price` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `gestionnaireId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `type`, `quantity`, `price`, `image`, `createdAt`, `updatedAt`, `createdBy`, `gestionnaireId`) VALUES
(2, 'dfghj222222', 'dfghbjnklm', 'visage', 255, 874, 'https://img.freepik.com/free-photo/beauty-product-spreading-out_23-2151427929.jpg', '2025-06-13 22:16:41', '2025-06-13 22:27:25', NULL, NULL),
(4, 'vvvv', 'qzjdezjkdj', 'visage', 200, 190, 'https://img.freepik.com/free-photo/skonhedsprodukt-spredes-ud_23-2151427887.jpg', '2025-06-15 00:37:37', '2025-06-15 00:39:50', NULL, 6),
(5, 'jjjjj', 'azaqzq', 'main', 150, 90, 'https://img.freepik.com/free-photo/foundation-dripping-bottle-still-life_23-2149511239.jpg', '2025-06-15 00:42:00', '2025-06-15 00:42:00', NULL, 6);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` enum('admin','client','gestionnaire') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','client','gestionnaire') NOT NULL DEFAULT 'client',
  `brandName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `brandName`, `createdAt`, `updatedAt`) VALUES
(3, 'gest', 'gest@gmail.com', '$2b$10$eZrU1njyYb4NXFzkMZwLnuyokU2wNOLqnDT3UbYZetET8uZ3OkFbK', 'gestionnaire', 'vvvv', '2025-06-14 19:14:22', '2025-06-14 19:14:22'),
(4, 'managerr', 'managerr@gmail.com', '$2b$10$EiabBNYuHRBFAGlk8ZwpW.JQeRVoVAVFU7fRk.VE/ms0z.SpBMg3y', 'gestionnaire', 'vvvv', '2025-06-14 20:44:18', '2025-06-14 21:34:40'),
(5, 'client', 'client@gmail.com', '$2b$10$iP8QyBh.zSLhorPEMq86uOU3EPSEMyASNHd29TtCEoOPQnVzDea1G', 'client', NULL, '2025-06-14 23:51:37', '2025-06-14 23:51:37'),
(6, 'manager', 'manager@gmail.com', '$2b$10$gl8MrjpaL4adN86ey4YhcOPt6KaF9mqsRzy/3dTG9DLyNbAPFcml2', 'gestionnaire', 'l\'oréal', '2025-06-15 00:33:47', '2025-06-15 00:33:47'),
(7, 'client1', 'client1@gmail.com', '$2b$10$fcNU0GM5WM3oA51VZ2pCMOiedbCQ2QmGhdGOR3.YjmZuZ.nqQT3bm', 'client', NULL, '2025-06-15 01:28:30', '2025-06-15 01:28:30'),
(8, 'vvvv', 'vvvv@gmail.com', '$2b$10$w1gSmVNon0ZI6IJQvcxClO7CogvRPnJRG54FbL8EUf5W1TDBtaT.2', 'client', NULL, '2025-06-15 02:34:39', '2025-06-15 02:34:39');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createdBy` (`createdBy`),
  ADD KEY `gestionnaireId` (`gestionnaireId`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`gestionnaireId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 17 sep. 2023 à 16:25
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `newdatabase`
--

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `label` text NOT NULL,
  `value` text NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `city`
--

INSERT INTO `city` (`id`, `label`, `value`, `pid`) VALUES
(11, '南京', 'nanjig', 1),
(12, '苏州', 'suzhou', 1),
(21, '杭州', 'hangzhou', 2),
(22, '温州', 'wenzhou', 2),
(11, '南京', 'nanjig', 1),
(12, '苏州', 'suzhou', 1),
(21, '杭州', 'hangzhou', 2),
(22, '温州', 'wenzhou', 2);

-- --------------------------------------------------------


--
-- Structure de la table `mapsales`
--

CREATE TABLE `mapsales` (
  `name` text NOT NULL,
  `lng` text NOT NULL,
  `lat` text NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `mapsales`
--

INSERT INTO `mapsales` (`name`, `lng`, `lat`, `value`) VALUES
('山东', '117.000923\r\n', '36.675807\r\n', '2000'),
('河北', '114.502461\r\n', '38.045474\r\n', '1000'),
('安徽', '117.283042\r\n', '31.86119\r\n', '3000'),
('陕西', '108.948024\r\n', '34.263161\r\n', '3000'),
('江苏', '118.767413\r\n\r\n', '32.041544', '5000'),
('山东', '117.000923\r\n', '36.675807\r\n', '2000'),
('河北', '114.502461\r\n', '38.045474\r\n', '1000'),
('安徽', '117.283042\r\n', '31.86119\r\n', '3000'),
('陕西', '108.948024\r\n', '34.263161\r\n', '3000'),
('江苏', '118.767413\r\n\r\n', '32.041544', '5000');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` text NOT NULL,
  `linkUrl` text NOT NULL,
  `openType` text NOT NULL,
  `icon` text NOT NULL,
  `isOfAdmin` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id`, `pid`, `name`, `linkUrl`, `openType`, `icon`, `isOfAdmin`) VALUES
(5, -1, 'System Setting', '/', '1', 'SettingOutlined', '1'),
(12, 5, 'Menu Management', '/setting/menu', '1', 'AlignLeftOutlined', '1'),
(18, -1, 'Business Management', '/', '1', 'AlibabaOutlined', '2'),
(20, 18, 'Product Management', '/business/product', '1', 'AccountBookOutlined', '2'),
(21, 5, 'User management', '/setting/user', '1', 'UserAddOutlined', '1'),
(22, 18, 'Business Overview', '/business/overview', '1', 'AreaChartOutlined', '2');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `attrs` text NOT NULL,
  `mainPic` text DEFAULT NULL,
  `morePic` text DEFAULT NULL,
  `isOnShelf` text NOT NULL,
  `price` text DEFAULT NULL,
  `descs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `type`, `attrs`, `mainPic`, `morePic`, `isOnShelf`, `price`, `descs`) VALUES
(2, 'iwatch', '4', '[{\"key\":\"color\",\"value\":\"pink\"}]', '\\upload\\1694884933138_iwatch1.JPG', '\\upload\\1694884939715_iwatch1.JPG', '1', '200', '<h3>Apple Watch (Series SE) 2020 GPS 40 mm - Aluminium Or - Bracelet sport Rose des sables</h3><p><img src=\"\\upload\\1694887096913_iwatch2.JPG\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>'),
(3, 'all you need to know about React.js', '0', '[{\"key\":\"Edition\",\"value\":\"2023\"}]', '\\upload\\1694886057789_react.JPG', '\\upload\\1694886064104_react.JPG', '1', '20', '<p>The Road to React: The React.js with Hooks in JavaScript Book (2023 Edition) - is a comprehensive and pragmatic yet concise React with Hooks (+ opt-in TypeScript) book. Purchase of this book includes free online access to the always up-to-date digital book.<br/></p>'),
(4, 'node.js', '0', '[{\"key\":\"Author\",\"value\":\"Azat Mardan\"},{\"key\":\"Edition\",\"value\":\"2018\"}]', '\\upload\\1694886288690_node.JPG', '\\upload\\1694886293461_node.JPG', '1', '30', '<ul><li><p>Second edition fully updated for the latest versions of Node (6) and npm (3), making this one of the best and most up-to-date resources on the market</p></li><li><p>Written by successful author and speaker, Azat Mardan</p></li><li><p>Now includes Pug, Docker, and the latest versions of Express, Mongoose, Mocha and Hapi</p></li></ul>'),
(5, 'sofa', '3', '[{\"key\":\"size\",\"value\":\"double\"},{\"key\":\"color\",\"value\":\"green\"}]', '\\upload\\1694886434774_sofa.JPG', '\\upload\\1694886439299_sofa.JPG', '1', '400', '<p>Upholstered in a sumptuous crushed chenille - a fuzzy cotton yarn of fabric that has pile protruding around the weave creating a caterpillar look. This luxuriously comfortable sofa features foam-filled seats, whilst the corner chaise section is the perfect place to put your feet up. Complete with seven cosy fibre-filled scatter cushions, this stunning compact corner sofa would be a great addition to any modern home. Bring a touch of glamour to your home with the Harriet collection.<br/></p><p><img src=\"\\upload\\1694887074696_sofa1.JPG\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>');

-- --------------------------------------------------------

--
-- Structure de la table `province`
--

CREATE TABLE `province` (
  `id` int(11) NOT NULL,
  `label` text NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `province`
--

INSERT INTO `province` (`id`, `label`, `value`) VALUES
(1, 'ile-de-france', 'ile-de-france'),
(2, 'Rhone-Alpes', 'Rhone-Alpes');

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `label` text NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id`, `pid`, `label`, `value`) VALUES
(111, 11, 'Puteaux', 'Puteaux'),
(112, 11, 'Paris', 'Paris'),
(121, 12, 'Nanterre', 'Nanterre'),
(211, 21, 'Neuilly-sur-seine', 'Neuilly-sur-seine'),
(221, 22, 'Montrouge', 'Montrouge');

-- --------------------------------------------------------

--
-- Structure de la table `salestop10`
--

CREATE TABLE `salestop10` (
  `name` text NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salestop10`
--

INSERT INTO `salestop10` (`name`, `value`) VALUES
('cookies', 1000),
('drinks', 1000),
('keyboard', 2000),
('laptop', 2000),
('smartphone', 3000),
('cosmetics', 4000);

-- --------------------------------------------------------

--
-- Structure de la table `salestrend`
--

CREATE TABLE `salestrend` (
  `name` text NOT NULL,
  `value` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salestrend`
--

INSERT INTO `salestrend` (`name`, `value`, `type`) VALUES
('01-01', 1000, '1'),
('01-02', 2000, '1'),
('01-03', 2600, '1'),
('01-04', 3000, '1');

-- --------------------------------------------------------

--
-- Structure de la table `statistics`
--

CREATE TABLE `statistics` (
  `totalTurnover` int(11) NOT NULL,
  `turnoverGrowth` text NOT NULL,
  `totalQuantity` int(11) NOT NULL,
  `quantityGrowth` text NOT NULL,
  `totalVisited` int(11) NOT NULL,
  `visitedGrowth` text NOT NULL,
  `totalStats` int(11) NOT NULL,
  `statsGrowth` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `statistics`
--

INSERT INTO `statistics` (`totalTurnover`, `turnoverGrowth`, `totalQuantity`, `quantityGrowth`, `totalVisited`, `visitedGrowth`, `totalStats`, `statsGrowth`) VALUES
(180000, '15%', 26000, '10%', 1005623, '20%', 10236, '5%');

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

CREATE TABLE `test` (
  `test3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `test1`
--

CREATE TABLE `test1` (
  `name` text NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `test1`
--

INSERT INTO `test1` (`name`, `value`) VALUES
('test_1', 10),
('test_2', 20);

-- --------------------------------------------------------

--
-- Structure de la table `trending`
--

CREATE TABLE `trending` (
  `name` text NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `trending`
--

INSERT INTO `trending` (`name`, `value`) VALUES
('iPhone', 2000),
('iWatch', 8000),
('ipod', 5000),
('Razer Huntsman', 2560),
('Nike', 7100),
('Addidas', 7000),
('Yves Saint Laurent parfum', 1200);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `account` text NOT NULL,
  `area` text NOT NULL,
  `tel` text NOT NULL,
  `email` text NOT NULL,
  `picture` text DEFAULT NULL,
  `relatedMenus` text DEFAULT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `account`, `area`, `tel`, `email`, `picture`, `relatedMenus`, `password`) VALUES
(-1, 'administrator', 'admin', '', '', '', NULL, NULL, '123123'),
(1, 'user1', 'koko', 'jiangsu,suzhou,gusu', '0751626134', 'jeggycool@gmail.com', NULL, '18,20', 'E6XdpNJe'),
(2, 'something like this', 'user', 'zhejiang,hangzhou,shangcheng', '0751626135', 'jeggyep@gmail.com', '\\upload\\1694362358490_little_jing.JPG', NULL, 'NpqGJLcE'),
(4, 'gigi_ko', 'user3', 'Rhone-Alpes,wenzhou,Montrouge', '0751626140', 'blablabla@gmail.com', '\\upload\\1694464308710_Capture.JPG', NULL, '%&LMBuyv');

-- --------------------------------------------------------

--
-- Structure de la table `volumetop10`
--

CREATE TABLE `volumetop10` (
  `name` text NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `volumetop10`
--

INSERT INTO `volumetop10` (`name`, `value`) VALUES
('book', 200000),
('ipod', 150000),
('keyboard', 100000),
('laptop', 98000),
('smartphone', 90000),
('cosmetics', 70000);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `province`
--
ALTER TABLE `province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

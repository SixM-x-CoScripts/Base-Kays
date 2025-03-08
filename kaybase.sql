-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 26 fév. 2025 à 16:46
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `kaybase`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin_jails`
--

CREATE TABLE `admin_jails` (
  `UniqueID` int(11) NOT NULL,
  `time` longtext DEFAULT NULL,
  `staff` longtext DEFAULT NULL,
  `reason` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `aircraft_categorie`
--

CREATE TABLE `aircraft_categorie` (
  `name` text NOT NULL,
  `label` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aircraft_categorie`
--

INSERT INTO `aircraft_categorie` (`name`, `label`) VALUES
('aircraft', 'Aériens'),
('aircraft', 'Aériens');

-- --------------------------------------------------------

--
-- Structure de la table `appel_jobs`
--

CREATE TABLE `appel_jobs` (
  `id` int(11) NOT NULL,
  `raison` text NOT NULL,
  `pos` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `appel_jobs`
--

INSERT INTO `appel_jobs` (`id`, `raison`, `pos`, `job`, `plate`) VALUES
(20, 'Véhicule en panne', '{\"x\":959.5875244140625,\"y\":-1755.00830078125,\"z\":30.58796310424804}', 'mecano', '61JAW472');

-- --------------------------------------------------------

--
-- Structure de la table `bcso_plainte`
--

CREATE TABLE `bcso_plainte` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `date` text DEFAULT NULL,
  `numberphone` text DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `author` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `blanchiment`
--

CREATE TABLE `blanchiment` (
  `id` int(11) NOT NULL,
  `owner` int(11) DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `pos` varchar(255) DEFAULT NULL,
  `percent` longtext DEFAULT '0',
  `time` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boat_categories`
--

CREATE TABLE `boat_categories` (
  `name` varchar(50) NOT NULL DEFAULT 'none',
  `label` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boat_categories`
--

INSERT INTO `boat_categories` (`name`, `label`) VALUES
('boat', 'Bateau');

-- --------------------------------------------------------

--
-- Structure de la table `boost_farm`
--

CREATE TABLE `boost_farm` (
  `UniqueID` int(11) NOT NULL,
  `boost` longtext NOT NULL,
  `time` longtext NOT NULL,
  `multiplication` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boutique`
--

CREATE TABLE `boutique` (
  `citizenID` varchar(255) NOT NULL,
  `boutique_code` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boutique`
--

INSERT INTO `boutique` (`citizenID`, `boutique_code`, `points`) VALUES
('license:6d2ec16715a79825289a0f8312f8c80532aa51c5', 1, 0),
('license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `boutique_history`
--

CREATE TABLE `boutique_history` (
  `uniqueid` int(11) DEFAULT NULL,
  `data` longtext NOT NULL DEFAULT 'Indéfini'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boutique_reward`
--

CREATE TABLE `boutique_reward` (
  `UniqueID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boutique_reward`
--

INSERT INTO `boutique_reward` (`UniqueID`) VALUES
(1),
(7),
(11),
(12);

-- --------------------------------------------------------

--
-- Structure de la table `chasse`
--

CREATE TABLE `chasse` (
  `uniqueid` int(11) DEFAULT NULL,
  `levels` int(11) DEFAULT 0,
  `animals` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chasse`
--

INSERT INTO `chasse` (`uniqueid`, `levels`, `animals`) VALUES
(1, -60, '[\"Lapin\"]');

-- --------------------------------------------------------

--
-- Structure de la table `clothes_inventory`
--

CREATE TABLE `clothes_inventory` (
  `UniqueID` int(11) NOT NULL,
  `clothes` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `darkchat_messages`
--

CREATE TABLE `darkchat_messages` (
  `id` int(11) NOT NULL,
  `password` text NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dpkeybinds`
--

CREATE TABLE `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `drugs_circuits`
--

CREATE TABLE `drugs_circuits` (
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `recolte` longtext DEFAULT NULL,
  `traitement` longtext DEFAULT NULL,
  `animtype` longtext DEFAULT NULL,
  `animdict` longtext DEFAULT NULL,
  `anim` longtext DEFAULT NULL,
  `animtime` int(11) DEFAULT NULL,
  `marker` tinyint(1) DEFAULT 0,
  `props` longtext DEFAULT NULL,
  `name_pooch` longtext DEFAULT NULL,
  `label_pooch` longtext DEFAULT NULL,
  `animtype_t` longtext DEFAULT NULL,
  `animdict_t` longtext DEFAULT NULL,
  `anim_t` longtext DEFAULT NULL,
  `animtime_t` int(11) DEFAULT NULL,
  `marker_t` tinyint(1) DEFAULT 0,
  `props_t` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `drugs_circuits`
--

INSERT INTO `drugs_circuits` (`name`, `label`, `recolte`, `traitement`, `animtype`, `animdict`, `anim`, `animtime`, `marker`, `props`, `name_pooch`, `label_pooch`, `animtype_t`, `animdict_t`, `anim_t`, `animtime_t`, `marker_t`, `props_t`) VALUES
('mdma', 'MDMA', '[{\"x\":2482.186279296875,\"y\":3722.605224609375,\"z\":43.92522430419922}]', '[{\"x\":106.07408905029297,\"y\":6903.52880859375,\"z\":19.48505401611328}]', 'anim', 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 5, 1, 'none', 'mdma_pochon', 'Pochon MDMA', 'anim', 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 5, 1, 'none');

-- --------------------------------------------------------

--
-- Structure de la table `drugs_sell`
--

CREATE TABLE `drugs_sell` (
  `id` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ediscordboost`
--

CREATE TABLE `ediscordboost` (
  `identifier` varchar(50) DEFAULT '255',
  `time` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `elevators`
--

CREATE TABLE `elevators` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `elevator_floors`
--

CREATE TABLE `elevator_floors` (
  `id` int(11) NOT NULL,
  `elevator_id` int(11) NOT NULL,
  `floor_name` varchar(255) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `exodia_clothes`
--

CREATE TABLE `exodia_clothes` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `identifier` varchar(60) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `exodia_clothes`
--

INSERT INTO `exodia_clothes` (`id`, `type`, `identifier`, `name`, `data`) VALUES
(1, 'top', 'license:74651259556db94a2dbd32fa1e7b9fdb1c381acc', 'Haut 568', '{\"torso_2\":0,\"torso_1\":568,\"tshirt_1\":15,\"tshirt_2\":0,\"arms\":25,\"bproof_2\":0,\"bproof_1\":0,\"arms_2\":0}'),
(2, 'top', 'license:74651259556db94a2dbd32fa1e7b9fdb1c381acc', 'Haut 568', '{\"torso_2\":0,\"torso_1\":568,\"tshirt_1\":15,\"tshirt_2\":0,\"arms\":25,\"bproof_2\":0,\"bproof_1\":63,\"arms_2\":0}'),
(3, 'outfit', 'license:74651259556db94a2dbd32fa1e7b9fdb1c381acc', 'tenus triades', '{\"mask_2\":0,\"helmet_1\":-1,\"shoes_2\":3,\"arms\":25,\"bproof_2\":0,\"decals_2\":0,\"pants_1\":207,\"mask_1\":0,\"helmet_2\":0,\"tshirt_2\":0,\"decals_1\":0,\"torso_1\":568,\"torso_2\":0,\"tshirt_1\":15,\"pants_2\":0,\"chain_1\":0,\"bproof_1\":63,\"arms_2\":0,\"chain_2\":0,\"shoes_1\":37}'),
(4, 'mask', 'license:74651259556db94a2dbd32fa1e7b9fdb1c381acc', 'Masque 238', '{\"mask_1\":238,\"mask_2\":0}'),
(5, 'mask', 'license:74651259556db94a2dbd32fa1e7b9fdb1c381acc', 'Masque 238', '{\"mask_1\":238,\"mask_2\":0}'),
(6, 'bags', 'license:6d2ec16715a79825289a0f8312f8c80532aa51c5', 'Sac', '{\"bags_2\":0,\"bags_1\":82}'),
(8, 'outfit', 'license:74651259556db94a2dbd32fa1e7b9fdb1c381acc', 'triades blanc', '{\"torso_2\":2,\"tshirt_2\":0,\"bproof_2\":2,\"helmet_2\":0,\"decals_2\":0,\"tshirt_1\":1,\"bproof_1\":63,\"helmet_1\":-1,\"shoes_1\":37,\"shoes_2\":3,\"chain_1\":0,\"mask_1\":238,\"mask_2\":0,\"chain_2\":0,\"torso_1\":567,\"arms\":25,\"decals_1\":0,\"arms_2\":0,\"pants_1\":207,\"pants_2\":2}'),
(9, 'mask', 'license:74651259556db94a2dbd32fa1e7b9fdb1c381acc', 'Masque 238', '{\"mask_2\":2,\"mask_1\":238}');

-- --------------------------------------------------------

--
-- Structure de la table `exodia_trunk`
--

CREATE TABLE `exodia_trunk` (
  `info` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 30, 0),
(2, 'Franchir une ligne continue', 40, 0),
(3, 'Circulation à contresens', 250, 0),
(4, 'Demi-tour non autorisé', 250, 0),
(5, 'Circulation hors-route', 170, 0),
(6, 'Non-respect des distances de sécurité', 30, 0),
(7, 'Arrêt dangereux / interdit', 150, 0),
(8, 'Stationnement gênant / interdit', 70, 0),
(9, 'Non respect  de la priorité à droite', 70, 0),
(10, 'Non-respect à un véhicule prioritaire', 90, 0),
(11, 'Non-respect d\'un stop', 105, 0),
(12, 'Non-respect d\'un feu rouge', 130, 0),
(13, 'Dépassement dangereux', 100, 0),
(14, 'Véhicule non en état', 100, 0),
(15, 'Conduite sans permis', 1500, 0),
(16, 'Délit de fuite', 800, 0),
(17, 'Excès de vitesse < 5 kmh', 90, 0),
(18, 'Excès de vitesse 5-15 kmh', 120, 0),
(19, 'Excès de vitesse 15-30 kmh', 180, 0),
(20, 'Excès de vitesse > 30 kmh', 300, 0),
(21, 'Entrave de la circulation', 110, 1),
(22, 'Dégradation de la voie publique', 90, 1),
(23, 'Trouble à l\'ordre publique', 90, 1),
(24, 'Entrave opération de police', 130, 1),
(25, 'Insulte envers / entre civils', 75, 1),
(26, 'Outrage à agent de police', 110, 1),
(27, 'Menace verbale ou intimidation envers civil', 90, 1),
(28, 'Menace verbale ou intimidation envers policier', 150, 1),
(29, 'Manifestation illégale', 250, 1),
(30, 'Tentative de corruption', 1500, 1),
(31, 'Arme blanche sortie en ville', 120, 2),
(32, 'Arme léthale sortie en ville', 300, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
(34, 'Port d\'arme illégal', 700, 2),
(35, 'Pris en flag lockpick', 300, 2),
(36, 'Vol de voiture', 1800, 2),
(37, 'Vente de drogue', 1500, 2),
(38, 'Fabriquation de drogue', 1500, 2),
(39, 'Possession de drogue', 650, 2),
(40, 'Prise d\'ôtage civil', 1500, 2),
(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
(42, 'Braquage particulier', 650, 2),
(43, 'Braquage magasin', 650, 2),
(44, 'Braquage de banque', 1500, 2),
(45, 'Tir sur civil', 2000, 3),
(46, 'Tir sur agent de l\'état', 2500, 3),
(47, 'Tentative de meurtre sur civil', 3000, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
(49, 'Meurtre sur civil', 10000, 3),
(50, 'Meurte sur agent de l\'état', 30000, 3),
(51, 'Meurtre involontaire', 1800, 3),
(52, 'Escroquerie à l\'entreprise', 2000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `fishing`
--

CREATE TABLE `fishing` (
  `UniqueID` int(11) DEFAULT NULL,
  `level` longtext DEFAULT 0,
  `fishList` longtext DEFAULT NULL,
  `permit` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gangs_new`
--

CREATE TABLE `gangs_new` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `positions` longtext DEFAULT NULL,
  `permissions` longtext DEFAULT NULL,
  `circuit` longtext DEFAULT NULL,
  `chest` longtext DEFAULT NULL,
  `cat` longtext DEFAULT NULL,
  `blips` tinyint(1) DEFAULT NULL,
  `blipscolor` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gangs_new`
--

INSERT INTO `gangs_new` (`id`, `name`, `label`, `positions`, `permissions`, `circuit`, `chest`, `cat`, `blips`, `blipscolor`) VALUES
(8, 'ballas', 'Ballas', '{\"chest\":{\"x\":89.86585998535156,\"y\":-1961.611083984375,\"z\":20.7217960357666},\"boss\":{\"x\":116.16582489013672,\"y\":-1952.0374755859376,\"z\":20.65725517272949}}', '{\"manage_members\":[],\"change_group_player\":[],\"items\":[],\"items_remove\":[],\"weapons\":[],\"create_edit_grades\":[],\"items_add\":[],\"accounts_add\":[],\"weapons_remove\":[],\"accounts_remove\":[],\"weapons_add\":[],\"recruit_remove_player\":[],\"*\":{\"boss\":true},\"accounts\":[]}', '0', '{\"weapons\":[],\"accounts\":{\"black_money\":0,\"cash\":0},\"items\":[]}', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `garages`
--

CREATE TABLE `garages` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT 'none',
  `label` varchar(50) NOT NULL DEFAULT 'none',
  `defaultpos` varchar(255) DEFAULT NULL,
  `deletepos` varchar(255) DEFAULT NULL,
  `spawnpos` longtext DEFAULT NULL,
  `headingspawnpos` varchar(255) DEFAULT NULL,
  `activeblip` bit(1) DEFAULT NULL,
  `type` varchar(50) DEFAULT 'car'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `garages`
--

INSERT INTO `garages` (`id`, `name`, `label`, `defaultpos`, `deletepos`, `spawnpos`, `headingspawnpos`, `activeblip`, `type`) VALUES
(1, 'pc', 'Parking Central', '{\"z\":30.73324203491211,\"x\":215.437744140625,\"y\":-810.1314086914063}', '{\"z\":30.77027511596679,\"x\":221.9745330810547,\"y\":-786.7836303710938}', '[{\"z\":29.45521926879882,\"h\":64.86729431152344,\"x\":232.85386657714845,\"y\":-805.0956420898438},{\"z\":29.46154594421386,\"h\":62.95913696289062,\"x\":233.96218872070313,\"y\":-802.8009033203125},{\"z\":29.48854019165039,\"x\":235.16432189941407,\"h\":74.0940933227539,\"y\":-800.3082885742188}]', '162.05015563964844', b'1', 'car'),
(2, 'hangar_airport', 'Hangar airport 1', '{\"z\":14.04568004608154,\"y\":-2665.697998046875,\"x\":-1276.8614501953126}', '{\"x\":-1310.375,\"y\":-2720.837158203125,\"z\":15.0649127960205}', '[{\"x\":-1316.348388671875,\"z\":12.94494247436523,\"y\":-2731.16259765625,\"h\":147.71737670898438},{\"x\":-1329.6566162109376,\"z\":12.96492721557617,\"y\":-2754.07080078125,\"h\":150.55368041992188}]', '147.15330505371094', b'1', 'aircraft'),
(3, 'dock_marina', 'Dock Marina 1', '{\"z\":1.60516726970672,\"x\":-895.2451782226563,\"y\":-1331.3834228515626}', '{\"z\":1.08127129077911,\"x\":-892.1829833984375,\"y\":-1336.7296142578126}', '[{\"z\":-1.4748937189579,\"h\":291.3253173828125,\"x\":-931.0884399414063,\"y\":-1356.4119873046876},{\"z\":-1.45478234767913,\"x\":-966.6730346679688,\"h\":286.77239990234377,\"y\":-1370.198974609375},{\"z\":-1.58051393508911,\"h\":286.7681884765625,\"x\":-885.8867797851563,\"y\":-1343.6484375}]', '281.8470764160156', b'1', 'boat'),
(89, 'car_paleto', 'Garage Paleto Bay', '{\"x\":105.18330383300781,\"y\":6613.6982421875,\"z\":32.39749526977539}', '{\"x\":122.94471740722656,\"y\":6608.63623046875,\"z\":31.89615821838379}', '[{\"z\":31.03698684692382,\"h\":271.6756896972656,\"x\":118.78885650634766,\"y\":6599.4853515625},{\"z\":31.022197265625,\"h\":271.7145080566406,\"x\":122.97870635986328,\"y\":6594.775390625},{\"z\":30.96074058532714,\"h\":271.18115234375,\"x\":127.33322143554688,\"y\":6589.9638671875},{\"z\":30.98183395385742,\"h\":272.2800598144531,\"x\":132.9323272705078,\"y\":6585.1474609375},{\"z\":31.03316833496093,\"h\":268.1618957519531,\"x\":136.85743713378907,\"y\":6580.07080078125},{\"z\":30.96838333129882,\"h\":267.5201416015625,\"x\":142.084716796875,\"y\":6575.04296875}]', NULL, b'1', 'car'),
(90, 'car_aeroport', 'Garage Aeroport', '{\"x\":-989.5457153320313,\"y\":-2702.186767578125,\"z\":13.83067417144775}', '{\"x\":-986.1002807617188,\"y\":-2707.8369140625,\"z\":13.83067417144775}', '[{\"z\":12.85068943023681,\"h\":145.58761596679688,\"x\":-973.3757934570313,\"y\":-2692.905029296875},{\"z\":12.85068943023681,\"h\":148.2045440673828,\"x\":-970.4171752929688,\"y\":-2694.532958984375},{\"z\":12.85068943023681,\"h\":146.03543090820313,\"x\":-967.4092407226563,\"y\":-2696.07373046875},{\"z\":12.85068943023681,\"h\":146.95506286621095,\"x\":-964.476318359375,\"y\":-2697.617919921875},{\"z\":12.85103084564209,\"h\":147.8384246826172,\"x\":-961.5484619140625,\"y\":-2699.249755859375}]', NULL, b'1', 'car'),
(91, 'car_usine', 'Garage Usine', '{\"x\":1002.0339965820313,\"y\":-1855.966064453125,\"z\":31.03981971740722}', '{\"x\":994.2088623046875,\"y\":-1859.8970947265626,\"z\":30.88983535766601}', '[{\"z\":29.90983345031738,\"h\":358.6188049316406,\"x\":1000.4957275390625,\"y\":-1869.711669921875},{\"z\":29.90983535766601,\"h\":352.16204833984377,\"x\":1005.4006958007813,\"y\":-1869.4593505859376},{\"z\":29.90983535766601,\"h\":355.47015380859377,\"x\":1010.311279296875,\"y\":-1869.658203125}]', NULL, b'1', 'car'),
(92, 'car_sandy', 'Garage Sandy', '{\"x\":1507.4791259765626,\"y\":3765.866943359375,\"z\":34.14119338989258}', '{\"x\":1503.5220947265626,\"y\":3763.25927734375,\"z\":33.99359512329101}', '[{\"z\":32.94380523681641,\"h\":212.78538513183595,\"x\":1497.613525390625,\"y\":3760.324951171875},{\"z\":32.91978408813477,\"h\":217.0897674560547,\"x\":1494.7264404296876,\"y\":3758.829345703125},{\"z\":32.98075057983399,\"h\":214.758056640625,\"x\":1492.135009765625,\"y\":3757.052978515625},{\"z\":32.82697250366211,\"h\":214.23165893554688,\"x\":1486.4873046875,\"y\":3753.639892578125}]', NULL, b'1', 'car'),
(93, 'car_cayo', 'Garage Cayo', '{\"x\":4502.93701171875,\"y\":-4531.087890625,\"z\":4.17187070846557}', '{\"x\":4500.19384765625,\"y\":-4538.677734375,\"z\":4.15124082565307}', '[{\"z\":3.20569946289062,\"h\":310.1226501464844,\"x\":4505.77001953125,\"y\":-4535.62841796875},{\"z\":3.23932077407836,\"h\":6.17999076843261,\"x\":4512.2373046875,\"y\":-4528.193359375}]', NULL, b'1', 'car'),
(94, 'boat_cayo', 'Garage Cayo Bateau', '{\"x\":5095.00341796875,\"y\":-4655.79296875,\"z\":1.7494683265686}', '{\"x\":5113.72802734375,\"y\":-4646.88134765625,\"z\":1.45786809921264}', '[{\"z\":-1.40710146307945,\"h\":248.875732421875,\"x\":5107.2900390625,\"y\":-4646.5361328125}]', NULL, b'1', 'boat'),
(95, 'boat_port', 'Garage Port Bateau', '{\"z\":5.90633249282836,\"x\":1296.8060302734376,\"y\":-3326.060546875}', '{\"x\":1310.190673828125,\"y\":-3327.18505859375,\"z\":1.62722706794738}', '[{\"z\":-1.42858971238136,\"h\":177.89752197265626,\"x\":1307.774169921875,\"y\":-3333.017822265625}]', NULL, b'1', 'boat'),
(96, 'aircraft_cayo', 'Garage Cayo Avions', '{\"z\":4.24451303482055,\"y\":-4467.89892578125,\"x\":4464.16015625}', '{\"x\":4485.830078125,\"y\":-4462.7822265625,\"z\":4.52787733078002}', '[{\"z\":3.21430065155029,\"y\":-4493.42041015625,\"h\":106.97201538085938,\"x\":4497.10693359375},{\"z\":3.20439435958862,\"y\":-4502.3642578125,\"h\":108.5582504272461,\"x\":4472.53564453125}]', NULL, b'1', 'aircraft'),
(97, 'aircraft_sandy', 'Garage Sandy Avions', '{\"z\":41.14892959594726,\"x\":1758.58642578125,\"y\":3297.75927734375}', '{\"x\":1737.5064697265626,\"y\":3287.417724609375,\"z\":41.65006256103515}', '[{\"z\":40.075908203125,\"x\":1711.4703369140626,\"h\":104.3790512084961,\"y\":3252.6337890625},{\"z\":39.79090835571289,\"x\":1679.97998046875,\"h\":108.04100036621094,\"y\":3244.1279296875}]', NULL, b'1', 'aircraft'),
(98, 'car_cayo2', 'Garage Cayo Port', '{\"x\":5079.60205078125,\"y\":-4647.0302734375,\"z\":2.38883280754089}', '{\"x\":5078.01416015625,\"y\":-4650.02783203125,\"z\":2.30213642120361}', '[{\"h\":57.94215774536133,\"y\":-4647.55908203125,\"z\":1.43001343727111,\"x\":5072.169921875},{\"h\":38.16310119628906,\"y\":-4641.22021484375,\"z\":1.51391293525695,\"x\":5064.1611328125}]', NULL, b'1', 'car'),
(100, 'car_ems', 'Garage EMS', '{\"x\":-450.290771484375,\"y\":-340.653564453125,\"z\":34.50172424316406}', '{\"x\":-454.3588562011719,\"y\":-340.28948974609377,\"z\":34.363525390625}', '[{\"x\":-462.0938415527344,\"z\":33.38795806884766,\"y\":-346.2357177734375,\"h\":259.5406494140625},{\"x\":-454.5524597167969,\"z\":33.38343765258789,\"y\":-340.30389404296877,\"h\":351.809814453125},{\"x\":-459.0676574707031,\"z\":33.38359786987305,\"y\":-331.9632873535156,\"h\":80.3245620727539}]', NULL, b'0', 'car'),
(101, 'car_bcso', 'Garage BCSO', '{\"x\":-459.0919494628906,\"y\":6029.650390625,\"z\":31.48980903625488}', '{\"x\":-464.5460510253906,\"y\":6043.02001953125,\"z\":31.34039688110351}', '[{\"x\":-468.8717346191406,\"z\":30.36038925170898,\"y\":6038.90771484375,\"h\":225.3227081298828},{\"x\":-472.3005065917969,\"z\":30.36038925170898,\"y\":6035.2451171875,\"h\":222.3425750732422},{\"x\":-475.9065246582031,\"z\":30.36038925170898,\"y\":6031.77880859375,\"h\":223.77772521972657},{\"x\":-479.60064697265627,\"z\":30.36038925170898,\"y\":6028.1474609375,\"h\":222.98707580566407},{\"x\":-482.79632568359377,\"z\":30.36038925170898,\"y\":6024.92529296875,\"h\":223.9338836669922}]', NULL, b'0', 'car'),
(104, 'avion_EMS', 'Garage EMS Avion', '{\"x\":-444.1599426269531,\"y\":-323.5153503417969,\"z\":78.16806030273438}', '{\"x\":-450.3445739746094,\"y\":-306.5180969238281,\"z\":78.16806030273438}', '[{\"x\":-450.3445739746094,\"z\":77.18806030273437,\"y\":-306.5180969238281,\"h\":20.23764038085937}]', NULL, b'0', 'aircraft'),
(106, 'car_gouv', 'Garage GOUVERNEMENT', '{\"x\":-521.2971801757813,\"y\":-262.8738708496094,\"z\":35.49252700805664}', '{\"x\":-519.4764404296875,\"y\":-265.6112976074219,\"z\":35.34010314941406}', '[{\"x\":-513.7872314453125,\"z\":34.44301177978516,\"y\":-263.218994140625,\"h\":288.79620361328127},{\"x\":-502.2763366699219,\"z\":34.56259872436524,\"y\":-258.3603820800781,\"h\":292.3358154296875},{\"x\":-492.7862854003906,\"z\":34.6559977722168,\"y\":-254.51585388183595,\"h\":292.01226806640627}]', NULL, b'0', 'car'),
(107, 'avion_gouv', 'Garage GOUV Avion', '{\"x\":-551.6595458984375,\"y\":-243.1166229248047,\"z\":36.82938385009765}', '{\"x\":-545.1774291992188,\"y\":-252.95936584472657,\"z\":36.15755081176758}', '[{\"x\":-545.1774291992188,\"z\":35.17755081176758,\"y\":-252.95936584472657,\"h\":206.92430114746095}]', NULL, b'0', 'aircraft'),
(108, 'car_concess', 'Garage Concessionaire', '{\"x\":-806.8345947265625,\"y\":-226.0113067626953,\"z\":37.22595596313476}', '{\"x\":-810.0242309570313,\"y\":-227.81846618652345,\"z\":37.16663360595703}', '[{\"x\":-828.3170166015625,\"z\":36.12007476806641,\"y\":-233.9827117919922,\"h\":206.66427612304688},{\"x\":-825.575927734375,\"z\":36.06736709594727,\"y\":-238.9723663330078,\"h\":205.73052978515626},{\"x\":-831.3472900390625,\"z\":36.16561462402344,\"y\":-228.82315063476563,\"h\":209.51670837402345}]', NULL, b'0', 'car'),
(109, 'car_immo', 'Garage Immobilier', '{\"x\":-224.30470275878907,\"y\":-616.5364379882813,\"z\":33.78159713745117}', '{\"x\":-228.57579040527345,\"y\":-618.6758422851563,\"z\":33.60110092163086}', '[{\"x\":-228.1072540283203,\"z\":32.92858840942383,\"y\":-610.6416015625,\"h\":338.508544921875},{\"x\":-225.94639587402345,\"z\":33.08836700439453,\"y\":-604.6930541992188,\"h\":339.47857666015627}]', NULL, b'0', 'car'),
(110, 'car_bahamas', 'Garage Bahamas', '{\"x\":-1392.158935546875,\"y\":-584.0679321289063,\"z\":30.23465728759765}', '{\"x\":-1393.809326171875,\"y\":-581.910400390625,\"z\":30.15777587890625}', '[{\"x\":-1401.7254638671876,\"z\":29.26724769592285,\"y\":-586.3819580078125,\"h\":297.8568115234375},{\"x\":-1407.335693359375,\"z\":29.32743789672851,\"y\":-589.5899047851563,\"h\":297.0708923339844},{\"x\":-1412.7652587890626,\"z\":29.39259292602539,\"y\":-592.6082763671875,\"h\":299.8970947265625}]', NULL, b'0', 'car'),
(112, 'car_salieris', 'Garage Salieris', '{\"x\":429.9596252441406,\"y\":-1515.0909423828126,\"z\":29.28858757019043}', '{\"x\":427.6025390625,\"y\":-1521.7103271484376,\"z\":29.30221366882324}', '[{\"x\":442.0731506347656,\"z\":28.2951293182373,\"y\":-1519.1783447265626,\"h\":137.16400146484376},{\"x\":444.65948486328127,\"z\":28.29429580688476,\"y\":-1521.045654296875,\"h\":138.72161865234376},{\"x\":439.890625,\"z\":28.29932357788086,\"y\":-1517.047607421875,\"h\":141.69668579101563},{\"x\":437.6636962890625,\"z\":28.30359603881836,\"y\":-1514.813720703125,\"h\":138.1477813720703}]', NULL, b'0', 'car'),
(113, 'car_tabac', 'Garage Tabac', '{\"x\":-40.9476318359375,\"y\":-1081.8502197265626,\"z\":26.63918685913086}', '{\"x\":-44.46834945678711,\"y\":-1082.14404296875,\"z\":26.68387222290039}', '[{\"x\":-48.82778549194336,\"z\":25.82953788757324,\"y\":-1081.425537109375,\"h\":67.7769546508789}]', NULL, b'0', 'car'),
(114, 'car_fourrière', 'Garage Fourrière Car', '{\"x\":-181.67076110839845,\"y\":-1164.6890869140626,\"z\":23.16378593444824}', '{\"x\":-175.73402404785157,\"y\":-1171.158203125,\"z\":23.0440616607666}', '[{\"x\":-178.01797485351563,\"z\":22.06402732849121,\"y\":-1165.9248046875,\"h\":178.5581817626953},{\"x\":-173.34234619140626,\"z\":22.06402732849121,\"y\":-1166.043212890625,\"h\":176.47216796875}]', NULL, b'0', 'car'),
(115, 'car_tacos', 'Garage Tacos', '{\"x\":1.55668592453002,\"y\":-1609.10400390625,\"z\":29.28386116027832}', '{\"x\":-0.38142365217208,\"y\":-1611.156494140625,\"z\":29.18793296813965}', '[{\"x\":3.36820840835571,\"z\":28.27065040588379,\"y\":-1615.05615234375,\"h\":46.95763397216797}]', NULL, b'0', 'car'),
(116, 'car_Tequilala', 'Garage Tequilala', '{\"x\":-553.8921508789063,\"y\":310.8364562988281,\"z\":83.17669677734375}', '{\"x\":-554.2106323242188,\"y\":307.9562072753906,\"z\":83.24366760253906}', '[{\"x\":-562.9547119140625,\"z\":82.08499481201172,\"y\":299.3974304199219,\"h\":269.8291931152344},{\"x\":-562.5978393554688,\"z\":82.22118713378906,\"y\":303.7738037109375,\"h\":268.57354736328127}]', NULL, b'0', 'car'),
(117, 'car_unicorn', 'Garage Unicorn', '{\"x\":146.26034545898438,\"y\":-1288.9644775390626,\"z\":29.33267784118652}', '{\"x\":144.91909790039063,\"y\":-1287.595947265625,\"z\":29.33736419677734}', '[{\"x\":143.38461303710938,\"z\":28.35885955810547,\"y\":-1285.447509765625,\"h\":296.9962158203125},{\"x\":141.91766357421876,\"z\":28.35938217163086,\"y\":-1283.0335693359376,\"h\":300.0919494628906},{\"x\":140.35916137695313,\"z\":28.36022903442382,\"y\":-1280.5096435546876,\"h\":298.3092041015625}]', NULL, b'0', 'car'),
(118, 'car_vigne', 'Garage Vigneron', '{\"x\":-1923.58056640625,\"y\":2054.2978515625,\"z\":140.83163452148438}', '{\"x\":-1920.3310546875,\"y\":2052.7353515625,\"z\":140.73477172851563}', '[{\"x\":-1920.7757568359376,\"z\":139.75472595214846,\"y\":2048.652099609375,\"h\":257.2882995605469},{\"x\":-1921.9578857421876,\"z\":139.75481750488283,\"y\":2044.431884765625,\"h\":259.6170654296875},{\"x\":-1923.0059814453126,\"z\":139.75472595214846,\"y\":2040.4156494140626,\"h\":256.17999267578127},{\"x\":-1924.0943603515626,\"z\":139.75472595214846,\"y\":2036.6123046875,\"h\":264.543212890625}]', NULL, b'0', 'car'),
(122, 'car_weapon_selling', 'Garage vente d\'arme', '{\"x\":999.64306640625,\"y\":2907.507080078125,\"z\":41.45183563232422}', '{\"x\":988.47021484375,\"y\":2903.650390625,\"z\":41.45185089111328}', '[{\"x\":995.7142944335938,\"h\":277.0482177734375,\"z\":40.45183563232422,\"y\":2903.842041015625},{\"x\":995.7147827148438,\"h\":276.29583740234377,\"z\":40.45183563232422,\"y\":2903.842041015625}]', NULL, b'0', 'car'),
(124, 'garage_mdo', 'Garage MDO', '{\"x\":-2610.109130859375,\"y\":1671.5135498046876,\"z\":141.86642456054688}', '{\"x\":-2604.32763671875,\"y\":1678.09814453125,\"z\":141.8645782470703}', '[{\"z\":140.89124633789064,\"x\":-2601.041259765625,\"h\":223.21939086914063,\"y\":1678.452392578125},{\"z\":140.88286926269533,\"x\":-2604.4404296875,\"h\":224.3820343017578,\"y\":1675.0914306640626}]', NULL, b'0', 'car'),
(126, 'garage_mdo', 'Garage MDO', '{\"x\":-1114.8126220703126,\"y\":4937.0791015625,\"z\":218.3743896484375}', '{\"x\":-1116.843994140625,\"y\":4932.26904296875,\"z\":218.3449249267578}', '[{\"z\":217.55401184082033,\"y\":4928.7890625,\"h\":240.077392578125,\"x\":-1119.3526611328126},{\"z\":217.4471697998047,\"y\":4923.34716796875,\"h\":249.8668212890625,\"x\":-1120.98828125}]', NULL, b'0', 'car'),
(127, 'garage_mdo_avion', 'Garage MDO Avion', '{\"x\":-1135.082275390625,\"y\":4930.0166015625,\"z\":219.94387817382813}', '{\"x\":-1147.1197509765626,\"y\":4924.49365234375,\"z\":221.0422821044922}', '[{\"z\":220.0622821044922,\"y\":4924.49365234375,\"h\":266.1464538574219,\"x\":-1147.11962890625}]', NULL, b'0', 'aircraft'),
(128, 'garagage_cayo_boat', 'Garage Bateau Cayo 2', '{\"x\":5107.52197265625,\"y\":-5141.57861328125,\"z\":1.9295310974121}', '{\"x\":5099.15771484375,\"y\":-5144.77587890625,\"z\":0.8231183886528}', '[{\"y\":-5138.439453125,\"z\":-1.40483758926391,\"h\":6.67044925689697,\"x\":5099.57763671875}]', NULL, b'1', 'boat'),
(129, 'garage_concessbat', 'Garage Concessionaire Bateau', '{\"x\":-818.9013061523438,\"y\":-1332.8189697265626,\"z\":5.15027046203613}', '{\"x\":-819.4707641601563,\"y\":-1328.5247802734376,\"z\":4.96019220352172}', '[{\"y\":-1319.9766845703126,\"z\":4.02038242340087,\"h\":170.197265625,\"x\":-802.7223510742188},{\"y\":-1319.4197998046876,\"z\":4.02038242340087,\"h\":167.89239501953126,\"x\":-805.9002075195313},{\"y\":-1318.506103515625,\"z\":4.02038290023803,\"h\":170.8159637451172,\"x\":-812.2129516601563},{\"y\":-1318.093017578125,\"z\":4.02038290023803,\"h\":169.17074584960938,\"x\":-815.4971923828125}]', NULL, b'1', 'car'),
(130, 'garage_cayo_2', 'Garage Cayo Port2', '{\"x\":5116.791015625,\"y\":-5151.939453125,\"z\":2.22185373306274}', '{\"x\":5117.86767578125,\"y\":-5145.7822265625,\"z\":2.21747875213623}', '[{\"y\":-5143.97705078125,\"z\":1.27463652610778,\"h\":263.3028564453125,\"x\":5124.59619140625},{\"y\":-5147.92236328125,\"z\":1.27586414337158,\"h\":271.980712890625,\"x\":5124.552734375}]', NULL, b'1', 'car'),
(132, 'garage_mdo', 'Garage MDO', '{\"x\":505.87646484375,\"y\":-2751.998779296875,\"z\":3.07056069374084}', '{\"x\":493.8986511230469,\"y\":-2750.306884765625,\"z\":3.06857585906982}', '[{\"z\":2.08857681274414,\"y\":-2755.19580078125,\"h\":58.18820190429687,\"x\":497.1167907714844},{\"z\":2.08857776641845,\"y\":-2750.635009765625,\"h\":53.6551628112793,\"x\":500.1897888183594}]', NULL, b'0', 'car'),
(134, 'public_car_ferraileur', 'Public Voiture Ferraileur', '{\"x\":-610.0995483398438,\"y\":-1600.614013671875,\"z\":26.75094985961914}', '{\"x\":-617.2157592773438,\"y\":-1597.252685546875,\"z\":26.75104331970215}', '[{\"h\":176.24317932128907,\"y\":-1604.643310546875,\"z\":25.77090217590332,\"x\":-616.1162109375},{\"h\":177.82656860351563,\"y\":-1604.0159912109376,\"z\":25.77089836120605,\"x\":-619.6400146484375}]', NULL, b'0', 'car'),
(135, 'car_ferrailleur', 'Car Ferailleur', '{\"z\":19.89323234558105,\"y\":-1637.40869140625,\"x\":-588.0247192382813}', '{\"z\":19.42362785339355,\"y\":-1641.89990234375,\"x\":-576.853271484375}', '[{\"z\":18.18842124938965,\"y\":-1670.8741455078126,\"h\":217.5349884033203,\"x\":-544.2828369140625}]', NULL, b'0', 'car'),
(136, 'car_fishingshop', 'Garage Voiture Magasin de Pêche', '{\"x\":-1584.752685546875,\"y\":5160.9833984375,\"z\":19.58101844787597}', '{\"x\":-1576.759033203125,\"y\":5159.1103515625,\"z\":19.82819557189941}', '[{\"z\":19.05468704223632,\"x\":-1575.7769775390626,\"h\":189.51406860351563,\"y\":5148.5244140625},{\"z\":18.79414321899414,\"x\":-1576.9586181640626,\"h\":188.10086059570313,\"y\":5160.19677734375},{\"z\":18.59743835449218,\"x\":-1577.9119873046876,\"h\":186.47402954101563,\"y\":5169.88916015625}]', NULL, b'0', 'car'),
(137, 'car_ambulance_pillbox', 'Car Hopital Pillbox', '{\"x\":290.171630859375,\"y\":-613.9199829101563,\"z\":43.41739273071289}', '{\"x\":293.15594482421877,\"y\":-603.4583740234375,\"z\":43.18959045410156}', '[{\"z\":42.26311828613281,\"y\":-605.08837890625,\"x\":298.056396484375,\"h\":70.91507720947266},{\"z\":42.28112747192383,\"y\":-607.9602661132813,\"x\":296.74169921875,\"h\":73.53289794921875},{\"z\":42.27400161743164,\"y\":-610.71923828125,\"x\":295.5705871582031,\"h\":70.23450469970703}]', NULL, b'0', 'car'),
(138, 'car_concess', 'Car Concess', '{\"x\":-61.22586059570312,\"y\":-1118.4041748046876,\"z\":26.6702766418457}', '{\"x\":-56.76041793823242,\"y\":-1109.3792724609376,\"z\":26.64000511169433}', '[{\"z\":25.69027854919433,\"h\":343.73321533203127,\"x\":-50.618408203125,\"y\":-1118.281982421875},{\"z\":25.69027854919433,\"h\":345.4765625,\"x\":-47.12794876098633,\"y\":-1118.2901611328126},{\"z\":25.69027854919433,\"h\":345.70367431640627,\"x\":-43.86502838134765,\"y\":-1118.068359375},{\"z\":25.69027854919433,\"h\":70.80653381347656,\"x\":-47.31034088134765,\"y\":-1112.211669921875},{\"z\":25.69027854919433,\"h\":70.80704498291016,\"x\":-51.72645568847656,\"y\":-1110.669677734375},{\"z\":25.61979248046875,\"h\":70.80413818359375,\"x\":-57.5740852355957,\"y\":-1108.6336669921876},{\"z\":25.22789337158203,\"h\":70.80377197265625,\"x\":-64.13185119628906,\"y\":-1106.3509521484376}]', NULL, b'0', 'car'),
(139, 'car_bar_yoat', 'Car Bar Yoat', '{\"x\":-2089.5498046875,\"y\":-493.1549987792969,\"z\":12.10329723358154}', '{\"x\":-2095.441650390625,\"y\":-487.9952392578125,\"z\":12.10329246520996}', '[{\"h\":323.42620849609377,\"x\":-2101.4248046875,\"z\":11.12329723358154,\"y\":-495.8895263671875},{\"h\":311.3534851074219,\"x\":-2104.49658203125,\"z\":11.12330867767334,\"y\":-493.578369140625},{\"h\":320.4789733886719,\"x\":-2107.156005859375,\"z\":11.12331153869628,\"y\":-490.89849853515627}]', NULL, b'0', 'car'),
(142, 'Port pour Bateaux', 'Port pour bateaux', '{\"x\":-1605.132568359375,\"y\":5257.88134765625,\"z\":2.08127665519714}', '{\"x\":-1602.8970947265626,\"y\":5259.49560546875,\"z\":1.29701089859008}', '[{\"h\":276.78887939453127,\"x\":-1602.6275634765626,\"z\":0.31890322685241,\"y\":5259.53125}]', NULL, b'1', 'boat'),
(143, 'police_avions', 'Garage AERIENS LSPD', '{\"z\":37.69956970214844,\"y\":-838.765625,\"x\":-1103.6805419921876}', '{\"x\":-1095.3651123046876,\"y\":-835.1447143554688,\"z\":37.67564392089844}', '[{\"x\":-1095.3651123046876,\"z\":36.67564392089844,\"y\":-835.1463012695313,\"h\":303.7812194824219}]', NULL, b'0', 'aircraft'),
(144, 'car_mecano', 'Garage Voitures MECANO', '{\"z\":5.9202332496643,\"y\":-3006.03662109375,\"x\":164.16976928710938}', '{\"z\":5.81033897399902,\"y\":-3007.189208984375,\"x\":173.20745849609376}', '[{\"x\":173.19778442382813,\"z\":4.77379991531372,\"y\":-3000.333984375,\"h\":179.32867431640626},{\"x\":166.33697509765626,\"z\":4.89787675857543,\"y\":-2999.457763671875,\"h\":260.9499206542969},{\"x\":165.23562622070313,\"z\":4.91464426040649,\"y\":-2992.392578125,\"h\":265.871826171875},{\"x\":171.19012451171876,\"z\":4.9061174583435,\"y\":-2986.0048828125,\"h\":181.87437438964845}]', NULL, b'1', 'car'),
(145, 'Garage Public', 'Garage Public', '{\"x\":-284.3032531738281,\"y\":-887.8734130859375,\"z\":31.08257484436035}', '{\"x\":-300.98114013671877,\"y\":-898.723876953125,\"z\":31.08490753173828}', '[{\"h\":322.666015625,\"z\":30.10257484436035,\"y\":-900.7592163085938,\"x\":-281.5027160644531}]', NULL, b'1', 'car'),
(146, 'gouv', 'GOUV', '{\"x\":-1320.3135986328126,\"y\":-575.2914428710938,\"z\":20.80276679992675}', '{\"x\":-1325.640380859375,\"y\":-570.44384765625,\"z\":20.80278205871582}', '[{\"x\":-1328.6201171875,\"h\":39.70823669433594,\"y\":-565.6211547851563,\"z\":19.82278205871582},{\"x\":-1332.0635986328126,\"h\":35.42756271362305,\"y\":-568.2789306640625,\"z\":19.82278205871582},{\"x\":-1335.89306640625,\"h\":53.55256271362305,\"y\":-570.8024291992188,\"z\":19.82278205871582}]', NULL, b'0', 'car'),
(147, 'maragarage', 'Garage Marabunta', '{\"x\":1427.78076171875,\"y\":-1505.8560791015626,\"z\":61.50306701660156}', '{\"x\":1422.49951171875,\"y\":-1504.8616943359376,\"z\":60.93706130981445}', '[{\"h\":107.12008666992188,\"x\":1426.923095703125,\"z\":60.23641159057617,\"y\":-1511.739990234375}]', NULL, b'1', 'car'),
(149, 'f4lgarage', 'Garage Families', '{\"x\":-187.4945831298828,\"y\":-1582.4420166015626,\"z\":34.88184356689453}', '{\"x\":-189.53089904785157,\"y\":-1585.3377685546876,\"z\":34.77165603637695}', '[{\"h\":233.4456024169922,\"x\":-184.95172119140626,\"z\":33.87292434692383,\"y\":-1587.8065185546876}]', NULL, b'0', 'car'),
(150, 'Vagos', 'vagos', '{\"x\":324.5423278808594,\"y\":-2049.70751953125,\"z\":20.93645477294922}', '{\"x\":329.33355712890627,\"y\":-2042.5799560546876,\"z\":20.80028533935547}', '[{\"x\":322.8914489746094,\"h\":128.5382080078125,\"z\":19.6742682647705,\"y\":-2036.6461181640626},{\"x\":327.5854797363281,\"h\":307.098876953125,\"z\":20.07199813842773,\"y\":-2027.775390625},{\"x\":323.06378173828127,\"h\":55.13589096069336,\"z\":19.89092208862304,\"y\":-2024.0306396484376},{\"x\":313.52142333984377,\"h\":106.54192352294922,\"z\":19.5598941040039,\"y\":-2028.83837890625}]', NULL, b'0', 'car'),
(151, 'Tijuana', 'tijuana', '{\"x\":-1536.0914306640626,\"z\":56.77658081054687,\"y\":98.09953308105468}', '{\"x\":-1525.1268310546876,\"z\":56.53980255126953,\"y\":83.66851806640625}', '[{\"x\":-1524.013916015625,\"h\":226.6734161376953,\"z\":55.60037948608399,\"y\":93.90995025634766},{\"x\":-1505.0577392578126,\"h\":269.8789978027344,\"z\":54.41259338378906,\"y\":86.1678695678711},{\"x\":-1492.644775390625,\"h\":268.0527038574219,\"z\":54.00967361450195,\"y\":86.06815338134766}]', NULL, b'0', 'car'),
(153, 'Garage Madrazo', 'garage madrazo', '{\"x\":1407.7626953125,\"y\":1114.64794921875,\"z\":114.8365707397461}', '{\"x\":1406.7349853515626,\"y\":1118.9608154296876,\"z\":114.8365707397461}', '[{\"z\":113.85657073974609,\"y\":1117.6748046875,\"h\":88.91472625732422,\"x\":1401.7916259765626},{\"z\":113.85657073974609,\"y\":1118.0120849609376,\"h\":87.58641815185547,\"x\":1393.578125},{\"z\":113.74639465332031,\"y\":1118.36572265625,\"h\":85.29998779296875,\"x\":1385.721923828125},{\"z\":113.38358642578125,\"y\":1121.7432861328126,\"h\":39.03710174560547,\"x\":1376.7080078125}]', NULL, b'0', 'car'),
(154, 'Garage Avion Madrazo', 'garage avion madrazo', '{\"x\":1470.689208984375,\"y\":1068.0760498046876,\"z\":114.33401489257813}', '{\"x\":1486.794921875,\"y\":1067.552490234375,\"z\":114.33403015136719}', '[{\"z\":113.35429718017578,\"y\":1066.3797607421876,\"h\":268.3351745605469,\"x\":1491.27880859375}]', NULL, b'0', 'aircraft'),
(156, 'Garage Sinaloa', 'garage sinaloa', '{\"x\":-125.03701782226563,\"y\":1010.5819702148438,\"z\":235.7320556640625}', '{\"x\":-113.91124725341797,\"y\":1005.9000244140625,\"z\":235.76829528808595}', '[{\"y\":1004.9984741210938,\"h\":193.6675262451172,\"x\":-126.56523132324219,\"z\":234.75200988769533},{\"y\":999.8427734375,\"h\":199.89303588867188,\"x\":-125.02681732177735,\"z\":234.7533221435547},{\"y\":994.6187744140625,\"h\":199.44113159179688,\"x\":-123.13682556152344,\"z\":234.77758361816408},{\"y\":986.9352416992188,\"h\":197.5816650390625,\"x\":-120.3587646484375,\"z\":234.76899291992189}]', NULL, b'0', 'car'),
(158, 'Garage Cartel Del Cayo Perico', 'Garage perico', '{\"x\":4993.8095703125,\"y\":-5736.96533203125,\"z\":19.88006591796875}', '{\"x\":4983.34130859375,\"y\":-5729.72900390625,\"z\":19.88018417358398}', '[{\"y\":-5704.8193359375,\"z\":18.9069400024414,\"x\":4976.67626953125,\"h\":40.39381790161133},{\"y\":-5698.3671875,\"z\":18.9069400024414,\"x\":4971.0400390625,\"h\":46.08465194702148},{\"y\":-5693.337890625,\"z\":18.99365188598632,\"x\":4966.60107421875,\"h\":33.15856170654297},{\"y\":-5686.4765625,\"z\":19.4651847076416,\"x\":4961.966796875,\"h\":28.88950538635254}]', NULL, b'0', 'car'),
(161, 'policee', 'Garage Police', '{\"x\":-1072.366943359375,\"y\":-820.0678100585938,\"z\":7.93070602416992}', '{\"x\":-1075.000732421875,\"y\":-815.5618896484375,\"z\":7.93070888519287}', '[{\"h\":58.72843551635742,\"x\":-1042.64599609375,\"y\":-858.1121215820313,\"z\":3.8870186805725},{\"h\":59.38460540771484,\"x\":-1045.3463134765626,\"y\":-861.7276611328125,\"z\":3.94648792266845},{\"h\":60.45411682128906,\"x\":-1040.2095947265626,\"y\":-854.9738159179688,\"z\":3.89801837921142},{\"h\":203.3759002685547,\"x\":-1047.8822021484376,\"y\":-846.5604248046875,\"z\":3.88789608001709},{\"h\":190.64291381835936,\"x\":-1051.884521484375,\"y\":-847.0213012695313,\"z\":3.88774539947509},{\"h\":42.38339614868164,\"x\":-1048.3896484375,\"y\":-864.3829345703125,\"z\":4.00958730697631},{\"h\":86.94438171386719,\"x\":-1051.4952392578126,\"y\":-867.2533569335938,\"z\":4.14954950332641}]', NULL, b'0', 'car'),
(162, 'car_motoconcess', 'Garage Concessionaire Moto', '{\"x\":1233.0850830078126,\"y\":2722.7822265625,\"z\":38.00437545776367}', '{\"x\":1225.437255859375,\"y\":2711.668212890625,\"z\":38.00602340698242}', '[{\"z\":37.00603866577148,\"x\":1244.7178955078126,\"h\":187.16656494140626,\"y\":2714.170654296875}]', NULL, b'0', 'car'),
(164, 'car_bresil', 'Brazil', '{\"y\":-173.3983154296875,\"z\":109.40011596679688,\"x\":1327.655029296875}', '{\"y\":-167.30075073242188,\"z\":109.91578674316406,\"x\":1327.0101318359376}', '[{\"y\":-183.72471618652345,\"z\":107.18307067871094,\"x\":1323.4105224609376,\"h\":120.13448333740236}]', NULL, b'0', 'car'),
(167, 'GARAGE MAISON', 'Maison', '{\"x\":-666.33642578125,\"y\":910.2666625976564,\"z\":229.66441345214845}', '{\"x\":-677.3367919921875,\"y\":903.1796875,\"z\":230.57537841796876}', '[{\"h\":153.6164093017578,\"x\":-677.3375854492188,\"y\":903.181396484375,\"z\":229.59537841796877}]', NULL, b'0', 'car'),
(171, 'car_shelby', 'shelby', '{\"x\":-886.6439208984375,\"y\":-55.33827972412109,\"z\":38.05001068115234}', '{\"x\":-880.9474487304688,\"y\":-58.77084350585937,\"z\":38.05235290527344}', '[{\"x\":-881.4193115234375,\"y\":-58.66744995117187,\"z\":37.07239868164063,\"h\":91.35990905761719}]', NULL, b'0', 'car'),
(172, 'garage armada', 'garage armada', '{\"x\":1657.46240234375,\"y\":3800.102783203125,\"z\":35.1667366027832}', '{\"x\":1665.6917724609376,\"y\":3812.97607421875,\"z\":34.7496223449707}', '[{\"y\":3816.457275390625,\"z\":33.95364334106445,\"x\":1673.3037109375,\"h\":310.64947509765627},{\"y\":3820.5244140625,\"z\":33.92891647338867,\"x\":1670.5941162109376,\"h\":36.86249923706055},{\"y\":3828.042724609375,\"z\":33.91107894897461,\"x\":1670.5267333984376,\"h\":320.7679138183594}]', NULL, b'0', 'car'),
(173, 'Orga Benigas', 'Orga', '{\"x\":-1741.9151611328126,\"y\":370.1647644042969,\"z\":89.72389221191406}', '{\"x\":-1749.916015625,\"y\":365.8594665527344,\"z\":89.72460174560547}', '[{\"z\":88.57701873779297,\"x\":-1754.099853515625,\"h\":97.19391632080078,\"y\":363.827880859375}]', NULL, b'0', 'car'),
(176, 'QG portugais', 'portugais', '{\"x\":2461.337158203125,\"y\":1589.4320068359376,\"z\":33.02364730834961}', '{\"x\":2480.794921875,\"y\":1589.3040771484376,\"z\":32.7203369140625}', '[{\"z\":31.7403369140625,\"y\":1589.25146484375,\"x\":2469.7939453125,\"h\":271.5403747558594}]', NULL, b'0', 'car'),
(177, 'garage bloods', 'QG bloods', '{\"y\":-398.4623718261719,\"z\":42.10346984863281,\"x\":-1552.3505859375}', '{\"x\":-1554.503173828125,\"y\":-402.40191650390627,\"z\":41.98769760131836}', '[{\"y\":-408.3230895996094,\"z\":41.00944854736328,\"x\":-1542.2557373046876,\"h\":323.60809326171877}]', NULL, b'1', 'car'),
(178, 'Mafia Corse', 'Mafia Corse', '{\"x\":3421.729248046875,\"y\":4931.25,\"z\":36.00087356567383}', '{\"x\":3443.843994140625,\"y\":4894.30126953125,\"z\":36.00006866455078}', '[{\"z\":35.02004196166992,\"h\":223.3336944580078,\"x\":3409.631591796875,\"y\":4915.84765625}]', NULL, b'0', 'car'),
(181, 'Mc Reary', 'orga', '{\"x\":121.67609405517578,\"y\":-3200.2841796875,\"z\":5.9872179031372}', '{\"x\":138.94760131835938,\"y\":-3200.73974609375,\"z\":5.85758972167968}', '[{\"h\":88.76174926757813,\"y\":-3203.937255859375,\"z\":4.89465286254882,\"x\":128.037109375}]', NULL, b'1', 'car'),
(182, 'taxi', 'Garage taxi', '{\"x\":903.9615478515624,\"y\":-192.30490112304688,\"z\":73.79716491699219}', '{\"x\":906.9644775390624,\"y\":-186.7869110107422,\"z\":73.98918914794922}', '[{\"x\":916.642822265625,\"h\":97.49213409423828,\"y\":-170.54254150390626,\"z\":73.47147705078125},{\"x\":918.6961059570313,\"h\":101.0241241455078,\"y\":-166.83184814453126,\"z\":73.67174865722656},{\"x\":920.528564453125,\"h\":94.64281463623049,\"y\":-163.4601593017578,\"z\":73.86370422363281},{\"x\":913.95947265625,\"h\":15.42985534667968,\"y\":-160.09701538085938,\"z\":73.77204467773437},{\"x\":912.0745239257813,\"h\":12.35419082641601,\"y\":-164.31100463867188,\"z\":73.37942077636719}]', NULL, b'0', 'car'),
(183, 'Garage Aztecas', 'Aztecas', '{\"x\":1291.9512939453126,\"y\":-1734.164794921875,\"z\":53.31422805786133}', '{\"x\":1299.5484619140626,\"y\":-1729.7181396484376,\"z\":53.93722152709961}', '[{\"h\":72.2520751953125,\"z\":52.59052993774414,\"y\":-1727.4686279296876,\"x\":1291.93798828125}]', NULL, b'1', 'car'),
(184, 'garage BALLAS', 'BALLAS', '{\"x\":90.79063415527344,\"y\":-1965.2176513671876,\"z\":20.74761581420898}', '{\"x\":103.06725311279296,\"y\":-1958.7442626953128,\"z\":20.78756713867187}', '[{\"h\":324.4893493652344,\"x\":86.17149353027344,\"y\":-1970.8966064453128,\"z\":19.76760246276855}]', NULL, b'0', 'car'),
(185, 'grimbastards', 'Grim Bastards', '{\"x\":1009.2570190429688,\"y\":-2337.831298828125,\"z\":30.50954437255859}', '{\"x\":1008.8661499023438,\"y\":-2326.488525390625,\"z\":30.50954437255859}', '[{\"x\":1010.6676025390625,\"h\":1.46527278423309,\"z\":29.52954437255859,\"y\":-2332.6962890625},{\"x\":1004.3685302734375,\"h\":263.2546081542969,\"z\":29.52955963134765,\"y\":-2322.531005859375},{\"x\":1013.1175537109375,\"h\":268.6911926269531,\"z\":29.52966072082519,\"y\":-2323.127197265625},{\"x\":1021.40087890625,\"h\":267.95855712890627,\"z\":29.52990295410156,\"y\":-2323.393310546875},{\"x\":1013.19677734375,\"h\":262.8256530761719,\"z\":29.52955390930175,\"y\":-2328.103271484375}]', NULL, b'0', 'car'),
(186, 'Garage crips', 'crips', '{\"x\":-355.300048828125,\"y\":36.81980514526367,\"z\":47.93883895874023}', '{\"x\":-355.61419677734377,\"y\":32.76387786865234,\"z\":47.79976654052734}', '[{\"h\":75.19951629638672,\"x\":-356.4208679199219,\"y\":26.43916893005371,\"z\":46.7397494506836}]', NULL, b'0', 'car'),
(187, 'Lost MC', 'Lost MC', '{\"x\":99.4273910522461,\"z\":40.00745010375976,\"y\":3630.37841796875}', '{\"x\":91.17222595214844,\"z\":40.00739669799805,\"y\":3630.53271484375}', '[{\"x\":80.08208465576172,\"h\":180.07305908203126,\"z\":38.73035385131836,\"y\":3628.320068359375}]', NULL, b'0', 'car'),
(188, 'chumash villa', 'garage', '{\"x\":-3197.222412109375,\"y\":835.1548461914063,\"z\":8.92842960357666}', '{\"x\":-3200.454833984375,\"y\":835.90576171875,\"z\":8.92842006683349}', '[{\"z\":7.94709732055664,\"h\":209.23085021972657,\"x\":-3214.61767578125,\"y\":834.76904296875}]', NULL, b'1', 'car'),
(189, 'avocat', 'Garage Avocat', '{\"x\":-1894.427490234375,\"y\":-565.2899169921875,\"z\":11.79779815673828}', '{\"x\":-1899.515625,\"y\":-559.9099731445313,\"z\":11.78170013427734}', '[{\"y\":-554.9105834960938,\"x\":-1897.011474609375,\"h\":229.5812530517578,\"z\":10.75998165130615}]', NULL, b'0', 'car'),
(190, 'black', 'Black', '{\"x\":-1224.416015625,\"y\":-1331.0675048828126,\"z\":4.23207712173461}', '{\"x\":-1223.567138671875,\"y\":-1326.421142578125,\"z\":4.30115413665771}', '[{\"y\":-1318.1571044921876,\"h\":204.88548278808595,\"x\":-1223.9144287109376,\"z\":3.33791019439697},{\"y\":-1321.366455078125,\"h\":204.99365234375,\"x\":-1222.30517578125,\"z\":3.37879230499267},{\"y\":-1324.874267578125,\"h\":206.35353088378907,\"x\":-1220.6336669921876,\"z\":3.46459724426269},{\"y\":-1329.5670166015626,\"h\":206.40814208984376,\"x\":-1218.291748046875,\"z\":3.54646875381469}]', NULL, b'0', 'car'),
(191, 'villa golf', 'villagolf', '{\"x\":-1101.2967529296876,\"y\":354.7383728027344,\"z\":68.49002838134766}', '{\"x\":-1097.23974609375,\"y\":361.2596130371094,\"z\":68.56814575195313}', '[{\"z\":67.65481140136719,\"y\":363.4564514160156,\"x\":-1100.5645751953126,\"h\":2.87913227081298}]', NULL, b'0', 'car'),
(192, 'bmf', 'bmf', '{\"x\":-70.6197738647461,\"y\":359.0802001953125,\"z\":112.4451675415039}', '{\"x\":-81.07154846191406,\"y\":361.35638427734377,\"z\":112.45529174804688}', '[{\"y\":331.21405029296877,\"z\":109.98242523193359,\"h\":156.37623596191407,\"x\":-61.63435745239258},{\"y\":340.1485900878906,\"z\":110.87289001464844,\"h\":149.5245819091797,\"x\":-57.49740219116211},{\"y\":347.2595520019531,\"z\":111.32155181884765,\"h\":152.3566131591797,\"x\":-54.10580062866211},{\"y\":355.7123718261719,\"z\":111.46273376464844,\"h\":244.65887451171876,\"x\":-69.22036743164063},{\"y\":360.2382507324219,\"z\":111.46146728515625,\"h\":242.16334533691407,\"x\":-79.74005126953125}]', NULL, b'0', 'car'),
(193, 'lscustom', 'LsCustom', '{\"x\":-358.84112548828127,\"y\":-123.28543090820313,\"z\":38.6994514465332}', '{\"x\":-357.6548156738281,\"y\":-120.08515930175781,\"z\":38.69968032836914}', '[{\"h\":122.03469848632813,\"x\":-371.2437744140625,\"y\":-111.7144775390625,\"z\":37.70136215209961}]', NULL, b'0', 'car'),
(194, 'villa choty', 'villachoty', '{\"x\":-2922.7705078125,\"y\":2193.01318359375,\"z\":39.92461013793945}', '{\"x\":-2918.999267578125,\"y\":2188.794677734375,\"z\":39.92461013793945}', '[{\"x\":-2922.85791015625,\"h\":193.25897216796876,\"y\":2184.924560546875,\"z\":38.94555618286133}]', NULL, b'0', 'car'),
(195, 'sandyambu', 'SandyAmbulance', '{\"x\":1740.4522705078126,\"y\":3607.72265625,\"z\":34.81052780151367}', '{\"x\":1750.4815673828126,\"y\":3613.822021484375,\"z\":34.81367492675781}', '[{\"z\":33.91902877807617,\"h\":299.1805114746094,\"x\":1753.2158203125,\"y\":3605.482666015625},{\"z\":33.91158248901367,\"h\":290.0272521972656,\"x\":1754.964599609375,\"y\":3602.7119140625},{\"z\":33.84419967651367,\"h\":302.48211669921877,\"x\":1759.3780517578126,\"y\":3605.630859375},{\"z\":33.81890441894531,\"h\":326.2236022949219,\"x\":1760.67626953125,\"y\":3609.023681640625}]', NULL, b'0', 'car'),
(196, 'SandyBcso', 'SandyBcso', '{\"x\":1809.888916015625,\"y\":3677.284912109375,\"z\":34.18643569946289}', '{\"x\":1816.80517578125,\"y\":3672.885009765625,\"z\":34.1981315612793}', '[{\"z\":33.20640518188477,\"h\":178.1666259765625,\"x\":1810.7325439453126,\"y\":3676.702392578125},{\"z\":33.20640518188477,\"h\":117.62921142578125,\"x\":1815.580322265625,\"y\":3670.314453125},{\"z\":33.20607330322266,\"h\":31.19478988647461,\"x\":1818.1549072265626,\"y\":3676.796142578125}]', NULL, b'0', 'car'),
(197, 'bratva', 'bratva', '{\"x\":-879.4432983398438,\"y\":-51.22232818603515,\"z\":38.06123352050781}', '{\"x\":-874.96630859375,\"y\":-55.5462417602539,\"z\":38.12435913085937}', '[{\"h\":296.32843017578127,\"y\":-48.93397903442383,\"z\":37.08321334838867,\"x\":-880.843017578125}]', NULL, b'0', 'car'),
(198, 'garagesams', 'Garage SAMS', '{\"x\":-673.725830078125,\"y\":335.9085998535156,\"z\":78.11831665039063}', '{\"x\":-667.8480834960938,\"y\":341.89154052734377,\"z\":78.11831665039063}', '[{\"x\":-683.71875,\"y\":345.70654296875,\"z\":77.13827087402344,\"h\":83.39512634277344},{\"x\":-672.1041259765625,\"y\":344.7262878417969,\"z\":77.13836242675781,\"h\":77.24403381347656},{\"x\":-660.9474487304688,\"y\":343.59234619140627,\"z\":77.13836242675781,\"h\":76.45431518554688}]', NULL, b'0', 'car'),
(199, 'burgershot', 'BurgerShot', '{\"x\":-1182.6905517578126,\"y\":-880.4954223632813,\"z\":13.81530666351318}', '{\"x\":-1173.02685546875,\"y\":-890.745361328125,\"z\":13.9013557434082}', '[{\"h\":31.36654663085937,\"z\":12.92415477752685,\"y\":-895.425537109375,\"x\":-1170.072998046875},{\"h\":31.78632926940918,\"z\":12.92917205810546,\"y\":-891.1876831054688,\"x\":-1172.4564208984376},{\"h\":34.6491470336914,\"z\":12.92492153167724,\"y\":-886.1316528320313,\"x\":-1175.69677734375},{\"h\":32.8292007446289,\"z\":12.91991378784179,\"y\":-880.19091796875,\"x\":-1179.4859619140626}]', NULL, b'0', 'car'),
(200, 'bennys', 'Benny\'s', '{\"x\":-152.46551513671876,\"y\":-1306.822265625,\"z\":31.27760505676269}', '{\"x\":-158.32705688476563,\"y\":-1306.3902587890626,\"z\":31.31342887878418}', '[{\"y\":-1306.676513671875,\"x\":-158.1458282470703,\"h\":94.25678253173828,\"z\":30.30912544250488},{\"y\":-1306.6123046875,\"x\":-167.2138214111328,\"h\":88.83070373535156,\"z\":30.31470443725586}]', NULL, b'0', 'car'),
(201, 'Garage Plage', 'Voiture', '{\"x\":-1999.71533203125,\"y\":-492.1404724121094,\"z\":11.41647052764892}', '{\"x\":-2058.842041015625,\"y\":-446.2989807128906,\"z\":11.35581302642822}', '[{\"h\":229.8566436767578,\"y\":-470.94976806640627,\"z\":10.41652919769287,\"x\":-2036.076416015625}]', NULL, b'1', 'car'),
(202, 'Garage Triades', 'Voiture', '{\"x\":-1551.9188232421876,\"y\":875.2449951171875,\"z\":181.35064697265626}', '{\"x\":-1551.4085693359376,\"y\":880.6044921875,\"z\":181.32330322265626}', '[{\"h\":283.10638427734377,\"y\":879.36865234375,\"z\":180.388408203125,\"x\":-1541.2301025390626}]', NULL, b'0', 'car');

-- --------------------------------------------------------

--
-- Structure de la table `identity_cards`
--

CREATE TABLE `identity_cards` (
  `UID` longtext NOT NULL,
  `UniqueID` longtext NOT NULL,
  `firstname` longtext NOT NULL,
  `lastname` longtext NOT NULL,
  `dateofbirth` longtext NOT NULL,
  `sex` longtext NOT NULL,
  `height` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `illegal_drugs_circuits`
--

CREATE TABLE `illegal_drugs_circuits` (
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `recolte` longtext DEFAULT NULL,
  `traitement` longtext DEFAULT NULL,
  `animtype` longtext DEFAULT NULL,
  `animdict` longtext DEFAULT NULL,
  `anim` longtext DEFAULT NULL,
  `animtime` int(11) DEFAULT NULL,
  `marker` tinyint(1) DEFAULT 0,
  `props` longtext DEFAULT NULL,
  `name_pooch` longtext DEFAULT NULL,
  `label_pooch` longtext DEFAULT NULL,
  `animtype_t` longtext DEFAULT NULL,
  `animdict_t` longtext DEFAULT NULL,
  `anim_t` longtext DEFAULT NULL,
  `animtime_t` int(11) DEFAULT NULL,
  `marker_t` tinyint(1) DEFAULT 0,
  `props_t` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `illegal_drugs_sell`
--

CREATE TABLE `illegal_drugs_sell` (
  `id` int(11) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `illegal_drugs_sell`
--

INSERT INTO `illegal_drugs_sell` (`id`, `position`, `message`) VALUES
(1, '{\"x\":223.64340209960938,\"y\":361.93609619140627,\"z\":106.01580047607422}', 'Salut, je viens d\'avoir ton contact, rejoins moi !'),
(2, '{\"x\":631.2670288085938,\"y\":126.13030242919922,\"z\":92.8271713256836}', 'J\'ai un paquet de fric pour toi, Rejoins moi !'),
(3, '{\"x\":919.8397827148438,\"y\":-101.06559753417969,\"z\":78.76405334472656}', 'J\'ai envie de m\'évader, rejoins moi !'),
(4, '{\"x\":744.7858276367188,\"y\":-1226.4090576171876,\"z\":24.76889991760254}', 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'),
(5, '{\"x\":48.1136589050293,\"y\":-1617.7509765625,\"z\":29.35910987854004}', 'Salut, je viens d\'avoir ton contact, rejoins moi !'),
(6, '{\"x\":-337.1455993652344,\"y\":-1485.842041015625,\"z\":30.58897018432617}', 'J\'ai un paquet de fric pour toi, Rejoins moi !'),
(7, '{\"x\":866.59130859375,\"y\":-1061.0830078125,\"z\":28.92093086242675}', 'J\'ai envie de m\'évader, rejoins moi !'),
(8, '{\"x\":1139.843994140625,\"y\":-793.9586791992188,\"z\":57.59371185302734}', 'Salut, je viens d\'avoir ton contact, rejoins moi !'),
(9, '{\"x\":1116.4549560546876,\"y\":-975.5618286132813,\"z\":46.4276008605957}', 'J\'ai un paquet de fric pour toi, Rejoins moi !'),
(10, '{\"x\":1255.7490234375,\"y\":-728.9434814453125,\"z\":63.08428955078125}', 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'),
(11, '{\"x\":1347.6109619140626,\"y\":-579.915283203125,\"z\":74.27182006835938}', 'Tu est où ? J\'ai besoin de ta dobe, rejoins moi !'),
(12, '{\"x\":955.7034912109375,\"y\":-1060.512939453125,\"z\":36.9140510559082}', 'Tu as encore du produit magique ? Rejoins moi, je sais que je peux compter sur toi !'),
(13, '{\"x\":1098.948974609375,\"y\":-257.17230224609377,\"z\":69.23422241210938}', 'Tu as encore un peu de produit pour moi ? Rejoins moi !'),
(14, '{\"x\":-337.54510498046877,\"y\":-937.4935913085938,\"z\":31.08061027526855}', 'Tu as encore du produit magique ? Rejoins moi, je sais que je peux compter sur toi !'),
(15, '{\"x\":-321.01458740234377,\"y\":-708.7540283203125,\"z\":32.90948867797851}', 'J\'ai besoin de ta dobe, rejoins moi à la position !'),
(16, '{\"x\":250.98289489746095,\"y\":-84.9937515258789,\"z\":69.94864654541016}', 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'),
(17, '{\"x\":-529.8306274414063,\"y\":-28.73513031005859,\"z\":44.48300170898437}', 'Salut, je viens d\'avoir ton contact, rejoins moi !'),
(18, '{\"x\":-1447.862060546875,\"y\":-366.66900634765627,\"z\":43.54209899902344}', 'J\'ai un paquet de fric pour toi, Rejoins moi !'),
(19, '{\"x\":-1665.5570068359376,\"y\":72.42794036865235,\"z\":63.42919158935547}', 'Tu est où ? J\'ai besoin de ta dobe, rejoins moi !'),
(20, '{\"x\":-1089.6529541015626,\"y\":-303.50421142578127,\"z\":37.64749908447265}', 'Tu as encore un peu de produit pour moi ? Rejoins moi !'),
(21, '{\"x\":67.83145904541016,\"y\":-582.4771728515625,\"z\":31.6286506652832}', 'J\'ai envie de m\'évader, rejoins moi !'),
(22, '{\"x\":508.6759948730469,\"y\":-609.5554809570313,\"z\":24.75115013122558}', 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'),
(23, '{\"x\":460.6315002441406,\"y\":-761.1773071289063,\"z\":27.35788917541504}', 'Tu as encore un peu de produit pour moi ? Rejoins moi !'),
(24, '{\"x\":469.0552062988281,\"y\":-585.181396484375,\"z\":28.49962997436523}', 'J\'ai envie de m\'évader, rejoins moi !'),
(25, '{\"x\":188.4803924560547,\"y\":-446.4894104003906,\"z\":41.65034103393555}', 'Tu as encore du produit magique ? Rejoins moi, je sais que je peux compter sur toi !'),
(26, '{\"x\":-113.11299896240235,\"y\":-603.218994140625,\"z\":36.28079986572265}', 'J\'ai besoin de ta dobe, rejoins moi à la position !'),
(27, '{\"x\":171.55740356445313,\"y\":-1235.2259521484376,\"z\":29.31716918945312}', 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'),
(28, '{\"x\":168.8957061767578,\"y\":-1074.22900390625,\"z\":29.19271087646484}', 'Salut, je viens d\'avoir ton contact, rejoins moi !'),
(29, '{\"x\":-1026.3599853515626,\"y\":-490.5504150390625,\"z\":36.95706939697265}', 'J\'ai un paquet de fric pour toi, Rejoins moi !'),
(30, '{\"x\":-1187.1409912109376,\"y\":-561.4119262695313,\"z\":27.69302940368652}', 'Tu as encore un peu de produit pour moi ? Rejoins moi !'),
(31, '{\"x\":-1625.845947265625,\"y\":-1013.4970092773438,\"z\":13.14282989501953}', 'J\'ai envie de m\'évader, rejoins moi !'),
(32, '{\"x\":-1478.70703125,\"y\":-1007.2210083007813,\"z\":6.27883720397949}', 'Salut, je viens d\'avoir ton contact, rejoins moi !'),
(33, '{\"x\":-1366.8370361328126,\"y\":-1118.6409912109376,\"z\":4.4401888847351}', 'J\'ai un paquet de fric pour toi, Rejoins moi !'),
(34, '{\"x\":-1307.5059814453126,\"y\":-1310.718017578125,\"z\":4.88076877593994}', 'J\'ai envie de m\'évader, rejoins moi !'),
(35, '{\"x\":-1249.5250244140626,\"y\":-1432.083984375,\"z\":4.32881879806518}', 'J\'ai besoin de ta dobe, rejoins moi à la position !'),
(36, '{\"x\":-1105.416015625,\"y\":-1289.6519775390626,\"z\":5.40987110137939}', 'J\'ai envie de m\'évader, rejoins moi !'),
(37, '{\"x\":-862.0740966796875,\"y\":-1225.4300537109376,\"z\":6.1647138595581}', 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'),
(38, '{\"x\":-770.1005859375,\"y\":-1068.8199462890626,\"z\":11.83907032012939}', 'Salut, je viens d\'avoir ton contact, rejoins moi !'),
(39, '{\"x\":-798.7150268554688,\"y\":372.9659118652344,\"z\":87.87606048583985}', 'J\'ai un paquet de fric pour toi, Rejoins moi !'),
(40, '{\"x\":-612.0228881835938,\"y\":333.997802734375,\"z\":85.1166763305664}', 'Tu as encore un peu de produit pour moi ? Rejoins moi !'),
(41, '{\"x\":-7.89298391342163,\"y\":-575.7495727539063,\"z\":37.74507904052734}', 'Tu est où ? J\'ai besoin de ta dobe, rejoins moi !'),
(42, '{\"x\":295.7923889160156,\"y\":-569.9384765625,\"z\":43.26082992553711}', 'Tu as encore du produit magique ? Rejoins moi, je sais que je peux compter sur toi !'),
(43, '{\"x\":382.614501953125,\"y\":-344.03131103515627,\"z\":46.81528091430664}', 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'),
(44, '{\"x\":274.8113098144531,\"y\":-326.7182922363281,\"z\":44.91986083984375}', 'Salut, je viens d\'avoir ton contact, rejoins moi !'),
(45, '{\"x\":182.42529296875,\"y\":-183.635498046875,\"z\":54.1486701965332}', 'J\'ai un paquet de fric pour toi, Rejoins moi !'),
(46, '{\"x\":-29.66706085205078,\"y\":-92.48367309570313,\"z\":57.25431060791015}', 'J\'ai envie de m\'évader, rejoins moi !'),
(47, '{\"x\":-359.9700012207031,\"y\":79.45751190185547,\"z\":63.18901824951172}', 'Tu as encore un peu de produit pour moi ? Rejoins moi !'),
(48, '{\"x\":-275.6081848144531,\"y\":201.5198974609375,\"z\":85.69867706298828}', 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'),
(49, '{\"x\":-448.37420654296877,\"y\":177.04269409179688,\"z\":75.20374298095703}', 'Salut, je viens d\'avoir ton contact, rejoins moi !'),
(50, '{\"x\":-499.0154113769531,\"y\":58.75120162963867,\"z\":56.49613189697265}', 'J\'ai un paquet de fric pour toi, Rejoins moi !');

-- --------------------------------------------------------

--
-- Structure de la table `illegal_laboratory`
--

CREATE TABLE `illegal_laboratory` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `type` longtext DEFAULT NULL,
  `interior` longtext DEFAULT NULL,
  `owner` longtext DEFAULT NULL,
  `pos` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `instagram_account`
--

CREATE TABLE `instagram_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `instagram_followers`
--

CREATE TABLE `instagram_followers` (
  `username` varchar(50) NOT NULL,
  `followed` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `instagram_posts`
--

CREATE TABLE `instagram_posts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(50) NOT NULL,
  `filter` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `instagram_stories`
--

CREATE TABLE `instagram_stories` (
  `owner` varchar(50) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `insta_stories`
--

CREATE TABLE `insta_stories` (
  `username` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  `weight` float NOT NULL DEFAULT 0.3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `rare`, `can_remove`, `weight`) VALUES
('12gauge', '12mm Munition', 0, 1, 0.1),
('556mm', '5.56mm Munition', 0, 1, 0.1),
('5fromages', 'Pizza au 5 fromages', 0, 1, 0.3),
('68kal', 'Kal.68 Munition', 0, 1, 0.1),
('762mm', '7.62mm Munition', 0, 1, 0.1),
('9mm', '9mm Munition', 0, 1, 0.1),
('accesscard', 'Access Card', 0, 1, 0.3),
('advancedrifle', 'CTAR-21', 0, 1, 0.3),
('alive_chicken', 'Poulet vivant', 0, 1, 0.3),
('ananas', 'Ananas', 0, 1, 0.3),
('anchois', 'Anchois', 0, 0, 0),
('anchor', 'Ancre pour bateau', 0, 0, 10),
('appistol', 'Colt SCAMP', 0, 1, 0.3),
('assaultrifle', 'AK 47', 0, 1, 0.3),
('assaultshotgun', 'UTAS UTS-15', 0, 1, 0.3),
('assaultsmg', 'Magpul PDR', 0, 1, 0.3),
('ball', 'ball', 0, 1, 0.3),
('ball_ammo', 'ball_ammo', 0, 1, 0.3),
('bandage', 'Bandage', 0, 1, 0.3),
('bar', 'Bar', 0, 1, 0.3),
('barbecue', 'pizza au barbecue', 0, 1, 0.3),
('bat', 'Baseball Bat', 0, 1, 0.3),
('belini', 'Belini', 0, 1, 0.3),
('bierepleine', 'Bière Pleine', 0, 1, 0.3),
('bierevide', 'Bière Vide', 0, 1, 0.3),
('bijoux', 'Bijoux', 0, 1, 0.3),
('bird_crap_ammo', 'bird_crap_ammo', 0, 1, 0.3),
('black_phone', 'Black Phone', 0, 1, 10),
('blowpipe', 'Chalumeaux', 0, 1, 0.3),
('blowtorch', 'Chalumeau', 0, 1, 0.3),
('blue_phone', 'Téléphone', 0, 1, 0.3),
('bmx', 'BMX', 0, 1, 0.5),
('bodycam', 'Bodycam', 0, 1, 0.3),
('bolcacahuetes', 'Bol de cacahuètes', 0, 1, 0.3),
('bolchips', 'Bol de chips', 0, 1, 0.3),
('bolnoixcajou', 'Bol de noix de cajou', 0, 1, 0.3),
('bolpistache', 'Bol de pistaches', 0, 1, 0.3),
('bottle', 'Bottle', 0, 1, 0.3),
('boulon', 'Boulon', 0, 1, 0.3),
('boulonneuse', 'Boulonneuse', 0, 1, 0.3),
('bouteilleremplie', 'Bouteille remplie', 0, 1, 0.3),
('boutilletvide', 'Boutillet vide', 0, 1, 0.3),
('bread', 'Pain', 0, 1, 0.3),
('brochette', 'Brochette en bois', 0, 1, 0.3),
('bullpuprifle', 'Type 86-S', 0, 1, 0.3),
('bullpupshotgun', 'Kel-Tec KSG', 0, 1, 0.3),
('burgershot_bacon', 'Bacon', 0, 1, 1),
('burgershot_biere', 'Bière', 0, 1, 1),
('burgershot_burger', 'Burger', 0, 1, 2),
('burgershot_cheddar', 'Cheddar', 0, 1, 1),
('burgershot_chesseburger', 'Cheeseburger', 0, 1, 2),
('burgershot_coca', 'Coca Cola', 0, 1, 1),
('burgershot_cookie', 'Cookie', 0, 1, 1),
('burgershot_frite', 'Frite', 0, 1, 1),
('burgershot_milkshake', 'Milkshake', 0, 1, 1),
('burgershot_oignonrings', 'Onion Rings', 0, 1, 1),
('burgershot_pain', 'Pain Burger', 0, 1, 0.3),
('burgershot_painburger', 'Pain Burger', 0, 1, 1),
('burgershot_poulet', 'Nuggets de poulet', 0, 1, 1),
('burgershot_salade', 'Salade', 0, 1, 1),
('burgershot_sprite', 'Sprite', 0, 1, 1),
('burgershot_tomate', 'Tomate', 0, 1, 1),
('burgershot_viandeburger', 'Viande Burger', 0, 1, 1),
('bzgas', 'bz gas', 0, 1, 0.3),
('c4_bank', 'Pain de C4', 0, 1, 0.3),
('cabillaud', 'Cabillaud', 0, 0, 0),
('cacahuete', 'Cacahuète', 0, 1, 0.3),
('cagoule', 'Gagoule', 0, 1, 0.1),
('caissepleine', 'Caisse Pleine', 0, 1, 0.3),
('caissevide', 'Caisse Vide', 0, 1, 0.3),
('calzone', 'Pizza calzone', 0, 1, 0.3),
('canette', 'Canette', 0, 1, 0.3),
('canettefondue', 'Canette Fondue', 0, 1, 0.3),
('canettepropre', 'Canette Propre', 0, 1, 0.3),
('canneapeche', 'Canne à Pêche', 0, 0, 0),
('canneapechecarbonne', 'Canne à Pêche en carbonne', 0, 0, 0),
('canneapecheoretcarbonne', 'Canne à Pêche aliage Or et Carbonne', 0, 0, 0),
('cappuccino', 'Cappuccino', 0, 1, 0.3),
('caprisun', 'Caprisun', 0, 1, 0.3),
('carassin', 'Carassin', 0, 0, 0),
('carbinerifle', 'M4A1', 0, 1, 0.3),
('carokit', 'Kit carosserie', 0, 1, 0.3),
('carotool', 'outils carosserie', 0, 1, 0.3),
('carpecommune', 'Carpe commune', 0, 0, 0),
('carpekoi', 'Carpe koï', 0, 0, 0),
('carpemiroir', 'Carpe miroir', 0, 0, 0),
('carrosserie', 'Carrosserie', 0, 1, 0.3),
('cartesecu', 'Carte d\'acces au pannel 11441188', 0, 1, 0.3),
('casino_beer', 'Casino Beer', 0, 1, -1),
('casino_burger', 'Burger', 0, 1, -1),
('casino_chips', 'Casino Chips', 0, 1, -1),
('casino_coffee', 'Casino Coffee', 0, 1, -1),
('casino_coke', 'Casino Kofola', 0, 1, -1),
('casino_donut', 'Casino Donut', 0, 1, -1),
('casino_ego_chaser', 'Casino Ego Chaser', 0, 1, -1),
('casino_luckypotion', 'Casino Lucky Potion', 0, 1, -1),
('casino_psqs', 'Casino Ps & Qs', 0, 1, -1),
('casino_sandwitch', 'Casino Sandwitch', 0, 1, -1),
('casino_sprite', 'Casino Sprite', 0, 1, -1),
('caviar', 'Caviar', 0, 1, 0.3),
('cerf', 'Cerf', 0, 1, 0.3),
('chaine', 'Chaine de Moto', 0, 1, 0.3),
('chevreuil', 'Chevreuil', 0, 1, 0.3),
('chiffon', 'Chiffon', 0, 1, 0.3),
('chou', 'Chou', 0, 1, 0.3),
('ciseaux', 'Ciseaux', 0, 1, 0.1),
('citron', 'Citron', 0, 1, 0.3),
('classic_phone', 'Classic Phone', 0, 1, 10),
('cles', 'ClÃ©s vÃ©hicules', 0, 1, 0.3),
('clip', 'Chargeur', 0, 1, 0.3),
('coca', 'Coca-Cola', 0, 1, 0.3),
('cocktailmaison', 'Cocktail maison', 0, 1, 0.3),
('coco', 'Coco', 0, 1, 0.3),
('coke', 'Coke', 0, 1, 0.7),
('coke_pooch', 'Pochon de Coke', 0, 1, 1),
('colis', 'Colis', 0, 1, 0.3),
('combatmg', 'M249E1', 0, 1, 0.3),
('combatpdw', 'SIG Sauer MPX', 0, 1, 0.3),
('combatpistol', 'Sig Sauer P228', 0, 1, 0.3),
('compo', 'Composants', 0, 1, 0.3),
('contrat', 'Contrat', 0, 1, 0.3),
('contratlocation', 'Contrat de Location', 0, 1, 0.3),
('contratvente', 'Contrat de Vente', 0, 1, 0.3),
('copper', 'Cuivre', 0, 1, 0.3),
('crepe', 'Crepe', 0, 1, 0.3),
('crick', 'Crick', 0, 1, 0.3),
('crochetage_kit', 'Kit de Crochetage', 0, 0, 1),
('crowbar', 'Crow Bar', 0, 1, 0.3),
('dagger', 'Dagger', 0, 1, 0.3),
('dashcam', 'Dashcam', 0, 1, 0.3),
('diamant', 'Diamant', 0, 1, 0.3),
('diamond', 'Diamant', 0, 1, 0.3),
('digiscanner', 'digiscanner', 0, 1, 0.3),
('dorade', 'Dorade', 0, 1, 0.3),
('doubleaction', 'doubleaction', 0, 1, 0.3),
('douce_lures', 'Appât d\'Eau Douce', 0, 0, 0),
('drill', 'Perceuse', 0, 1, 0.3),
('drink_burgershot', 'Boisson Burgershot', 0, 1, 0.1),
('drpepper', 'Dr. Pepper', 0, 1, 0.3),
('elixir', 'Élixir', 0, 1, 0.3),
('elixirblanco', 'Élixir blanco', 0, 1, 0.3),
('enceinte', 'Enceinte', 0, 1, 0.3),
('enemy_laser_ammo', 'enemy_laser_ammo', 0, 1, 0.3),
('energy', 'Energy Drink', 0, 1, 0.3),
('eperlant', 'Éperlant', 0, 0, 0),
('fakebankingcard', 'Fausse carte bancaire', 0, 1, 0.3),
('fanta', 'Fanta', 0, 1, 0.3),
('ferraille', 'Ferraille', 0, 1, 0.3),
('fichelocation', 'Fiche de location', 0, 1, 0.3),
('fichenotaire', 'Fiche Notariale', 0, 1, 0.3),
('fireextinguisher', 'Fire Extinguisher', 0, 1, 0.3),
('fireextinguisher_ammo', 'fireextinguisher_ammo', 0, 1, 0.3),
('firework', 'Firework', 0, 1, 0.3),
('fish', 'Fish', 0, 1, 0.3),
('fishbait', 'Fish Bait', 0, 1, 0.3),
('fishingrod', 'Canne à pêche', 0, 1, 0.3),
('fixkit', 'Kit réparation', 0, 1, 0.3),
('fixtool', 'outils réparation', 0, 1, 0.3),
('flaregun', 'Flare Gun', 0, 1, 0.3),
('flare_ammo', 'Flares', 0, 1, 0.3),
('frite', 'Frite', 0, 3, 0.3),
('fromage', 'Portion de Fromage', 0, 1, 0.3),
('galette', 'Galette', 0, 1, 0.3),
('garbagebag', 'garbagebag', 0, 1, 0.3),
('garniture', 'Garniture de tacos', 0, 1, 0.3),
('gateauxchance', 'Gâteaux de la chance', 0, 1, 0.3),
('gazbottle', 'bouteille de gaz', 0, 1, 0.3),
('gigatacos', 'Giga tacos', 0, 1, 0.3),
('gigatacosfroid', 'Giga Tacos Froid', 0, 1, 0.3),
('gitanes', 'Gitanes', 0, 1, 0.3),
('glacealitalienne', 'Glace à l\'italienne', 0, 1, 0.3),
('gobeletcoca', 'Gobelelet de coca', 0, 1, 0.3),
('gobeletdecoca', 'Gobelelet de coca', 0, 1, 0.3),
('gobeletdehawai', 'Gobelelet de hawai', 0, 1, 0.3),
('gobeletdeicetea', 'Gobelelet de icetea', 0, 1, 0.3),
('gobeletfanta', 'Gobelelet de fanta', 0, 1, 0.3),
('gobeleticetea', 'Gobelelet de icetea', 0, 1, 0.3),
('gobeletlimonade', 'Gobelet de limonade', 0, 1, 0.3),
('gobeletoasis', 'Gobelelet de Oasis', 0, 1, 0.3),
('gobeletorange', 'Gobelet Orange', 0, 1, 0.3),
('gobeletorangina', 'Gobelelet de Orangina', 0, 1, 0.3),
('gobeletpied', 'Gobelet a Pied', 0, 1, 0.3),
('gobeletsake', 'Gobelet de Sake', 0, 1, 0.3),
('gobeletsheps', 'Gobelet de Sheps', 0, 1, 0.3),
('gobelettropicana', 'Gobelelet de Tropicana', 0, 1, 0.3),
('gobeletvide', 'Gobelet vide', 0, 1, 0.3),
('gobeletvolvic', 'Gobelet de Volvic', 0, 1, 0.3),
('gold', 'Or', 0, 1, 0.3),
('goldbar', 'Gold Bar', 0, 1, 0.3),
('goldnecklace', 'Gold Necklace', 0, 1, 0.3),
('goldwatch', 'Gold Watch', 0, 1, 0.3),
('gold_phone', 'Gold Phone', 0, 1, 10),
('golem', 'Golem', 0, 1, 0.3),
('golfclub', 'Golf Club', 0, 1, 0.3),
('grandefrite', 'Grande Frite', 0, 1, 0.3),
('grandefroidfrite', 'Grande Frite Froid', 0, 1, 0.3),
('grand_cru', 'Grand cru', 0, 1, 0.3),
('grapperaisin', 'Grappe de raisin', 0, 1, 0.3),
('greenlight_phone', 'Green Light Phone', 0, 1, 10),
('green_phone', 'Téléphone Vert', 0, 1, 0.3),
('grenade', 'grenade', 0, 1, 0.3),
('grenadelauncher', 'Milkor MGL', 0, 1, 0.3),
('grenadelauncher_ammo', 'grenadelauncher_ammo', 0, 1, 0.3),
('grenadelauncher_smoke_ammo', 'grenadelauncher_smoke_ammo', 0, 1, 0.3),
('gusenberg', 'M1928A1 Thompson SMG', 0, 1, 0.3),
('gzgas_ammo', 'gzgas_ammo', 0, 1, 0.3),
('hackerDevice', 'Hacker Device', 0, 1, 0.3),
('hammer', 'Hammer', 0, 1, 0.3),
('hammerwirecutter', 'Hammer And Wire Cutter', 0, 1, 0.3),
('handcuffs', 'handcuffs', 0, 1, 0.3),
('hareng', 'Hareng', 0, 0, 0),
('haschich', 'Haschich', 0, 1, 0.3),
('haschich_pooch', 'Haschich', 0, 1, 0.3),
('hashish', 'Hashish', 0, 1, 0.7),
('hashish_pooch', 'Pochon de Hashish', 0, 1, 1),
('hatchet', 'hatchet', 0, 1, 0.3),
('heavypistol', 'EWB 1911', 0, 1, 0.3),
('heavyshotgun', 'Saiga-12K', 0, 1, 0.3),
('heavysniper', 'M107', 0, 1, 0.3),
('heineken', 'Heineken', 0, 1, 0.3),
('hominglauncher', 'SA-7 Grail', 0, 1, 0.3),
('hornys_glace', 'Glace', 0, 1, 0.3),
('ice', 'Glaçon', 0, 1, 0.3),
('icetea', 'Ice Tea', 0, 1, 0.3),
('idcard', 'Carte d\'Identité', 0, 0, 0),
('id_card_f', 'Malicious Access Card', 3, 1, 0.3),
('ing', 'ingredient a pizza', 0, 1, 0.3),
('iron', 'Fer', 0, 1, 0.3),
('jager', 'Jägermeister', 0, 1, 0.3),
('jagerbomb', 'Jägerbomb', 0, 1, 0.3),
('jagercerbere', 'Jäger Cerbère', 0, 1, 0.3),
('jaguar', 'Jaguar', 0, 1, 0.3),
('jewels', 'Bijoux', 0, 1, 0.3),
('jumelles', 'Jumelles', 0, 1, 0.3),
('jusfruit', 'Jus de fruits', 0, 1, 0.3),
('jus_raisin', 'Vin', 0, 1, 0.3),
('kevlar', 'Kevlar', 0, 1, 0.3),
('kevlarlow', 'Kevlar en mauvais état', 0, 1, 0.3),
('kevlarmid', 'Kevlar en bon état', 0, 1, 0.3),
('kitcarro', 'Kit Carosserie', 0, 1, 0.3),
('kitmoteur', 'Kit Moteur', 0, 1, 0.3),
('knife', 'Knife', 0, 1, 0.3),
('knuckle', 'Knuckledusters', 0, 1, 0.3),
('lapin', 'Lapin', 0, 1, 0.3),
('letter', 'Courrier', 0, 1, 0.3),
('lieu', 'Lieu', 0, 1, 0.3),
('limonade', 'Limonade', 0, 1, 0.3),
('lockpick', 'Lockpick', 0, 1, 0.3),
('loup', 'Loup', 0, 1, 0.3),
('machete', 'machete', 0, 1, 0.3),
('machinepistol', 'TEC-9', 0, 1, 0.3),
('macro', 'Macro', 0, 1, 0.3),
('maille', 'Maille de Chaine', 0, 1, 0.3),
('malboro', 'Marlboro', 0, 1, 0.3),
('mangoloco', 'Mangoloco', 0, 1, 0.3),
('marksmanpistol', 'Thompson-Center Contender G2', 0, 1, 0.3),
('marksmanrifle', 'M39 EMR', 0, 1, 0.3),
('martini', 'Martini blanc', 0, 1, 0.3),
('mdma', 'MDMA', 0, 1, 0.3),
('mdma_pooch', 'Pochon de MDMA', 0, 1, 0.3),
('medikit', 'Medikit', 0, 1, 0.3),
('melted_steel', 'Acier Fondue', 0, 1, 0.3),
('menthe', 'Feuille de menthe', 0, 1, 0.3),
('mer_lures', 'Appât d\'Eau de Mer', 0, 0, 0),
('meth', 'Meth', 0, 1, 0.3),
('meth_pooch', 'Pochon de Meth', 0, 1, 0.3),
('metreshooter', 'Mètre de shooter', 0, 1, 0.3),
('mg', 'PKP Pecheneg', 0, 1, 0.3),
('mg_ammo', 'MG Ammo', 0, 1, 0.3),
('microsmg', 'Micro SMG', 0, 1, 0.3),
('minigun', 'minigun', 0, 1, 0.3),
('minigun_ammo', 'Minigun Ammo', 0, 1, 0.3),
('mixapero', 'Mix Apéritif', 0, 1, 0.3),
('mochi', 'Mochi', 0, 1, 0.3),
('mojito', 'Mojito', 0, 1, 0.3),
('molotov', 'Molotov Cocktail', 0, 1, 0.3),
('molotov_ammo', 'molotov_ammo', 0, 1, 0.3),
('morgane', 'Captaine Morgane', 0, 1, 0.3),
('moteur', 'Moteur', 0, 1, 0.3),
('moyennefrite', 'Moyenne Frite', 0, 1, 0.3),
('moyennefroidfrite', 'Moyenne Frite Froid', 0, 1, 0.3),
('musket', 'Brown Bess', 0, 1, 0.3),
('neonbox', 'Neon Box', 0, 1, 1),
('neoncontroller', 'Neon Controller', 0, 1, 1),
('nightstick', 'ASP Baton', 0, 1, 0.3),
('nightvision', 'Night Vision', 0, 1, 0.3),
('nioki', 'Nioki Lustukru', 0, 1, 0.3),
('nitrovehicle', 'Nitro', 0, 1, 0.3),
('nouille', 'Portion de nouille', 0, 1, 0.3),
('oblivionPill', 'Pilule de l\'oubli', 0, 1, 0.3),
('ocean_lures', 'Appât d\'Eau Profonde', 0, 0, 0),
('okonomiyaki', 'Okonomiyaki', 0, 1, 0.3),
('opium', 'Opium', 0, 1, 0.3),
('opium_pooch', 'Pochon d\'Opium', 0, 1, 0.3),
('orange', 'Orange', 0, 1, 0.3),
('orientale', 'Pizza orientale', 0, 1, 0.3),
('pacific_brochettes', 'Brochettes de fruits frais', 0, 1, 0.3),
('pacific_chips', 'Chips de banane plantain', 0, 1, 0.3),
('pacific_coco', 'Eau de coco', 0, 1, 0.3),
('pacific_margarita', 'Margarita ', 0, 1, 0.3),
('pacific_mojito', 'Mojito ', 0, 1, 0.3),
('pacific_pina', 'Piña Colada', 0, 1, 0.3),
('pacific_smoothie', 'Smoothie tropical', 0, 1, 0.3),
('packaged_chicken', 'Poulet en barquette', 0, 1, 0.3),
('papierblanc', 'Papier Blanc', 0, 1, 0.3),
('papiermache', 'Papier maché', 0, 1, 0.3),
('parachute', 'parachute', 0, 1, 0.3),
('pastis', 'Pastis', 0, 1, 0.3),
('pate', 'Pate a pizza', 0, 1, 0.3),
('pattecuite', 'Patte à Pizza Cuite', 0, 1, 0.3),
('pc', 'Pc', 0, 1, 0.3),
('pearls_crevette', 'Crevette', 0, 1, 0.3),
('pearls_fish', 'Poisson', 0, 1, 0.3),
('pearls_fishandchips', 'Fish And Chips', 0, 1, 0.3),
('pearls_frite', 'Frite', 0, 1, 0.3),
('pearls_moule', 'Moule', 0, 1, 0.3),
('pearls_moulefrite', 'Moule Frite', 0, 1, 0.3),
('pepsi', 'Pepsi', 0, 1, 0.3),
('petitefrite', 'Petite Frite', 0, 1, 0.3),
('petitefroidfrite', 'Petite Frite Froid', 0, 1, 0.3),
('petrolcan', 'Petrol Can', 0, 1, 0.3),
('phone', 'Téléphone', 0, 1, 0.3),
('phone_hack', 'Phone Hack', 0, 1, 10),
('phone_module', 'Phone Module', 0, 1, 10),
('pibwasser', 'Pibwasser', 0, 1, 0.3),
('pince', 'Pince', 0, 1, 0.3),
('pink_phone', 'Pink Phone', 0, 1, 10),
('pistol', 'Colt M1911', 0, 1, 0.3),
('pistol50', 'Desert Eagle', 0, 1, 0.3),
('pizza', 'Pizza', 0, 1, 0.3),
('pizzapate', 'Pate a Pizza', 0, 1, 0.3),
('pizzasavoyarde', ' Savoyarde', 0, 1, 0.3),
('plane_rocket_ammo', 'plane_rocket_ammo', 0, 1, 0.3),
('player_laser_ammo', 'player_laser_ammo', 0, 1, 0.3),
('pneu', 'Pneu', 0, 1, 0.3),
('poisson', 'Portion de poisson', 0, 35, 0.3),
('poissonchat', 'Poisson Chat', 0, 0, 0),
('poolcue', 'pool cue', 0, 1, 0.3),
('poolreceipt', 'Reçu de piscine', 0, 1, 0.3),
('pops_donut', 'Donut', 0, 1, 0.3),
('pops_granité', 'Granité', 0, 1, 0.3),
('pops_hotdog', 'Hot Dog', 0, 1, 0.3),
('pops_sauce', 'Sauce', 0, 1, 0.3),
('pops_saucisse', 'Saucisse', 0, 1, 0.3),
('porc', 'Portion de Porc', 0, 35, 0.3),
('potatos', 'Potatos', 0, 5, 0.3),
('poulet', 'Portion de Poulet', 0, 35, 0.3),
('powerbank', 'Power Bank', 0, 1, 10),
('produitchimique', 'Produit Chimique', 0, 1, 0.3),
('proxmine', 'Proxmine Mine', 0, 1, 0.3),
('pumpshotgun', 'Remington 870', 0, 1, 0.3),
('raie', 'Raie', 0, 1, 0.3),
('railgun', 'railgun', 0, 1, 0.3),
('raisin', 'Raisin', 0, 1, 0.3),
('ramen', ' Ramen', 0, 1, 0.3),
('raspberry', 'Raspberry', 0, 1, 0.3),
('reco_burgershot', 'Pain', 0, 1, 0.3),
('reco_ferrailleur', 'Ferraille Rouillée', 0, 1, 0.3),
('reco_petitpecheur', 'Poisson Frais', 0, 1, 0.3),
('reco_tabac', 'Tabac', 0, 1, 0.3),
('reco_vigneron', 'Raisin', 0, 1, 0.3),
('red_phone', 'Red Phone', 0, 1, 10),
('reine', 'Pizza reine', 0, 1, 0.3),
('remotesniper', 'Remote Sniper', 0, 1, 0.3),
('repairkit', 'kit rÃ©paration', 0, 1, 0.3),
('requin', 'Requin', 0, 0, 0),
('rhum', 'Rhum', 0, 1, 0.3),
('rhumcoca', 'Rhum-coca', 0, 1, 0.3),
('rhumfruit', 'Rhum-jus de fruits', 0, 1, 0.3),
('ricard', 'Ricard', 0, 1, 0.3),
('rifle_ammo', 'Rifle Ammo', 0, 1, 0.3),
('riz', 'Portion de riz', 0, 1, 0.3),
('rpg', 'RPG-7', 0, 1, 0.3),
('rpg_ammo', 'RPG Ammo', 0, 1, 0.3),
('sac_poubelle', 'Sac Poubelle', 0, 1, 0.2),
('salami', 'Salami', 0, 1, 0.3),
('sanglier', 'Sanglier', 0, 1, 0.3),
('sardine', 'sardine', 0, 1, 0.3),
('sauce', 'Portion de sauce', 0, 1, 0.3),
('saucisson', 'Saucisson', 0, 1, 0.3),
('saumon', 'saumon', 0, 1, 0.3),
('saumons', 'Pizza au saumon', 0, 1, 0.3),
('sawnoffshotgun', 'Mossberg 500', 0, 1, 0.3),
('secure_card', 'Secure ID Card', 3, 1, 0.3),
('sfrites', 'Sachet de Frite surgele', 0, 1, 0.3),
('shark', 'Shark', 0, 1, 0.3),
('shisha', 'Shisha', 0, 1, 0.3),
('shotgun_ammo', 'Shotgun Ammo', 0, 1, 0.3),
('silure', 'Silure', 0, 0, 0),
('sim', 'Carte-SIM', 0, 1, 0.3),
('siredward', 'Sir Edward', 0, 1, 0.3),
('slaughtered_chicken', 'Poulet abattu', 0, 1, 0.3),
('smg', 'MP5A3', 0, 1, 0.3),
('smg_ammo', 'SMG Ammo', 0, 1, 0.3),
('smokegrenade', 'smoke grenade', 0, 1, 0.3),
('smokegrenade_ammo', 'smokegrenade_ammo', 0, 1, 0.3),
('sniperrifle', 'PSG-1', 0, 1, 0.3),
('sniper_ammo', 'Sniper Ammo', 0, 1, 0.3),
('sniper_remote_ammo', 'Sniper Remote Ammo', 0, 1, 0.3),
('snowball', 'Snow Ball', 0, 1, 0.3),
('snspistol', 'H&K P7', 0, 1, 0.3),
('soda', 'Soda', 0, 1, 0.3),
('sole', 'sole', 0, 0, 0),
('soudeuse', 'Poste à souder', 0, 1, 0.3),
('space_rocket_ammo', 'space_rocket_ammo', 0, 1, 0.3),
('specialcarbine', 'H&K G36C', 0, 1, 0.3),
('spotatoss', 'Sachet de Potatos surgele', 0, 1, 0.3),
('spray_remover', 'Eponge', 1, 1, 0.3),
('sprite', 'Sprite', 0, 1, 0.3),
('steellingo', 'Lingot Acier', 0, 1, 0.3),
('stickybomb', 'sticky bomb', 0, 1, 0.3),
('stickybomb_ammo', 'stickybomb_ammo', 0, 1, 0.3),
('stinger', 'stinger', 0, 1, 0.3),
('stinger_ammo', 'stinger_ammo', 0, 1, 0.3),
('stone', 'Pierre', 0, 1, 0.3),
('stungun', 'X26 Taser', 0, 1, 0.3),
('stungun_ammo', 'Stungun Ammo', 0, 1, 0.3),
('sundayfraise', 'Sunday Fraise', 0, 1, 0.3),
('sundaynature', 'Sunday Nature', 0, 1, 0.3),
('sushi', 'Sushi', 0, 1, 0.3),
('sw', 'Sandwich', 0, 1, 0.3),
('tabacblond', 'Tabac Blond', 0, 1, 0.3),
('tabacblondsec', 'Tabac Blond Séché', 0, 1, 0.3),
('tabacbrun', 'Tabac Brun', 0, 1, 0.3),
('tabacbrunsec', 'Tabac Brun Séché', 0, 1, 0.3),
('tableau', 'Tableau', 0, 1, 0.3),
('tacos2', 'Tacos 2 viandes', 0, 1, 0.3),
('tacos3', 'Tacos 3 viandes', 0, 1, 0.3),
('tacosfroid2', 'Tacos 2 viandes Froid', 0, 1, 0.3),
('tacosfroid3', 'Tacos 3 viandes Froid', 0, 1, 0.3),
('tacosfroidxll', 'Tacos XXL Froid', 0, 1, 0.3),
('tacosl', 'Tacos L', 0, 1, 0.3),
('tacosm', 'Tacos M', 0, 1, 0.3),
('tacosxl', 'Tacos XL', 0, 1, 0.3),
('tacosxll', 'Tacos XXL', 0, 1, 0.3),
('tank_ammo', 'tank_ammo', 0, 1, 0.3),
('tel', 'Téléphone', 0, 1, 0.3),
('tele', 'Télé', 0, 1, 0.3),
('teqpaf', 'Teq\'paf', 0, 1, 0.3),
('tequila', 'Tequila', 0, 1, 0.3),
('thon', 'thon', 0, 1, 0.3),
('tomate', 'Tomate', 0, 1, 0.3),
('trait_burgershot', 'Colis', 0, 1, 0.3),
('trait_ferrailleur', 'Ferraille Traitée', 0, 1, 0.3),
('trait_petitpecheur', 'Poisson Frit', 0, 1, 0.3),
('trait_tabac', 'Cigarette', 0, 1, 0.3),
('trait_vigneron', 'Vin', 0, 1, 0.3),
('treatedsteel', 'Lingot Acier Traité', 0, 1, 0.3),
('turtle', 'Sea Turtle', 0, 1, 0.3),
('turtlebait', 'Turtle Bait', 0, 1, 0.3),
('unicorn_jusorange', 'Jus d\'orange pressé', 0, 1, 0.3),
('unicorn_miniburger', 'Mini-burgers sliders', 0, 1, 0.3),
('unicorn_pepsi', 'Pepsi ', 0, 1, 0.3),
('unicorn_poulet', 'Ailes de poulet épicées', 0, 1, 0.3),
('unicorn_tequila', 'Tequila Sunrise', 0, 1, 0.3),
('unicorn_vodka', 'Vodka Martini', 0, 1, 0.3),
('unicorn_wisky', 'Whisky sour', 0, 1, 0.3),
('usbhacked', 'Clé USB illégale', 0, 1, 0.3),
('vase', 'Vase', 0, 1, 0.3),
('vehicle_case', 'Caisse Véhicules', 0, 0, 0.3),
('viande', 'Portion de viande', 0, 1, 0.3),
('vinblanc', 'Vin Blanc', 0, 1, 0.3),
('vinrose', 'Rose', 0, 1, 0.3),
('vinrouge', 'Vin Rouge', 0, 1, 0.3),
('vintagepistol', 'FN Model 1910', 0, 1, 0.3),
('vodka', 'Vodka', 0, 1, 0.3),
('vodkaenergy', 'Vodka-energy', 0, 1, 0.3),
('vodkafruit', 'Vodka-jus de fruits', 0, 1, 0.3),
('washed_stone', 'Pierre Lavée', 0, 1, 0.3),
('water', 'Eau', 0, 1, 0.3),
('weed', 'Weed', 0, 1, 0.7),
('weed_pooch', 'Pochon de Weed', 0, 1, 1),
('wet_black_phone', 'Wet Black Phone', 0, 1, 10),
('wet_blue_phone', 'Wet Blue Phone', 0, 1, 10),
('wet_classic_phone', 'Wet Classic Phone', 0, 1, 10),
('wet_gold_phone', 'Wet Gold Phone', 0, 1, 10),
('wet_greenlight_phone', 'Wet Green Light Phone', 0, 1, 10),
('wet_green_phone', 'Wet Green Phone', 0, 1, 10),
('wet_phone', 'Wet Phone', 0, 1, 10),
('wet_pink_phone', 'Wet Pink Phone', 0, 1, 10),
('wet_red_phone', 'Wet Red Phone', 0, 1, 10),
('wet_white_phone', 'Wet White Phone', 0, 1, 10),
('whisky', 'Whisky', 0, 1, 0.3),
('whiskycoca', 'Whisky-coca', 0, 1, 0.3),
('white_phone', 'White Phone', 0, 1, 10),
('wire', 'Fil de fer', 0, 1, 0.3),
('wiwang_caviar', 'Caviar', 0, 1, 0.3),
('wiwang_cocktail', 'Cocktail Bora Bora', 0, 1, 0.3),
('wiwang_donperignon', 'Don Perignon', 0, 1, 0.3),
('wiwang_juspassion', 'Jus Passion Mangue', 0, 1, 0.3),
('wiwang_macarons', 'Macarons', 0, 1, 0.3),
('wiwang_ruinart', 'Ruinart', 0, 1, 0.3),
('wiwang_vin', 'Vin', 0, 1, 0.3),
('wrench', 'wrench', 0, 1, 0.3),
('xanax', 'Xanax', 0, 1, 0.3),
('yakitori', 'Yakitori', 0, 1, 0.3);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  `type` int(1) NOT NULL DEFAULT 1,
  `handyservice` varchar(2) NOT NULL DEFAULT '0',
  `hasapp` int(2) NOT NULL DEFAULT 0,
  `onlyboss` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `type`, `handyservice`, `hasapp`, `onlyboss`) VALUES
('airdealer', 'Concessionnaire Aérien', 0, 1, '0', 0, 0),
('ambulance', 'EMS', 0, 1, '0', 0, 0),
('ambulancesandy', 'Ambulance Sandy', 0, 1, '0', 0, 0),
('ballas', 'Ballas', 0, 0, '0', 0, 0),
('boatdealer', 'Concessionnaire Bateau', 0, 1, '0', 0, 0),
('burgershot', 'Burgershot', 0, 1, '0', 0, 0),
('cardealer', 'Concessionnaire', 1, 1, '0', 0, 0),
('gouvernement', 'Gouvernement', 1, 1, '0', 0, 0),
('hornys', 'Horny\'s', 0, 1, '0', 0, 0),
('le_ferailleur', 'Le Férailleur', 0, 1, '0', 0, 0),
('lscustom', 'LsCustoms', 0, 1, '0', 0, 0),
('ltd_ballas', 'LTD Grove Street', 0, 1, '0', 0, 0),
('ltd_f4l', 'LTD Forum Drive', 0, 1, '0', 0, 0),
('ltd_littleseoul', 'LTD Little Seoul', 0, 1, '0', 0, 0),
('ltd_paletobay', 'LTD Paleto Bay', 0, 1, '0', 0, 0),
('mecano', 'Benny\'s', 0, 1, '0', 0, 0),
('motodealer', 'Concessionnaire Moto', 1, 1, '0', 0, 0),
('pacific', 'Pacific Bluffs', 0, 1, '0', 0, 0),
('pearls', 'Pearls', 0, 1, '0', 0, 0),
('petitpecheur', 'Petit Pêcheur', 0, 1, '0', 0, 0),
('police', 'LSPD', 1, 1, '0', 0, 0),
('pops', 'Pop\'s Diner', 0, 1, '0', 0, 0),
('realestateagent', 'Agent Immobilier', 0, 1, '0', 0, 0),
('salieris', 'Salieris', 1, 1, '0', 0, 0),
('saspn', 'BCSO', 0, 1, '0', 0, 0),
('tabac', 'Tabac', 0, 1, '0', 0, 0),
('taxi', 'Taxi', 0, 1, '0', 0, 0),
('unemployed', 'Chomeur', 0, 1, '0', 0, 0),
('unemployed2', 'Chomeur', 0, 0, '0', 0, 0),
('unicorn', 'Unicorn', 0, 1, '0', 0, 0),
('vangelico', 'Vangelico', 0, 1, '0', 0, 0),
('vigne', 'Vigneron', 0, 1, '0', 0, 0),
('weazelnews', 'Weazle News', 0, 1, '0', 0, 0),
('wiwang', 'Wiwang', 0, 1, '0', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `skin_male` longtext DEFAULT NULL,
  `skin_female` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', '', 100, '{}', '{}'),
(2, 'unemployed2', 0, 'rsa', '', 50, '{}', '{}'),
(10, 'police', 1, 'cadet', 'Rookie', 1, '{}', '{}'),
(11, 'police', 2, 'officier1', 'Police Officer I', 0, '{}', '{}'),
(12, 'police', 3, 'officier2', 'Officer II', 0, '{}', '{}'),
(13, 'police', 4, 'officier3', 'Officer III', 0, '{}', '{}'),
(14, 'police', 5, 'officierprincipal ', 'Officer III+I', 0, '{}', '{}'),
(15, 'police', 6, 'detective', 'Dectective II', 0, '[]', '[]'),
(16, 'police', 7, 'detective', 'Dectective II', 0, '[]', '[]'),
(17, 'police', 8, 'sergent1', 'Sergent I', 0, NULL, NULL),
(18, 'police', 9, 'sergent2', 'Sergent II', 0, NULL, NULL),
(19, 'police', 10, 'lieutenant', 'Lieutenant', 0, NULL, NULL),
(20, 'police', 11, 'capitaine', 'Captain', 0, NULL, NULL),
(21, 'police', 12, 'boss', 'Commander', 0, NULL, NULL),
(22, 'police', 13, 'swat', 'Deputy Chief', 0, '[]', '[]'),
(23, 'police', 14, 'crm', 'Assistant Chief', 0, '[]', '[]'),
(24, 'police', 15, 'Chief ', 'Chief of SASP', 0, '[]', '[]'),
(30, 'gouvernement', 13, 'boss', 'Gouverneur', 0, 'null', 'null'),
(31, 'gouvernement', 12, 'Vice Gouverneur', 'Vice Gouverneur', 0, '[]', '[]'),
(32, 'gouvernement', 11, 'Premier Ministre', 'Premier Ministre', 0, '[]', '[]'),
(33, 'gouvernement', 10, 'Secretaire Défense', 'SD', 0, '[]', '[]'),
(34, 'gouvernement', 9, 'Ministre de la Justice', 'MJ', 0, '[]', '[]'),
(35, 'gouvernement', 8, 'Ministre de l\'Economie', 'ME', 0, '[]', '[]'),
(36, 'gouvernement', 7, 'Secrétaire d\'Etat', 'SE', 0, '[]', '[]'),
(37, 'gouvernement', 6, 'Secretaire au Logement', 'SL', 0, '[]', '[]'),
(38, 'gouvernement', 5, 'juge', 'Juge', 0, '[]', '[]'),
(39, 'gouvernement', 4, 'procureur', 'Procureur', 0, '[]', '[]'),
(40, 'gouvernement', 2, 'garde', 'Garde du Corp', 1000, '[]', '[]'),
(41, 'gouvernement', 1, 'chefsecu', 'Chef de securité', 0, '[]', '[]'),
(703, 'cardealer', 7, 'boss', 'patron', 1, '{}', '{}'),
(704, 'motodealer', 1, 'Apprentie', 'Recrue', 50, '{}', '{}'),
(706, 'motodealer', 2, 'Expérimenter', 'Experimente', 150, '{}', '{}'),
(707, 'motodealer', 4, 'boss', 'Patron/ne', 300, '{}', '{}'),
(708, 'salieris', 1, 'recrue', 'Barman', 0, '{}', '{}'),
(709, 'salieris', 2, 'novice', 'DJ', 0, '{}', '{}'),
(710, 'salieris', 3, 'boss', 'Patron', 0, '{}', '{}'),
(765, 'vigne', 4, 'boss', 'Patron', 2000, '{}', '{}'),
(1781, 'realestateagent', 2, 'vendeur', 'Employé', 3000, '{}', '{}'),
(1782, 'realestateagent', 3, 'manager', 'Manager', 0, '{}', '{}'),
(1783, 'realestateagent', 4, 'Co-gérant', 'Gestion', 0, '{}', '{}'),
(1784, 'realestateagent', 5, 'boss', 'Patron', 15, '{}', '{}'),
(1850, 'boatdealer', 1, 'Stagiaire', 'EMPLOYER', 0, '{}', '{}'),
(1851, 'boatdealer', 6, 'boss', 'PDG', 0, '{}', '{}'),
(1852, 'boatdealer', 5, 'co-patron', 'Co-Patron', 0, '[]', '[]'),
(1870, 'airdealer', 4, 'boss', 'PDG', 5000, NULL, NULL),
(1871, 'airdealer', 3, 'Co Patron', 'Co-Patron', 500, '[]', '[]'),
(1872, 'airdealer', 1, 'Salarié', 'Salarié', 500, '[]', '[]'),
(1946, 'saspn', 0, 'cadet', 'Junior', 50, '{}', '{}'),
(1947, 'saspn', 1, 'officier1', 'Ranger I', 65, '{}', '{}'),
(1948, 'saspn', 2, 'officier2', 'Ranger II', 80, '{}', '{}'),
(1949, 'saspn', 3, 'officier3', 'Senior Ranger', 95, '{}', '{}'),
(1950, 'saspn', 4, 'officierprincipal ', 'Sergent', 95, '{}', '{}'),
(1951, 'saspn', 5, 'sergent1', 'Sergent chef', 95, NULL, NULL),
(1952, 'saspn', 6, 'sergent2', 'Lieutenant', 100, NULL, NULL),
(1953, 'saspn', 7, 'lieutenant', 'Lieutenant chef', 105, NULL, NULL),
(1954, 'saspn', 9, 'capitaine', 'Adjoint', 5000, NULL, NULL),
(1955, 'saspn', 10, 'boss', 'Sheriff', 5000, NULL, NULL),
(2032, 'le_ferailleur', 3, 'boss', 'Chef', 0, '{}', '{}'),
(2033, 'le_ferailleur', 2, 'Co -patron', 'CP', 0, '[]', '[]'),
(2034, 'le_ferailleur', 1, 'Ramasseur', 'RM', 0, '[]', '[]'),
(2062, 'taxi', 15, 'boss', '💼 I patron', 0, NULL, NULL),
(2063, 'taxi', 12, 'co-boss', '💼 I co-patron', 0, '[]', '[]'),
(2093, 'lscustom', 6, 'boss', 'Boss', 0, NULL, NULL),
(2136, 'lscustom', 1, 'apprenti', 'Apprenti', 250, '[]', '[]'),
(2138, 'lscustom', 3, 'mecano', 'Mécano', 500, '[]', '[]'),
(2139, 'lscustom', 4, 'chefequipe', 'Chef Equipe', 1000, '[]', '[]'),
(2140, 'lscustom', 5, 'copatron', 'Co-Patron', 0, '[]', '[]'),
(2887, 'weazelnews', 2, 'employed', 'Employé', 0, NULL, NULL),
(2888, 'weazelnews', 1, 'employed', 'Employé', 0, NULL, NULL),
(2889, 'weazelnews', 4, 'boss', 'Patron', 0, NULL, NULL),
(2890, 'weazelnews', 3, 'sous-boss', 'Manager', 0, NULL, NULL),
(2894, 'petitpecheur', 4, 'boss', 'Patron', 0, NULL, NULL),
(2895, 'petitpecheur', 1, 'employed', 'Employé', 0, NULL, NULL),
(2896, 'petitpecheur', 2, 'employed', 'Manager', 0, NULL, NULL),
(2897, 'petitpecheur', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(2901, 'taxi', 3, 'chauffeur', '⭐ I chauffeur', 0, '[]', '[]'),
(2903, 'taxi', 5, 'manager', 'manager', 0, '[]', '[]'),
(2904, 'taxi', 1, 'stagiare', 'stagiare', 0, '[]', '[]'),
(2958, 'burgershot', 1, 'Interimaire', 'Stagiaire', 0, NULL, NULL),
(2961, 'vigne', 3, 'sous-boss', 'Co-Patron', 1000, NULL, NULL),
(2968, 'saspn', 8, 'Under Sheriff', 'Under', 4500, '[]', '[]'),
(2978, 'tabac', 3, 'sous-boss', 'Responsable d\'équipe', NULL, NULL, NULL),
(2979, 'tabac', 2, 'employed', 'Employé(e)', 0, NULL, NULL),
(2980, 'tabac', 2, 'employed', 'Employé(e)', 0, NULL, NULL),
(2981, 'tabac', 4, 'boss', 'PDG', 1, NULL, NULL),
(2984, 'cardealer', 4, 'sénior', 'sénior', 0, '[]', '[]'),
(2985, 'cardealer', 3, 'expérimenté', 'expérimenté', 0, '[]', '[]'),
(2988, 'motodealer', 3, 'Responsable', 'Responsable', 200, '[]', '[]'),
(3018, 'gouvernement', 3, 'Avocat', 'Avocat', 0, '[]', '[]'),
(3020, 'ltd_littleseoul', 2, 'employed', 'Employer', 350, NULL, NULL),
(3021, 'ltd_littleseoul', 5, 'boss', 'Patron', 5000, NULL, NULL),
(3022, 'ltd_littleseoul', 4, 'sous-boss', 'Co-Patron', 3500, NULL, NULL),
(3023, 'ltd_littleseoul', 2, 'employed', 'Employer', 350, NULL, NULL),
(3024, 'ltd_paletobay', 1, 'employed', 'Stagiaire', 0, NULL, NULL),
(3025, 'ltd_paletobay', 2, 'employed', 'Employer', 0, NULL, NULL),
(3026, 'ltd_paletobay', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(3027, 'ltd_paletobay', 4, 'boss', 'Patron', 0, NULL, NULL),
(3028, 'ltd_f4l', 2, 'employer', 'vendeur', 0, NULL, NULL),
(3029, 'ltd_f4l', 2, 'employer', 'vendeur', 0, NULL, NULL),
(3030, 'ltd_f4l', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(3031, 'ltd_f4l', 4, 'boss', 'Patron', 0, NULL, NULL),
(3032, 'ltd_ballas', 1, 'employed', 'Stagiaire', 0, NULL, NULL),
(3033, 'ltd_ballas', 2, 'employed', 'Employer', 0, NULL, NULL),
(3034, 'ltd_ballas', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(3035, 'ltd_ballas', 4, 'boss', 'Patron', 0, NULL, NULL),
(3044, 'ambulancesandy', 4, 'boss', 'Patron', 0, NULL, NULL),
(3045, 'ambulancesandy', 3, 'sous-boss', 'Médecin', 0, NULL, NULL),
(3046, 'ambulancesandy', 1, 'employed', 'Stagiaire', 0, NULL, NULL),
(3047, 'ambulancesandy', 2, 'employed', 'Infirmier', 0, NULL, NULL),
(3053, 'burgershot', 4, 'Manager', 'DRH', 0, '[]', '[]'),
(3066, 'cardealer', 6, 'responsable des ventes', 'Responsable des ventes', 0, '[]', '[]'),
(3067, 'ltd_littleseoul', 3, 'Expérimenter', 'Expérimenter', 650, '[]', '[]'),
(3068, 'cardealer', 2, 'junior', 'junior', 0, '[]', '[]'),
(3069, 'cardealer', 1, 'recru', 'recru', 0, '[]', '[]'),
(3071, 'realestateagent', 6, 'co-patron', 'Co-patron', 5000, '[]', '[]'),
(3074, 'boatdealer', 2, 'Expérimenté', 'Novice', 0, '[]', '[]'),
(3075, 'vigne', 2, 'Sous chef', 'Sous chef', 500, '[]', '[]'),
(3076, 'vigne', 1, 'Employer', 'Empoyer', 400, '[]', '[]'),
(3082, 'ambulance', 1, 'employed', 'Medecin', 0, NULL, NULL),
(3083, 'ambulance', 2, 'employed', 'Medecin', 0, NULL, NULL),
(3084, 'ambulance', 3, 'sous-boss', 'Sous-Directeur', 0, NULL, NULL),
(3085, 'ambulance', 4, 'boss', 'Directeur', 0, NULL, NULL),
(3093, 'burgershot', 1, 'employed', 'Employé', 0, NULL, NULL),
(3094, 'burgershot', 2, 'employed', 'Employé', 0, NULL, NULL),
(3095, 'burgershot', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(3096, 'burgershot', 4, 'boss', 'Patronµ', 0, NULL, NULL),
(3097, 'mecano', 1, 'employed', 'Stagiaire', 0, NULL, NULL),
(3098, 'mecano', 2, 'employed', 'Employé', 0, NULL, NULL),
(3099, 'mecano', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(3100, 'mecano', 4, 'boss', 'Boss', 0, NULL, NULL),
(3101, 'unicorn', 1, 'employed', 'Stagiaire', 0, NULL, NULL),
(3102, 'unicorn', 2, 'employed', 'Employé', 0, NULL, NULL),
(3103, 'unicorn', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(3104, 'unicorn', 4, 'boss', 'Patron', 0, NULL, NULL),
(3105, 'gouvernement', 14, 'president', 'president', 500, '[]', '[]'),
(3106, 'ambulance', 5, 'Aide Soignant', 'Aide Soigant', 100, '[]', '[]'),
(3107, 'vangelico', 3, 'sous-boss', 'Sous Boss', 0, NULL, NULL),
(3108, 'vangelico', 2, 'employed', 'Confirmer', 0, NULL, NULL),
(3109, 'vangelico', 4, 'boss', 'Boss', 0, NULL, NULL),
(3110, 'vangelico', 1, 'employed', 'Employé', 0, NULL, NULL),
(3111, 'pops', 4, 'boss', 'Patron', 0, NULL, NULL),
(3112, 'pops', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(3113, 'pops', 2, 'employed', 'Employé', 0, NULL, NULL),
(3114, 'pops', 1, 'employed', 'Stagiaire', 0, NULL, NULL),
(3115, 'hornys', 2, 'employed', 'Employé', 0, NULL, NULL),
(3116, 'hornys', 1, 'employed', 'Stagiaire', 0, NULL, NULL),
(3117, 'hornys', 4, 'boss', 'Patron', 0, NULL, NULL),
(3118, 'hornys', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(3119, 'pearls', 4, 'boss', 'Patron', 0, NULL, NULL),
(3120, 'pearls', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(3121, 'pearls', 2, 'employed', 'Employé', 0, NULL, NULL),
(3122, 'pearls', 1, 'employed', 'Stagiaire', 0, NULL, NULL),
(3123, 'wiwang', 4, 'boss', 'Patron', 0, NULL, NULL),
(3124, 'wiwang', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(3125, 'wiwang', 2, 'employed', 'Employé', 0, NULL, NULL),
(3126, 'wiwang', 1, 'employed', 'Stagiaire', 0, NULL, NULL),
(3127, 'pacific', 4, 'boss', 'Patron', 0, NULL, NULL),
(3128, 'pacific', 3, 'sous-boss', 'Co-Patron', 0, NULL, NULL),
(3129, 'pacific', 2, 'employed', 'Employé', 0, NULL, NULL),
(3130, 'pacific', 1, 'employed', 'Stagiaire', 0, NULL, NULL),
(3131, 'ballas', 1, 'boss', 'Chef', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `kayscore_afk_players`
--

CREATE TABLE `kayscore_afk_players` (
  `UniqueID` int(11) DEFAULT 0,
  `points` longtext DEFAULT '0',
  `time` longtext DEFAULT '0',
  `inZone` tinyint(1) DEFAULT 0,
  `skin` longtext DEFAULT 'none',
  `playerName` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `kayscore_clothes`
--

CREATE TABLE `kayscore_clothes` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `identifier` varchar(60) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `kayscore_clothes`
--

INSERT INTO `kayscore_clothes` (`id`, `type`, `identifier`, `name`, `data`) VALUES
(1, 'glasses', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Lunette', '{\"glasses_2\":0,\"glasses_1\":21}'),
(8, 'watches', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Montre', '{\"watches_1\":18,\"watches_2\":1}'),
(11, 'outfit', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Chic Blanc', '{\"shoes_2\":3,\"arms_2\":0,\"shoes_1\":93,\"chain_1\":0,\"tshirt_2\":0,\"chain_2\":0,\"mask_2\":0,\"torso_1\":693,\"bproof_2\":0,\"mask_1\":0,\"tshirt_1\":15,\"decals_2\":0,\"torso_2\":0,\"pants_2\":8,\"decals_1\":0,\"pants_1\":92,\"helmet_2\":0,\"arms\":8,\"helmet_1\":-1,\"bproof_1\":0}'),
(26, 'outfit', 'license:a85067849d4d8b748d3959b4595562fcbfd56d9d', 'AZEA', '{\"tshirt_2\":30,\"mask_2\":0,\"torso_1\":234,\"mask_1\":0,\"helmet_1\":-1,\"decals_2\":0,\"tshirt_1\":5,\"arms\":6,\"arms_2\":0,\"pants_2\":0,\"shoes_1\":16,\"bproof_1\":0,\"pants_1\":122,\"chain_1\":0,\"shoes_2\":0,\"helmet_2\":0,\"chain_2\":0,\"torso_2\":0,\"bproof_2\":0,\"decals_1\":0}'),
(27, 'top', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Haut 13', '{\"torso_1\":13,\"arms_2\":0,\"arms\":11,\"tshirt_1\":15,\"torso_2\":10,\"bproof_2\":0,\"tshirt_2\":0,\"bproof_1\":0}'),
(28, 'outfit', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'summer top rose', '{\"decals_2\":0,\"chain_2\":0,\"helmet_2\":0,\"decals_1\":0,\"shoes_1\":93,\"torso_1\":13,\"pants_2\":8,\"chain_1\":0,\"torso_2\":10,\"shoes_2\":3,\"tshirt_2\":0,\"bproof_1\":0,\"arms\":11,\"bproof_2\":0,\"mask_2\":0,\"tshirt_1\":15,\"arms_2\":0,\"pants_1\":92,\"mask_1\":0,\"helmet_1\":-1}'),
(29, 'outfit', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', '', '{\"chain_1\":30,\"chain_2\":2,\"arms_2\":0,\"decals_1\":0,\"shoes_1\":67,\"pants_2\":0,\"torso_2\":8,\"helmet_2\":0,\"helmet_1\":-1,\"mask_1\":0,\"tshirt_2\":0,\"bproof_1\":0,\"decals_2\":0,\"bproof_2\":0,\"mask_2\":0,\"tshirt_1\":409,\"torso_1\":728,\"pants_1\":319,\"arms\":302,\"shoes_2\":0}'),
(32, 'top', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Haut 676', '{\"bproof_1\":0,\"tshirt_2\":0,\"tshirt_1\":15,\"torso_1\":676,\"bproof_2\":0,\"arms\":11,\"arms_2\":0,\"torso_2\":3}'),
(34, 'shoes', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Chaussure ', '{\"shoes_1\":10,\"shoes_2\":0}'),
(35, 'watches', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Montre', '{\"watches_1\":3,\"watches_2\":0}'),
(36, 'glasses', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Lunette', '{\"glasses_1\":84,\"glasses_2\":1}'),
(37, 'pants', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Pantalon ', '{\"pants_1\":28,\"pants_2\":0}'),
(38, 'shoes', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Chaussure ', '{\"shoes_1\":10,\"shoes_2\":0}'),
(39, 'outfit', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Chic noir2', '{\"shoes_2\":0,\"bproof_1\":0,\"helmet_2\":0,\"tshirt_2\":0,\"helmet_1\":-1,\"decals_2\":0,\"shoes_1\":10,\"tshirt_1\":15,\"decals_1\":0,\"mask_1\":0,\"pants_2\":0,\"mask_2\":0,\"pants_1\":28,\"chain_2\":0,\"torso_1\":676,\"chain_1\":0,\"torso_2\":3,\"arms\":11,\"arms_2\":0,\"bproof_2\":0}'),
(40, 'top', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Haut 773', '{\"arms\":0,\"tshirt_1\":15,\"bproof_2\":0,\"arms_2\":0,\"tshirt_2\":0,\"torso_2\":0,\"bproof_1\":0,\"torso_1\":773}'),
(41, 'pants', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Pantalon ', '{\"pants_2\":0,\"pants_1\":325}'),
(42, 'shoes', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Chaussure ', '{\"shoes_1\":104,\"shoes_2\":1}'),
(43, 'bags', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Sac', '{\"bags_2\":0,\"bags_1\":82}'),
(44, 'shoes', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Chaussure ', '{\"shoes_1\":104,\"shoes_2\":1}'),
(45, 'top', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Haut 347', '{\"arms\":15,\"tshirt_1\":15,\"bproof_2\":0,\"arms_2\":0,\"tshirt_2\":0,\"torso_2\":11,\"bproof_1\":0,\"torso_1\":347}'),
(46, 'outfit', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'chill', '{\"bproof_2\":0,\"chain_2\":0,\"torso_2\":11,\"pants_2\":0,\"arms\":15,\"decals_2\":0,\"shoes_1\":104,\"decals_1\":0,\"shoes_2\":1,\"mask_2\":0,\"helmet_1\":-1,\"pants_1\":325,\"chain_1\":0,\"tshirt_1\":15,\"helmet_2\":0,\"mask_1\":0,\"tshirt_2\":0,\"bproof_1\":0,\"arms_2\":0,\"torso_1\":347}'),
(47, 'glasses', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Lunette', '{\"glasses_2\":5,\"glasses_1\":63}'),
(48, 'outfit', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'chill', '{\"bproof_2\":0,\"chain_2\":0,\"torso_2\":11,\"pants_2\":0,\"arms\":15,\"decals_2\":0,\"shoes_1\":104,\"decals_1\":0,\"shoes_2\":1,\"mask_2\":0,\"helmet_1\":-1,\"pants_1\":325,\"chain_1\":0,\"tshirt_1\":15,\"helmet_2\":0,\"mask_1\":0,\"tshirt_2\":0,\"bproof_1\":0,\"arms_2\":0,\"torso_1\":347}'),
(49, 'top', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Haut 634', '{\"arms\":11,\"tshirt_1\":15,\"bproof_2\":0,\"arms_2\":0,\"tshirt_2\":0,\"torso_2\":0,\"bproof_1\":0,\"torso_1\":634}'),
(50, 'outfit', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', '1', '{\"bproof_2\":0,\"chain_2\":0,\"torso_2\":0,\"pants_2\":0,\"arms\":11,\"decals_2\":0,\"shoes_1\":104,\"decals_1\":0,\"shoes_2\":1,\"mask_2\":0,\"helmet_1\":-1,\"pants_1\":325,\"chain_1\":0,\"tshirt_1\":15,\"helmet_2\":0,\"mask_1\":0,\"tshirt_2\":0,\"bproof_1\":0,\"arms_2\":0,\"torso_1\":634}'),
(51, 'bags', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Sac', '{\"bags_2\":0,\"bags_1\":145}'),
(52, 'bags', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Sac', '{\"bags_2\":0,\"bags_1\":147}'),
(53, 'bags', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Sac', '{\"bags_2\":0,\"bags_1\":113}'),
(54, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'tenue pro', '{\"shoes_1\":181,\"helmet_1\":23,\"helmet_2\":0,\"bproof_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":6,\"bproof_1\":0,\"pants_2\":0,\"shoes_2\":1,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"tshirt_1\":256,\"decals_1\":0,\"torso_1\":872,\"tshirt_2\":1,\"torso_2\":0,\"pants_1\":298}'),
(55, 'glasses', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'Lunette', '{\"glasses_1\":59,\"glasses_2\":0}'),
(56, 'glasses', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'Lunette', '{\"glasses_1\":53,\"glasses_2\":0}'),
(57, 'top', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'Haut 31', '{\"arms_2\":0,\"torso_2\":6,\"torso_1\":31,\"tshirt_1\":32,\"bproof_1\":0,\"tshirt_2\":4,\"bproof_2\":0,\"arms\":6}'),
(58, 'pants', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'Pantalon ', '{\"pants_2\":2,\"pants_1\":25}'),
(59, 'shoes', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'Chaussure ', '{\"shoes_1\":104,\"shoes_2\":6}'),
(60, 'outfit', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'vieux', '{\"shoes_1\":104,\"helmet_1\":-1,\"helmet_2\":0,\"pants_1\":25,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":6,\"bproof_1\":0,\"pants_2\":2,\"shoes_2\":6,\"mask_1\":0,\"arms_2\":0,\"mask_2\":0,\"torso_1\":31,\"torso_2\":6,\"bproof_2\":0,\"tshirt_2\":4,\"decals_1\":0,\"tshirt_1\":32}'),
(61, 'glasses', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'Lunette', '{\"glasses_1\":10,\"glasses_2\":2}'),
(62, 'bags', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Sac', '{\"bags_2\":0,\"bags_1\":125}'),
(63, 'outfit', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'OP', '{\"shoes_1\":24,\"torso_1\":43,\"helmet_2\":0,\"tshirt_1\":2,\"chain_1\":0,\"chain_2\":0,\"torso_2\":0,\"arms\":18,\"bproof_1\":81,\"pants_2\":1,\"shoes_2\":0,\"mask_1\":169,\"arms_2\":0,\"mask_2\":13,\"bproof_2\":0,\"helmet_1\":57,\"decals_1\":0,\"tshirt_2\":0,\"pants_1\":136,\"decals_2\":0}'),
(64, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'robe blanche', '{\"shoes_1\":183,\"torso_1\":819,\"helmet_2\":0,\"bproof_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":15,\"decals_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":7,\"tshirt_2\":0,\"tshirt_1\":3,\"pants_1\":198}'),
(65, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'robe noir', '{\"shoes_1\":193,\"torso_1\":774,\"helmet_2\":0,\"bproof_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":15,\"decals_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":3,\"tshirt_2\":0,\"tshirt_1\":14,\"pants_1\":198}'),
(67, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'plage', '{\"shoes_1\":35,\"torso_1\":745,\"helmet_2\":0,\"bproof_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":15,\"decals_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":0,\"tshirt_2\":0,\"tshirt_1\":3,\"pants_1\":252}'),
(68, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'robe en jean', '{\"shoes_1\":185,\"torso_1\":721,\"helmet_2\":0,\"bproof_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":15,\"decals_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":0,\"tshirt_2\":0,\"tshirt_1\":3,\"pants_1\":15}'),
(69, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'nouours', '{\"shoes_1\":154,\"torso_1\":554,\"helmet_2\":0,\"bproof_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":5,\"decals_1\":0,\"pants_2\":0,\"shoes_2\":12,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":0,\"tshirt_2\":0,\"tshirt_1\":3,\"pants_1\":284}'),
(70, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'haut marron', '{\"shoes_1\":208,\"torso_1\":574,\"helmet_2\":0,\"bproof_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":15,\"decals_1\":0,\"pants_2\":2,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":7,\"tshirt_2\":0,\"tshirt_1\":313,\"pants_1\":15}'),
(77, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'robe etoule', '{\"shoes_1\":208,\"torso_1\":534,\"helmet_2\":0,\"bproof_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":15,\"decals_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":0,\"tshirt_2\":0,\"tshirt_1\":2,\"pants_1\":17}'),
(78, 'outfit', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'MILIT', '{\"shoes_1\":141,\"torso_1\":623,\"helmet_2\":0,\"tshirt_1\":2,\"chain_1\":0,\"chain_2\":0,\"torso_2\":0,\"arms\":4,\"bproof_1\":0,\"pants_2\":0,\"shoes_2\":5,\"mask_1\":0,\"arms_2\":0,\"mask_2\":0,\"bproof_2\":0,\"helmet_1\":57,\"decals_1\":0,\"tshirt_2\":0,\"pants_1\":212,\"decals_2\":0}'),
(79, 'glasses', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'Lunette', '{\"glasses_1\":59,\"glasses_2\":0}'),
(80, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'pull violet', '{\"shoes_1\":181,\"torso_1\":717,\"helmet_2\":0,\"bproof_2\":7,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":15,\"decals_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":9,\"tshirt_2\":0,\"tshirt_1\":330,\"pants_1\":15}'),
(83, 'outfit', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'Plage', '{\"shoes_1\":195,\"torso_1\":901,\"helmet_2\":0,\"tshirt_1\":2,\"chain_1\":0,\"chain_2\":0,\"torso_2\":1,\"arms\":15,\"bproof_1\":0,\"pants_2\":0,\"shoes_2\":5,\"mask_1\":0,\"arms_2\":0,\"mask_2\":0,\"bproof_2\":0,\"helmet_1\":57,\"decals_1\":0,\"tshirt_2\":0,\"pants_1\":15,\"decals_2\":0}'),
(84, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'jupe \nrouge', '{\"shoes_1\":202,\"torso_1\":796,\"helmet_2\":0,\"bproof_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":15,\"decals_1\":0,\"pants_2\":0,\"shoes_2\":4,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":11,\"tshirt_2\":5,\"tshirt_1\":390,\"pants_1\":15}'),
(85, 'outfit', 'license:a85067849d4d8b748d3959b4595562fcbfd56d9d', '', '{\"shoes_1\":16,\"torso_1\":234,\"helmet_2\":0,\"tshirt_1\":5,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":6,\"decals_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":0,\"helmet_1\":-1,\"bproof_1\":0,\"pants_1\":122,\"tshirt_2\":30,\"torso_2\":0,\"bproof_2\":0}'),
(86, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'pyjama', '{\"shoes_1\":35,\"torso_1\":914,\"helmet_2\":0,\"bproof_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":6,\"decals_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":0,\"tshirt_2\":19,\"tshirt_1\":301,\"pants_1\":19}'),
(90, 'outfit', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'Robe B', '{\"shoes_1\":183,\"torso_1\":936,\"helmet_2\":0,\"tshirt_1\":14,\"chain_1\":0,\"chain_2\":0,\"torso_2\":3,\"arms\":15,\"bproof_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":0,\"bproof_2\":0,\"helmet_1\":57,\"decals_1\":0,\"tshirt_2\":0,\"pants_1\":56,\"decals_2\":0}'),
(92, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'papillon', '{\"shoes_1\":58,\"torso_1\":180,\"helmet_2\":6,\"bproof_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":3,\"decals_1\":0,\"pants_2\":6,\"shoes_2\":6,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":90,\"bproof_1\":0,\"torso_2\":6,\"tshirt_2\":0,\"tshirt_1\":9,\"pants_1\":79}'),
(93, 'outfit', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'ENTERRR\nMENT', '{\"shoes_1\":193,\"torso_1\":873,\"helmet_2\":0,\"bproof_2\":6,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"arms\":12,\"decals_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":14,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":0,\"tshirt_2\":0,\"tshirt_1\":3,\"pants_1\":15}'),
(99, 'outfit', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'aby', '{\"shoes_1\":222,\"torso_1\":699,\"helmet_2\":0,\"tshirt_1\":14,\"chain_1\":0,\"chain_2\":0,\"torso_2\":13,\"arms\":25,\"bproof_1\":0,\"pants_2\":0,\"shoes_2\":3,\"mask_1\":0,\"arms_2\":0,\"mask_2\":0,\"bproof_2\":0,\"helmet_1\":57,\"decals_1\":0,\"tshirt_2\":0,\"pants_1\":234,\"decals_2\":0}'),
(100, 'outfit', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', '', '{\"shoes_1\":-1,\"torso_1\":921,\"helmet_2\":0,\"pants_1\":15,\"chain_1\":220,\"chain_2\":0,\"torso_2\":9,\"arms\":251,\"bproof_1\":0,\"pants_2\":0,\"shoes_2\":23,\"mask_1\":0,\"arms_2\":0,\"mask_2\":0,\"bproof_2\":0,\"decals_1\":0,\"decals_2\":0,\"tshirt_2\":3,\"helmet_1\":-1,\"tshirt_1\":352}'),
(103, 'outfit', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'cute', '{\"shoes_1\":183,\"torso_1\":921,\"helmet_2\":0,\"pants_1\":15,\"chain_1\":220,\"chain_2\":0,\"torso_2\":9,\"arms\":251,\"bproof_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":0,\"bproof_2\":0,\"decals_1\":0,\"decals_2\":0,\"tshirt_2\":3,\"helmet_1\":-1,\"tshirt_1\":352}'),
(104, 'outfit', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'noir', '{\"shoes_1\":-1,\"torso_1\":887,\"helmet_2\":0,\"pants_1\":15,\"chain_1\":220,\"chain_2\":0,\"torso_2\":5,\"arms\":251,\"bproof_1\":0,\"pants_2\":0,\"shoes_2\":0,\"mask_1\":0,\"arms_2\":0,\"mask_2\":0,\"bproof_2\":0,\"decals_1\":0,\"decals_2\":0,\"tshirt_2\":2,\"helmet_1\":-1,\"tshirt_1\":256}'),
(105, 'glasses', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'Lunette', '{\"glasses_1\":71,\"glasses_2\":0}'),
(106, 'shoes', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'Chaussure ', '{\"shoes_1\":192,\"shoes_2\":0}'),
(107, 'glasses', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Lunette', '{\"glasses_1\":53,\"glasses_2\":10}'),
(108, 'glasses', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Lunette', '{\"glasses_1\":8,\"glasses_2\":7}'),
(109, 'glasses', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Lunette', '{\"glasses_1\":55,\"glasses_2\":7}'),
(112, 'outfit', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'EMS INT', '{\"decals_2\":0,\"bproof_1\":0,\"helmet_2\":0,\"arms_2\":0,\"tshirt_2\":0,\"shoes_2\":5,\"pants_2\":19,\"pants_1\":134,\"arms\":98,\"bproof_2\":0,\"torso_1\":843,\"decals_1\":0,\"mask_1\":0,\"mask_2\":0,\"chain_1\":0,\"helmet_1\":57,\"shoes_1\":141,\"tshirt_1\":2,\"torso_2\":0,\"chain_2\":0}'),
(122, 'bags', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'Sac', '{\"bags_2\":7,\"bags_1\":111}'),
(127, 'outfit', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'EMS EXT', '{\"shoes_1\":24,\"bproof_1\":0,\"helmet_2\":0,\"chain_2\":0,\"tshirt_2\":0,\"tshirt_1\":69,\"torso_1\":980,\"pants_2\":9,\"torso_2\":0,\"decals_1\":0,\"pants_1\":61,\"helmet_1\":57,\"arms_2\":0,\"bproof_2\":0,\"chain_1\":0,\"shoes_2\":0,\"mask_2\":0,\"mask_1\":0,\"decals_2\":0,\"arms\":98}'),
(129, 'chain', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'holster', '{\"chain_2\":0,\"chain_1\":185}'),
(130, 'glasses', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'Lunette', '{\"glasses_2\":0,\"glasses_1\":5}'),
(133, 'outfit', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'agent Gouv', '{\"shoes_1\":61,\"bproof_1\":70,\"helmet_2\":0,\"chain_2\":0,\"tshirt_2\":0,\"tshirt_1\":227,\"torso_1\":318,\"pants_2\":0,\"torso_2\":5,\"decals_1\":0,\"arms\":11,\"helmet_1\":-1,\"arms_2\":0,\"bproof_2\":0,\"pants_1\":24,\"shoes_2\":0,\"mask_2\":0,\"chain_1\":185,\"decals_2\":0,\"mask_1\":0}'),
(138, 'top', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'ceinturons', '{\"bproof_2\":0,\"torso_2\":0,\"bproof_1\":0,\"tshirt_2\":0,\"torso_1\":15,\"arms\":15,\"tshirt_1\":227,\"arms_2\":0}'),
(141, 'top', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'cravatte noir', '{\"bproof_2\":0,\"torso_2\":5,\"bproof_1\":19,\"tshirt_2\":0,\"torso_1\":318,\"arms\":11,\"tshirt_1\":227,\"arms_2\":0}'),
(142, 'top', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'chemise blanche', '{\"bproof_2\":0,\"torso_2\":5,\"bproof_1\":0,\"tshirt_2\":0,\"torso_1\":318,\"arms\":11,\"tshirt_1\":227,\"arms_2\":0}'),
(145, 'chain', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'holster chargeur', '{\"chain_2\":0,\"chain_1\":184}'),
(146, 'bags', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'badge lspd collier', '{\"bags_1\":111,\"bags_2\":0}'),
(147, 'outfit', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'flic civil', '{\"shoes_1\":32,\"bproof_1\":0,\"helmet_2\":0,\"chain_2\":0,\"tshirt_2\":0,\"tshirt_1\":15,\"torso_1\":515,\"pants_2\":2,\"torso_2\":0,\"decals_1\":0,\"arms\":4,\"helmet_1\":-1,\"arms_2\":0,\"bproof_2\":0,\"pants_1\":4,\"shoes_2\":0,\"mask_2\":0,\"chain_1\":184,\"decals_2\":0,\"mask_1\":0}'),
(148, 'pants', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Pantalon ', '{\"pants_2\":4,\"pants_1\":218}'),
(149, 'pants', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Pantalon ', '{\"pants_2\":0,\"pants_1\":218}'),
(150, 'top', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Haut 347', '{\"torso_2\":17,\"tshirt_2\":0,\"bproof_2\":0,\"arms\":0,\"tshirt_1\":141,\"bproof_1\":0,\"arms_2\":0,\"torso_1\":347}'),
(151, 'top', 'license:cd7a190f9f5e1519d3c533ecbd70ca7163270d67', 'Haut 96', '{\"torso_2\":0,\"tshirt_2\":0,\"bproof_2\":0,\"bproof_1\":0,\"tshirt_1\":15,\"arms\":31,\"arms_2\":1,\"torso_1\":96}'),
(152, 'pants', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Pantalon ', '{\"pants_2\":2,\"pants_1\":117}'),
(153, 'shoes', 'license:cd7a190f9f5e1519d3c533ecbd70ca7163270d67', 'Chaussure ', '{\"shoes_2\":0,\"shoes_1\":6}'),
(154, 'shoes', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Chaussure ', '{\"shoes_2\":6,\"shoes_1\":92}'),
(155, 'glasses', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Lunette', '{\"glasses_2\":3,\"glasses_1\":25}'),
(156, 'outfit', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'moi', '{\"bproof_2\":0,\"shoes_1\":17,\"chain_1\":0,\"tshirt_1\":141,\"torso_2\":17,\"mask_1\":0,\"helmet_1\":17,\"bproof_1\":0,\"arms_2\":0,\"arms\":0,\"helmet_2\":0,\"pants_2\":2,\"chain_2\":0,\"mask_2\":0,\"shoes_2\":6,\"decals_1\":0,\"tshirt_2\":0,\"pants_1\":117,\"decals_2\":0,\"torso_1\":347}'),
(157, 'pants', 'license:cd7a190f9f5e1519d3c533ecbd70ca7163270d67', 'Pantalon ', '{\"pants_2\":0,\"pants_1\":8}'),
(158, 'shoes', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Chaussure ', '{\"shoes_2\":0,\"shoes_1\":0}'),
(159, 'outfit', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', '', '{\"bproof_2\":0,\"shoes_1\":0,\"chain_1\":0,\"tshirt_1\":141,\"torso_2\":17,\"mask_1\":0,\"helmet_1\":17,\"bproof_1\":0,\"arms_2\":0,\"arms\":0,\"helmet_2\":0,\"pants_2\":2,\"chain_2\":0,\"mask_2\":0,\"shoes_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"pants_1\":117,\"decals_2\":0,\"torso_1\":347}'),
(160, 'helmet', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Chapeau', '{\"helmet_1\":104,\"helmet_2\":20}'),
(161, 'mask', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Masque 104', '{\"mask_2\":13,\"mask_1\":104}'),
(163, 'pants', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Pantalon ', '{\"pants_2\":0,\"pants_1\":259}'),
(164, 'shoes', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Chaussure ', '{\"shoes_2\":2,\"shoes_1\":286}'),
(165, 'outfit', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', '22', '{\"bproof_2\":0,\"shoes_1\":286,\"chain_1\":0,\"tshirt_1\":15,\"helmet_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"arms\":11,\"pants_2\":0,\"arms_2\":0,\"bproof_1\":0,\"mask_2\":0,\"torso_2\":0,\"tshirt_2\":0,\"shoes_2\":2,\"decals_1\":0,\"chain_2\":0,\"pants_1\":259,\"decals_2\":0,\"torso_1\":634}'),
(166, 'pants', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Pantalon ', '{\"pants_2\":0,\"pants_1\":181}'),
(167, 'outfit', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', '333', '{\"bproof_2\":0,\"shoes_1\":286,\"chain_1\":0,\"tshirt_1\":15,\"helmet_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"arms\":11,\"pants_2\":0,\"arms_2\":0,\"bproof_1\":0,\"mask_2\":0,\"torso_2\":0,\"tshirt_2\":0,\"shoes_2\":2,\"decals_1\":0,\"chain_2\":0,\"pants_1\":181,\"decals_2\":0,\"torso_1\":634}'),
(168, 'top', 'license:9c6b7781157b6d228ad93235d97ae796f6537f18', 'Haut 251', '{\"torso_2\":2,\"tshirt_2\":1,\"bproof_2\":0,\"bproof_1\":0,\"tshirt_1\":15,\"arms_2\":1,\"arms\":17,\"torso_1\":251}'),
(169, 'pants', 'license:9c6b7781157b6d228ad93235d97ae796f6537f18', 'Pantalon ', '{\"pants_2\":8,\"pants_1\":59}'),
(170, 'glasses', 'license:c7047a717d79967217452e8ff7bf40cd8b5fa667', 'Lunette', '{\"glasses_2\":0,\"glasses_1\":79}'),
(171, 'shoes', 'license:9c6b7781157b6d228ad93235d97ae796f6537f18', 'Chaussure ', '{\"shoes_2\":4,\"shoes_1\":93}'),
(172, 'outfit', 'license:9c6b7781157b6d228ad93235d97ae796f6537f18', 'tkt', '{\"bproof_2\":0,\"shoes_1\":93,\"chain_1\":0,\"tshirt_1\":15,\"helmet_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"arms\":17,\"arms_2\":1,\"mask_2\":0,\"decals_2\":0,\"decals_1\":0,\"torso_2\":2,\"tshirt_2\":1,\"shoes_2\":4,\"bproof_1\":0,\"pants_2\":8,\"pants_1\":59,\"chain_2\":0,\"torso_1\":251}'),
(173, 'pants', 'license:00d9600f850d8173f68600a73d87c78b3c61ddbd', 'Pantalon ', '{\"pants_2\":1,\"pants_1\":322}'),
(174, 'outfit', 'license:00d9600f850d8173f68600a73d87c78b3c61ddbd', 'kiiiii', '{\"bproof_2\":0,\"shoes_1\":316,\"chain_1\":0,\"tshirt_1\":15,\"helmet_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":0,\"decals_1\":0,\"arms\":0,\"pants_2\":1,\"arms_2\":0,\"mask_2\":0,\"shoes_2\":0,\"tshirt_2\":0,\"chain_2\":0,\"pants_1\":322,\"decals_2\":0,\"torso_1\":814}'),
(175, 'shoes', 'license:00d9600f850d8173f68600a73d87c78b3c61ddbd', 'Chaussure ', '{\"shoes_2\":2,\"shoes_1\":324}'),
(176, 'pants', 'license:00d9600f850d8173f68600a73d87c78b3c61ddbd', 'Pantalon ', '{\"pants_2\":1,\"pants_1\":322}'),
(177, 'outfit', 'license:00d9600f850d8173f68600a73d87c78b3c61ddbd', 'g', '{\"bproof_2\":0,\"shoes_1\":324,\"chain_1\":0,\"tshirt_1\":15,\"helmet_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"bproof_1\":0,\"torso_2\":0,\"decals_1\":0,\"arms\":0,\"pants_2\":1,\"arms_2\":0,\"mask_2\":0,\"shoes_2\":2,\"tshirt_2\":0,\"chain_2\":0,\"pants_1\":322,\"decals_2\":0,\"torso_1\":814}'),
(178, 'outfit', 'license:19101c65e5a20141ad5232becb2bd4f03ed49f90', '1', '{\"bproof_2\":0,\"shoes_1\":276,\"chain_1\":223,\"tshirt_1\":24,\"torso_2\":1,\"mask_1\":0,\"helmet_1\":-1,\"arms\":14,\"decals_2\":0,\"bproof_1\":0,\"chain_2\":1,\"helmet_2\":0,\"pants_2\":1,\"arms_2\":0,\"shoes_2\":1,\"tshirt_2\":0,\"mask_2\":0,\"pants_1\":236,\"decals_1\":0,\"torso_1\":775}'),
(179, 'ears', 'license:9401a46ea0e6272f38b847b85732515e7b26e69f', 'Oreille', '{\"ears_2\":0,\"ears_1\":-1}'),
(180, 'outfit', 'license:9401a46ea0e6272f38b847b85732515e7b26e69f', '2', '{\"bproof_2\":0,\"shoes_1\":276,\"chain_1\":223,\"tshirt_1\":24,\"torso_2\":1,\"mask_1\":0,\"helmet_1\":-1,\"arms\":14,\"decals_2\":0,\"bproof_1\":0,\"chain_2\":1,\"helmet_2\":0,\"pants_2\":1,\"arms_2\":0,\"shoes_2\":1,\"tshirt_2\":0,\"mask_2\":0,\"pants_1\":236,\"decals_1\":0,\"torso_1\":775}'),
(183, 'outfit', 'license:5212c5e307fb6b06db10b3181025b1b29a8d6600', '1', '{\"bproof_2\":0,\"shoes_1\":280,\"chain_1\":180,\"tshirt_1\":177,\"helmet_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"arms\":1,\"torso_2\":0,\"shoes_2\":3,\"bproof_1\":0,\"arms_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"pants_2\":1,\"mask_2\":0,\"chain_2\":1,\"pants_1\":333,\"decals_2\":0,\"torso_1\":775}'),
(185, 'outfit', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'tenue lspd', '{\"bproof_2\":1,\"shoes_1\":25,\"chain_1\":185,\"tshirt_1\":227,\"torso_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"bproof_1\":70,\"tshirt_2\":0,\"shoes_2\":0,\"helmet_2\":0,\"arms\":19,\"decals_2\":0,\"arms_2\":0,\"pants_2\":2,\"chain_2\":0,\"mask_2\":0,\"pants_1\":4,\"decals_1\":0,\"torso_1\":73}'),
(186, 'top', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'Haut 73', '{\"torso_2\":0,\"arms_2\":0,\"bproof_2\":0,\"arms\":19,\"tshirt_1\":227,\"bproof_1\":70,\"tshirt_2\":0,\"torso_1\":73}'),
(187, 'top', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Haut 193', '{\"torso_2\":0,\"arms_2\":0,\"bproof_2\":0,\"arms\":1,\"tshirt_1\":15,\"bproof_1\":0,\"tshirt_2\":0,\"torso_1\":193}'),
(188, 'pants', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Pantalon ', '{\"pants_2\":0,\"pants_1\":35}'),
(189, 'shoes', 'license:e0e25c2d7cb750d0ab56a991edb02112854dd212', 'Chaussure ', '{\"shoes_2\":0,\"shoes_1\":24}'),
(190, 'top', 'license:19101c65e5a20141ad5232becb2bd4f03ed49f90', 'Haut 814', '{\"torso_2\":0,\"arms_2\":0,\"bproof_2\":0,\"arms\":0,\"tshirt_1\":15,\"tshirt_2\":0,\"bproof_1\":0,\"torso_1\":814}'),
(192, 'shoes', 'license:19101c65e5a20141ad5232becb2bd4f03ed49f90', 'Chaussure ', '{\"shoes_2\":2,\"shoes_1\":286}'),
(193, 'outfit', 'license:19101c65e5a20141ad5232becb2bd4f03ed49f90', 'ROSE', '{\"bproof_2\":0,\"shoes_1\":286,\"chain_1\":0,\"tshirt_1\":15,\"torso_2\":0,\"mask_1\":0,\"helmet_1\":248,\"arms\":0,\"decals_1\":0,\"bproof_1\":0,\"decals_2\":0,\"helmet_2\":0,\"mask_2\":0,\"arms_2\":0,\"shoes_2\":2,\"pants_2\":5,\"tshirt_2\":0,\"pants_1\":236,\"chain_2\":0,\"torso_1\":814}'),
(194, 'top', 'license:2f11e551164acf68a7266c3004c5fff5ba5738ec', 'Haut 775', '{\"torso_2\":10,\"arms_2\":0,\"bproof_2\":0,\"arms\":1,\"tshirt_1\":14,\"tshirt_2\":2,\"bproof_1\":0,\"torso_1\":775}'),
(195, 'pants', 'license:2f11e551164acf68a7266c3004c5fff5ba5738ec', 'Pantalon ', '{\"pants_2\":0,\"pants_1\":321}'),
(196, 'shoes', 'license:2f11e551164acf68a7266c3004c5fff5ba5738ec', 'Chaussure ', '{\"shoes_2\":12,\"shoes_1\":304}'),
(197, 'glasses', 'license:2f11e551164acf68a7266c3004c5fff5ba5738ec', 'Lunette', '{\"glasses_2\":0,\"glasses_1\":51}'),
(198, 'ears', 'license:2f11e551164acf68a7266c3004c5fff5ba5738ec', 'Oreille', '{\"ears_2\":0,\"ears_1\":32}'),
(199, 'chain', 'license:2f11e551164acf68a7266c3004c5fff5ba5738ec', 'Chaine', '{\"chain_2\":0,\"chain_1\":218}'),
(200, 'top', 'license:0e292e831bd175b59de6fc55d27ffed14e117b38', 'Haut 22', '{\"torso_2\":0,\"arms_2\":0,\"bproof_2\":0,\"arms\":0,\"tshirt_1\":0,\"bproof_1\":0,\"tshirt_2\":0,\"torso_1\":22}'),
(201, 'pants', 'license:0e292e831bd175b59de6fc55d27ffed14e117b38', 'Pantalon ', '{\"pants_2\":1,\"pants_1\":1}'),
(202, 'outfit', 'license:0e292e831bd175b59de6fc55d27ffed14e117b38', '11', '{\"bproof_2\":0,\"shoes_1\":0,\"chain_1\":0,\"tshirt_1\":0,\"torso_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"arms\":0,\"mask_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_2\":0,\"bproof_1\":0,\"arms_2\":0,\"shoes_2\":0,\"decals_2\":0,\"pants_2\":1,\"pants_1\":1,\"chain_2\":0,\"torso_1\":22}'),
(203, 'outfit', 'license:82cf86bac09e90495648cc81c8f7c86da44b5a05', 'ss', '{\"bproof_2\":0,\"shoes_1\":6,\"chain_1\":0,\"tshirt_1\":15,\"torso_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"arms\":0,\"mask_2\":0,\"bproof_1\":0,\"helmet_2\":0,\"pants_2\":0,\"decals_2\":0,\"tshirt_2\":0,\"shoes_2\":0,\"decals_1\":0,\"arms_2\":0,\"pants_1\":9,\"chain_2\":0,\"torso_1\":53}'),
(204, 'top', 'license:9401a46ea0e6272f38b847b85732515e7b26e69f', 'Haut 757', '{\"torso_2\":1,\"tshirt_2\":0,\"bproof_2\":0,\"bproof_1\":0,\"tshirt_1\":15,\"arms\":14,\"arms_2\":0,\"torso_1\":757}'),
(205, 'bags', 'license:2f11e551164acf68a7266c3004c5fff5ba5738ec', 'Sac', '{\"bags_2\":0,\"bags_1\":116}'),
(206, 'bags', 'license:2f11e551164acf68a7266c3004c5fff5ba5738ec', 'Sac', '{\"bags_2\":0,\"bags_1\":147}'),
(207, 'bags', 'license:2f11e551164acf68a7266c3004c5fff5ba5738ec', 'Sac', '{\"bags_2\":0,\"bags_1\":87}'),
(208, 'bags', 'license:2f11e551164acf68a7266c3004c5fff5ba5738ec', 'Sac', '{\"bags_2\":0,\"bags_1\":87}'),
(209, 'pants', 'license:9401a46ea0e6272f38b847b85732515e7b26e69f', 'Pantalon ', '{\"pants_2\":3,\"pants_1\":202}'),
(211, 'top', 'license:c7047a717d79967217452e8ff7bf40cd8b5fa667', 'Haut 741', '{\"torso_2\":1,\"tshirt_2\":0,\"bproof_2\":0,\"arms\":0,\"tshirt_1\":15,\"bproof_1\":0,\"arms_2\":0,\"torso_1\":741}'),
(212, 'pants', 'license:c7047a717d79967217452e8ff7bf40cd8b5fa667', 'Pantalon ', '{\"pants_2\":4,\"pants_1\":290}'),
(213, 'shoes', 'license:c7047a717d79967217452e8ff7bf40cd8b5fa667', 'Chaussure ', '{\"shoes_2\":0,\"shoes_1\":301}'),
(216, 'watches', 'license:c7047a717d79967217452e8ff7bf40cd8b5fa667', 'Montre', '{\"watches_2\":0,\"watches_1\":63}'),
(217, 'chain', 'license:c7047a717d79967217452e8ff7bf40cd8b5fa667', 'Chaine', '{\"chain_2\":0,\"chain_1\":303}'),
(221, 'outfit', 'license:8c77206565552bf9e8045a210be71a74b5c6cada', 'Tenue 1', '{\"bproof_2\":0,\"shoes_1\":240,\"chain_1\":0,\"tshirt_1\":7,\"helmet_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"bproof_1\":0,\"decals_2\":0,\"shoes_2\":14,\"torso_2\":17,\"tshirt_2\":8,\"arms\":4,\"mask_2\":0,\"pants_2\":6,\"arms_2\":0,\"chain_2\":0,\"pants_1\":316,\"decals_1\":0,\"torso_1\":931}'),
(222, 'shoes', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'Chaussure ', '{\"shoes_2\":0,\"shoes_1\":193}'),
(223, 'outfit', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'badbitch', '{\"bproof_2\":0,\"shoes_1\":-1,\"chain_1\":220,\"tshirt_1\":347,\"torso_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"arms\":251,\"mask_2\":0,\"decals_2\":0,\"helmet_2\":0,\"bproof_1\":0,\"shoes_2\":0,\"arms_2\":0,\"pants_2\":0,\"chain_2\":0,\"tshirt_2\":8,\"pants_1\":15,\"decals_1\":0,\"torso_1\":832}'),
(224, 'glasses', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'Lunette', '{\"glasses_2\":0,\"glasses_1\":59}'),
(225, 'bags', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'Sac', '{\"bags_2\":0,\"bags_1\":111}'),
(226, 'bags', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'Sac', '{\"bags_2\":0,\"bags_1\":111}'),
(227, 'outfit', 'license:5212c5e307fb6b06db10b3181025b1b29a8d6600', '2', '{\"bproof_2\":0,\"shoes_1\":280,\"chain_1\":180,\"tshirt_1\":15,\"helmet_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"arms\":0,\"bproof_1\":0,\"decals_2\":0,\"torso_2\":4,\"mask_2\":0,\"tshirt_2\":0,\"arms_2\":0,\"pants_2\":4,\"decals_1\":0,\"shoes_2\":3,\"pants_1\":334,\"chain_2\":1,\"torso_1\":773}'),
(228, 'pants', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'Pantalon ', '{\"pants_1\":175,\"pants_2\":0}'),
(229, 'pants', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'Pantalon ', '{\"pants_1\":52,\"pants_2\":2}'),
(230, 'top', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'Haut 101', '{\"tshirt_2\":0,\"arms_2\":0,\"tshirt_1\":150,\"arms\":4,\"torso_2\":2,\"torso_1\":101,\"bproof_2\":0,\"bproof_1\":0}'),
(231, 'shoes', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'Chaussure ', '{\"shoes_2\":5,\"shoes_1\":104}'),
(232, 'glasses', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'Lunette', '{\"glasses_2\":5,\"glasses_1\":17}'),
(233, 'outfit', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'class', '{\"tshirt_1\":150,\"pants_2\":2,\"helmet_2\":0,\"chain_1\":0,\"torso_1\":101,\"torso_2\":2,\"arms\":4,\"bproof_2\":0,\"mask_2\":0,\"shoes_2\":5,\"shoes_1\":104,\"bproof_1\":0,\"decals_2\":0,\"chain_2\":0,\"tshirt_2\":0,\"decals_1\":0,\"mask_1\":0,\"arms_2\":0,\"helmet_1\":-1,\"pants_1\":52}'),
(235, 'bags', 'license:b69b7d5e28b4a3ac75630fb904c0d67183e4c7e9', 'Sac', '{\"bags_2\":0,\"bags_1\":45}'),
(236, 'top', 'license:b69b7d5e28b4a3ac75630fb904c0d67183e4c7e9', 'Haut 22', '{\"bproof_2\":1,\"tshirt_1\":15,\"arms_2\":0,\"torso_1\":22,\"bproof_1\":83,\"tshirt_2\":0,\"torso_2\":1,\"arms\":19}'),
(237, 'pants', 'license:b69b7d5e28b4a3ac75630fb904c0d67183e4c7e9', 'Pantalon ', '{\"pants_1\":364,\"pants_2\":0}'),
(238, 'shoes', 'license:b69b7d5e28b4a3ac75630fb904c0d67183e4c7e9', 'Chaussure ', '{\"shoes_2\":0,\"shoes_1\":24}'),
(239, 'outfit', 'license:b69b7d5e28b4a3ac75630fb904c0d67183e4c7e9', 'TENUE ORGA', '{\"decals_1\":0,\"shoes_1\":24,\"arms\":19,\"arms_2\":0,\"mask_2\":0,\"chain_1\":0,\"tshirt_1\":15,\"bproof_1\":83,\"decals_2\":0,\"tshirt_2\":0,\"helmet_2\":3,\"pants_2\":0,\"helmet_1\":91,\"torso_2\":1,\"shoes_2\":0,\"torso_1\":22,\"bproof_2\":1,\"pants_1\":364,\"mask_1\":0,\"chain_2\":0}'),
(240, 'helmet', 'license:b69b7d5e28b4a3ac75630fb904c0d67183e4c7e9', 'Chapeau', '{\"helmet_1\":136,\"helmet_2\":1}'),
(241, 'glasses', 'license:b69b7d5e28b4a3ac75630fb904c0d67183e4c7e9', 'Lunette', '{\"glasses_2\":1,\"glasses_1\":5}'),
(242, 'watches', 'license:b69b7d5e28b4a3ac75630fb904c0d67183e4c7e9', 'Montre', '{\"watches_1\":9,\"watches_2\":1}'),
(243, 'chain', 'license:b69b7d5e28b4a3ac75630fb904c0d67183e4c7e9', 'Chaine', '{\"chain_2\":0,\"chain_1\":296}'),
(244, 'bags', 'license:b69b7d5e28b4a3ac75630fb904c0d67183e4c7e9', 'Sac', '{\"bags_2\":1,\"bags_1\":159}'),
(245, 'pants', 'license:19101c65e5a20141ad5232becb2bd4f03ed49f90', 'Pantalon ', '{\"pants_1\":7,\"pants_2\":0}'),
(246, 'outfit', 'license:500afc62035c6ad0a209438b146d7d8515c6ae99', 'k', '{\"bproof_1\":0,\"shoes_1\":166,\"arms\":11,\"mask_1\":0,\"mask_2\":0,\"chain_1\":0,\"pants_1\":24,\"decals_1\":0,\"decals_2\":0,\"tshirt_2\":0,\"helmet_2\":0,\"pants_2\":5,\"helmet_1\":-1,\"torso_2\":1,\"shoes_2\":0,\"torso_1\":21,\"tshirt_1\":7,\"bproof_2\":0,\"arms_2\":0,\"chain_2\":0}'),
(247, 'chain', 'license:f0bc840d97a0d5353af06eaa323b90d1eb5bbbc9', 'Chaine', '{\"chain_2\":2,\"chain_1\":217}'),
(248, 'glasses', 'license:f0bc840d97a0d5353af06eaa323b90d1eb5bbbc9', 'Lunette', '{\"glasses_2\":0,\"glasses_1\":7}'),
(249, 'outfit', 'license:f0bc840d97a0d5353af06eaa323b90d1eb5bbbc9', 'chill vert', '{\"tshirt_1\":15,\"shoes_1\":316,\"arms\":12,\"mask_1\":0,\"mask_2\":0,\"chain_1\":217,\"helmet_2\":0,\"torso_2\":4,\"decals_2\":0,\"tshirt_2\":0,\"pants_1\":332,\"pants_2\":3,\"bproof_2\":0,\"arms_2\":0,\"shoes_2\":0,\"torso_1\":786,\"decals_1\":0,\"helmet_1\":-1,\"bproof_1\":0,\"chain_2\":0}'),
(250, 'bags', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'Sac', '{\"bags_2\":1,\"bags_1\":125}'),
(251, 'bags', 'license:2f11e551164acf68a7266c3004c5fff5ba5738ec', 'Sac', '{\"bags_2\":0,\"bags_1\":124}'),
(252, 'top', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'Haut 43', '{\"bproof_1\":116,\"arms\":18,\"arms_2\":0,\"torso_1\":43,\"bproof_2\":0,\"tshirt_2\":0,\"torso_2\":0,\"tshirt_1\":2}'),
(253, 'bags', 'license:500afc62035c6ad0a209438b146d7d8515c6ae99', 'Sac', '{\"bags_2\":1,\"bags_1\":125}'),
(254, 'helmet', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'Chapeau', '{\"helmet_2\":13,\"helmet_1\":223}'),
(255, 'shoes', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'Chaussure ', '{\"shoes_1\":246,\"shoes_2\":0}'),
(256, 'outfit', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'YO', '{\"mask_1\":0,\"chain_2\":0,\"tshirt_1\":372,\"pants_1\":15,\"arms\":251,\"pants_2\":0,\"helmet_1\":223,\"bproof_1\":0,\"shoes_1\":246,\"shoes_2\":0,\"tshirt_2\":0,\"helmet_2\":13,\"decals_2\":0,\"arms_2\":0,\"torso_1\":956,\"decals_1\":0,\"torso_2\":0,\"mask_2\":0,\"bproof_2\":0,\"chain_1\":220}'),
(257, 'top', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Haut 0', '{\"tshirt_1\":59,\"bproof_1\":0,\"torso_1\":0,\"tshirt_2\":0,\"bproof_2\":0,\"torso_2\":0,\"arms\":0,\"arms_2\":0}'),
(258, 'pants', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Pantalon ', '{\"pants_2\":0,\"pants_1\":23}'),
(259, 'shoes', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Chaussure ', '{\"shoes_1\":12,\"shoes_2\":0}'),
(260, 'helmet', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Chapeau', '{\"helmet_2\":0,\"helmet_1\":0}'),
(261, 'pants', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Pantalon ', '{\"pants_2\":0,\"pants_1\":1}'),
(262, 'top', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Haut 0', '{\"tshirt_1\":59,\"bproof_1\":0,\"torso_1\":0,\"tshirt_2\":0,\"bproof_2\":0,\"torso_2\":0,\"arms\":19,\"arms_2\":0}'),
(263, 'outfit', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'Chantier', '{\"mask_1\":0,\"chain_2\":0,\"tshirt_1\":59,\"pants_1\":1,\"arms\":19,\"pants_2\":0,\"helmet_1\":0,\"bproof_1\":0,\"shoes_1\":12,\"shoes_2\":0,\"tshirt_2\":0,\"helmet_2\":0,\"decals_2\":0,\"arms_2\":0,\"torso_1\":0,\"decals_1\":0,\"torso_2\":0,\"mask_2\":0,\"bproof_2\":0,\"chain_1\":0}'),
(264, 'outfit', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'chantier', '{\"mask_1\":0,\"chain_2\":0,\"tshirt_1\":59,\"pants_1\":1,\"arms\":19,\"pants_2\":0,\"mask_2\":0,\"bproof_1\":0,\"shoes_1\":12,\"shoes_2\":0,\"tshirt_2\":0,\"helmet_2\":0,\"decals_2\":0,\"arms_2\":0,\"torso_1\":0,\"decals_1\":0,\"bproof_2\":0,\"torso_2\":0,\"helmet_1\":0,\"chain_1\":0}'),
(265, 'bags', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'Sac', '{\"bags_1\":125,\"bags_2\":1}'),
(266, 'bags', 'license:335b1d7b3540356e901ba15b3fdea8848979f45c', 'Sac', '{\"bags_1\":125,\"bags_2\":1}'),
(267, 'outfit', 'license:e30ec892c556c4f972e8394be39290174347843e', 'Vache', '{\"mask_1\":0,\"chain_2\":0,\"tshirt_1\":15,\"pants_1\":15,\"arms\":0,\"pants_2\":0,\"helmet_1\":-1,\"bproof_1\":0,\"shoes_1\":197,\"shoes_2\":0,\"tshirt_2\":0,\"helmet_2\":0,\"decals_2\":0,\"arms_2\":0,\"torso_1\":556,\"decals_1\":0,\"bproof_2\":0,\"torso_2\":0,\"mask_2\":0,\"chain_1\":0}'),
(268, 'top', 'license:242ae1959b1bc408fbf88b0c8ce39065bc2ae003', 'Haut 373', '{\"bproof_2\":0,\"tshirt_2\":2,\"torso_1\":373,\"bproof_1\":0,\"tshirt_1\":233,\"torso_2\":0,\"arms\":1,\"arms_2\":0}'),
(269, 'outfit', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'velo', '{\"decals_2\":0,\"pants_1\":21,\"mask_2\":0,\"shoes_1\":237,\"tshirt_1\":253,\"decals_1\":0,\"arms\":251,\"bproof_1\":0,\"chain_2\":0,\"helmet_1\":47,\"chain_1\":220,\"helmet_2\":0,\"bproof_2\":0,\"torso_2\":4,\"arms_2\":0,\"torso_1\":550,\"pants_2\":0,\"shoes_2\":12,\"mask_1\":0,\"tshirt_2\":0}'),
(270, 'bags', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'Sac', '{\"bags_2\":3,\"bags_1\":111}'),
(271, 'outfit', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'fraise', '{\"decals_2\":0,\"pants_1\":302,\"mask_2\":0,\"shoes_1\":244,\"tshirt_1\":2,\"decals_1\":0,\"arms\":251,\"bproof_1\":0,\"chain_2\":0,\"helmet_1\":-1,\"chain_1\":220,\"helmet_2\":0,\"bproof_2\":0,\"torso_2\":2,\"arms_2\":0,\"torso_1\":718,\"pants_2\":9,\"shoes_2\":0,\"mask_1\":0,\"tshirt_2\":0}');

-- --------------------------------------------------------

--
-- Structure de la table `kayscore_trunk`
--

CREATE TABLE `kayscore_trunk` (
  `info` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('boat', 'Boat License'),
('dmv', 'Code de la route'),
('drive', 'Permis de conduire'),
('drive_bike', 'Permis moto'),
('drive_truck', 'Permis camion'),
('weapon', 'Permis de port d\'arme');

-- --------------------------------------------------------

--
-- Structure de la table `livraisons`
--

CREATE TABLE `livraisons` (
  `uniqueid` int(11) NOT NULL,
  `levels` int(11) DEFAULT 0,
  `gains` int(11) NOT NULL DEFAULT 100,
  `livraisons` int(11) DEFAULT 0,
  `vehicle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livraisons`
--

INSERT INTO `livraisons` (`uniqueid`, `levels`, `gains`, `livraisons`, `vehicle`) VALUES
(75, 50, 100, 5, '[\"boxville\"]'),
(1, 10, 100, 1, '[\"boxville\"]'),
(3, 90, 100, 9, '[\"boxville\"]');

-- --------------------------------------------------------

--
-- Structure de la table `maintenant`
--

CREATE TABLE `maintenant` (
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `maintenant`
--

INSERT INTO `maintenant` (`active`) VALUES
(0);

-- --------------------------------------------------------

--
-- Structure de la table `moto_categories`
--

CREATE TABLE `moto_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `moto_categories`
--

INSERT INTO `moto_categories` (`name`, `label`) VALUES
('motorcycles', 'Moto');

-- --------------------------------------------------------

--
-- Structure de la table `open_car`
--

CREATE TABLE `open_car` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `got` varchar(50) DEFAULT NULL,
  `NB` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(50) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `doubles` longtext NOT NULL DEFAULT '{"cles":[]}',
  `plate` varchar(255) NOT NULL,
  `vehicle` longtext NOT NULL,
  `status` int(12) DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `numero` int(12) DEFAULT NULL,
  `garage` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `degat` longtext DEFAULT NULL,
  `boutique` tinyint(1) NOT NULL DEFAULT 0,
  `garageid` int(11) NOT NULL DEFAULT 1,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `label` longtext NOT NULL DEFAULT 'A MODIFIER',
  `type` varchar(50) DEFAULT 'car',
  `job` text DEFAULT '\'unemployed\'',
  `propertiesID` int(11) DEFAULT 0,
  `fuel` longtext DEFAULT '100',
  `carseller` int(11) DEFAULT 0,
  `neons` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`owner`, `nom`, `doubles`, `plate`, `vehicle`, `status`, `inventory`, `numero`, `garage`, `name`, `position`, `degat`, `boutique`, `garageid`, `state`, `label`, `type`, `job`, `propertiesID`, `fuel`, `carseller`, `neons`) VALUES
('2', NULL, '{\"cles\":[]}', 'OKBD1061', '{\"modSpeakers\":-1,\"interiorColor\":0,\"paintType2\":0,\"modTrimB\":-1,\"engineHealth\":1000,\"driftTyres\":false,\"modAPlate\":-1,\"wheelWidth\":0.0,\"modDashboard\":-1,\"windows\":[4,5],\"modArchCover\":-1,\"modXenon\":false,\"modFender\":-1,\"modTank\":-1,\"tankHealth\":1000,\"modSmokeEnabled\":false,\"modAerials\":-1,\"modTurbo\":false,\"bulletProofTyres\":true,\"modShifterLeavers\":-1,\"modFrame\":-1,\"modRoof\":-1,\"modAirFilter\":-1,\"bodyHealth\":1000,\"modCustomTiresR\":false,\"modBackWheels\":-1,\"modSuspension\":-1,\"wheels\":0,\"modPlateHolder\":-1,\"oilLevel\":5,\"modSeats\":-1,\"xenonColor\":255,\"modOrnaments\":-1,\"modDoorSpeaker\":-1,\"tyres\":[],\"modTrimA\":-1,\"modSubwoofer\":-1,\"modRightFender\":-1,\"modRearBumper\":-1,\"modVanityPlate\":-1,\"extras\":{\"10\":1,\"12\":0},\"color2\":0,\"modHorns\":-1,\"modWindows\":-1,\"modGrille\":-1,\"wheelColor\":156,\"neonEnabled\":[false,false,false,false],\"modHydraulics\":false,\"modRoofLivery\":-1,\"modFrontBumper\":-1,\"modLightbar\":-1,\"neonColor\":[255,0,255],\"modBrakes\":-1,\"plate\":\"OKBD1061\",\"tyreSmokeColor\":[255,255,255],\"modArmor\":-1,\"modCustomTiresF\":false,\"dirtLevel\":9,\"modExhaust\":-1,\"modSteeringWheel\":-1,\"modNitrous\":-1,\"modHydrolic\":-1,\"modEngineBlock\":-1,\"model\":-344943009,\"modEngine\":-1,\"modHood\":-1,\"modDial\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"plateIndex\":0,\"modDoorR\":-1,\"modStruts\":-1,\"modTransmission\":-1,\"modTrunk\":-1,\"fuelLevel\":65,\"pearlescentColor\":5,\"wheelSize\":0.0,\"modLivery\":-1,\"windowTint\":-1,\"dashboardColor\":0,\"paintType1\":0,\"modFrontWheels\":-1,\"doors\":[],\"color1\":7}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 'blista', 'car', '\'unemployed\'', 0, '100', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ox_doorlock`
--

CREATE TABLE `ox_doorlock` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ox_doorlock`
--

INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
(389, 'Benny\'s', '{\"coords\":{\"x\":-230.8119659423828,\"y\":-1326.9986572265626,\"z\":30.24859428405761},\"heading\":270,\"model\":-48831039,\"state\":1,\"doors\":false,\"groups\":{\"mecano\":0},\"maxDistance\":5}'),
(390, 'Benny\'s', '{\"coords\":{\"x\":-215.73533630371095,\"y\":-1313.28564453125,\"z\":30.45402145385742},\"heading\":180,\"model\":-1453834687,\"state\":1,\"doors\":false,\"groups\":{\"mecano\":0},\"maxDistance\":5}'),
(391, 'Benny\'s', '{\"coords\":{\"x\":-207.76943969726563,\"y\":-1313.28564453125,\"z\":30.45402145385742},\"heading\":180,\"model\":-1453834687,\"state\":1,\"doors\":false,\"groups\":{\"mecano\":0},\"maxDistance\":5}'),
(392, 'Benny\'s', '{\"coords\":{\"x\":-230.69924926757813,\"y\":-1315.1455078125,\"z\":31.45024108886718},\"heading\":270,\"model\":-147325430,\"state\":1,\"doors\":false,\"groups\":{\"mecano\":0},\"maxDistance\":2}'),
(393, 'Unicorn', '{\"coords\":{\"x\":127.9578628540039,\"y\":-1298.50732421875,\"z\":29.41817283630371},\"maxDistance\":2,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":-1116041313,\"heading\":30,\"state\":1}'),
(394, 'Unicorn', '{\"coords\":{\"x\":127.47725677490235,\"y\":-1277.9189453125,\"z\":29.40505218505859},\"maxDistance\":2,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":634417522,\"heading\":300,\"state\":1}'),
(395, 'Unicorn', '{\"coords\":{\"x\":102.44144439697266,\"y\":-1301.199951171875,\"z\":29.40505218505859},\"maxDistance\":2,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":634417522,\"heading\":300,\"state\":1}'),
(396, 'Unicorn', '{\"coords\":{\"x\":97.64088439941406,\"y\":-1292.765625,\"z\":29.40505218505859},\"maxDistance\":2,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":634417522,\"heading\":300,\"state\":1}'),
(397, 'Unicorn', '{\"coords\":{\"x\":96.27252197265625,\"y\":-1291.91748046875,\"z\":29.40476608276367},\"maxDistance\":2,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":1226684428,\"heading\":210,\"state\":1}'),
(398, 'Unicorn', '{\"coords\":{\"x\":88.626220703125,\"y\":-1288.3873291015626,\"z\":30.28086280822754},\"maxDistance\":5,\"groups\":{\"unicorn\":0},\"doors\":false,\"model\":-190780785,\"heading\":210,\"state\":1}'),
(399, 'Unicorn', '{\"coords\":{\"x\":98.2591781616211,\"y\":-1299.4754638671876,\"z\":29.40505218505859},\"maxDistance\":2,\"groups\":{\"unicorn\":4},\"doors\":false,\"model\":634417522,\"heading\":300,\"state\":1}'),
(403, 'gouv1', '{\"coords\":{\"x\":-568.3768310546875,\"y\":-205.64947509765626,\"z\":38.49808502197265},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-567.73095703125,\"y\":-206.77691650390626,\"z\":38.49820327758789},\"model\":110411286,\"heading\":120},{\"coords\":{\"x\":-569.022705078125,\"y\":-204.52203369140626,\"z\":38.49796295166015},\"model\":110411286,\"heading\":300}]}'),
(404, 'gouv2', '{\"coords\":{\"x\":-560.0321044921875,\"y\":-200.95489501953126,\"z\":38.49074935913086},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-559.3864135742188,\"y\":-202.08290100097657,\"z\":38.49074935913086},\"model\":110411286,\"heading\":120},{\"coords\":{\"x\":-560.6777954101563,\"y\":-199.826904296875,\"z\":38.49074935913086},\"model\":110411286,\"heading\":300}]}'),
(405, 'gouv1', '{\"coords\":{\"x\":-557.024169921875,\"y\":-206.17874145507813,\"z\":38.49187850952148},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-557.671630859375,\"y\":-205.05099487304688,\"z\":38.49187850952148},\"model\":110411286,\"heading\":300},{\"coords\":{\"x\":-556.3766479492188,\"y\":-207.30648803710938,\"z\":38.49187850952148},\"model\":110411286,\"heading\":120}]}'),
(406, 'gouv1', '{\"coords\":{\"x\":-582.6526489257813,\"y\":-195.2283935546875,\"z\":38.60475158691406},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-581.834716796875,\"y\":-194.75848388671876,\"z\":38.60488128662109},\"model\":114775988,\"heading\":29},{\"coords\":{\"x\":-583.4705810546875,\"y\":-195.6982879638672,\"z\":38.60461807250976},\"model\":114775988,\"heading\":210}]}'),
(407, 'gouv1', '{\"coords\":{\"x\":-537.8333740234375,\"y\":-192.86798095703126,\"z\":38.3768081665039},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"model\":964838196,\"heading\":210,\"maxDistance\":3,\"doors\":false}'),
(408, 'gouv1', '{\"coords\":{\"x\":-543.501708984375,\"y\":-183.0404052734375,\"z\":38.37517929077148},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"model\":964838196,\"heading\":210,\"maxDistance\":3,\"doors\":false}'),
(409, 'gouv1', '{\"coords\":{\"x\":-552.1119995117188,\"y\":-191.58355712890626,\"z\":47.53792953491211},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":2,\"doors\":[{\"coords\":{\"x\":-553.2390747070313,\"y\":-192.22940063476563,\"z\":47.53792953491211},\"model\":110411286,\"heading\":30},{\"coords\":{\"x\":-550.9849243164063,\"y\":-190.9376983642578,\"z\":47.53792953491211},\"model\":110411286,\"heading\":210}]}'),
(410, 'gouv1', '{\"coords\":{\"x\":-546.9791870117188,\"y\":-191.7211456298828,\"z\":47.54242706298828},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-546.326171875,\"y\":-192.84524536132813,\"z\":47.54278945922851},\"model\":110411286,\"heading\":120},{\"coords\":{\"x\":-547.6322021484375,\"y\":-190.5970458984375,\"z\":47.54206848144531},\"model\":110411286,\"heading\":300}]}'),
(411, 'gouv1', '{\"coords\":{\"x\":-549.3726806640625,\"y\":-196.3401336669922,\"z\":47.53807830810547},\"autolock\":5,\"state\":1,\"groups\":{\"gouvernement\":0},\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-550.5003662109375,\"y\":-196.98597717285157,\"z\":47.53807830810547},\"model\":110411286,\"heading\":30},{\"coords\":{\"x\":-548.2450561523438,\"y\":-195.6942901611328,\"z\":47.53807830810547},\"model\":110411286,\"heading\":210}]}'),
(412, 'gus', '{\"passcode\":\"4968\",\"state\":1,\"characters\":[4],\"maxDistance\":3,\"doors\":[{\"coords\":{\"x\":-816.7160034179688,\"y\":179.09796142578126,\"z\":72.82737731933594},\"heading\":291,\"model\":159994461},{\"coords\":{\"x\":-816.1068115234375,\"y\":177.5108642578125,\"z\":72.82737731933594},\"heading\":291,\"model\":-1686014385}],\"coords\":{\"x\":-816.411376953125,\"y\":178.30441284179688,\"z\":72.82737731933594},\"autolock\":5}');

-- --------------------------------------------------------

--
-- Structure de la table `perso_preferences`
--

CREATE TABLE `perso_preferences` (
  `UniqueID` int(11) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `perso_preferences`
--

INSERT INTO `perso_preferences` (`UniqueID`, `data`) VALUES
(1, '{\"objects_infos\":{\"name\":\"objects_infos\",\"active\":true},\"clone_inventory\":{\"name\":\"clone_inventory\",\"active\":false}}'),
(2, '{\"clone_inventory\":{\"name\":\"clone_inventory\",\"active\":false}}'),
(3, '{\"clone_inventory\":{\"active\":false,\"name\":\"clone_inventory\"}}'),
(4, '[]'),
(5, '{\"clone_inventory\":{\"name\":\"clone_inventory\",\"active\":false}}'),
(6, '{\"clone_inventory\":{\"name\":\"clone_inventory\",\"active\":true}}'),
(7, '{\"objects_infos\":{\"name\":\"objects_infos\",\"active\":false}}'),
(8, '[]'),
(9, '[]'),
(10, '[]'),
(11, '[]'),
(12, '[]'),
(13, '[]'),
(14, '[]'),
(15, '[]'),
(50, '[]'),
(51, '[]'),
(52, '[]'),
(53, '[]'),
(54, '{\"clone_inventory\":{\"active\":true,\"name\":\"clone_inventory\"}}'),
(20, '[]'),
(55, '[]'),
(56, '[]'),
(57, '[]'),
(58, '[]'),
(59, '[]'),
(60, '[]'),
(61, '[]'),
(62, '[]'),
(63, '[]'),
(64, '[]'),
(65, '[]'),
(66, '[]'),
(67, '[]'),
(68, '[]'),
(69, '[]'),
(70, '{\"clone_inventory\":{\"name\":\"clone_inventory\",\"active\":false},\"objects_infos\":{\"name\":\"objects_infos\",\"active\":true}}'),
(71, '[]'),
(72, '[]'),
(73, '[]'),
(74, '[]'),
(75, '{\"objects_infos\":{\"name\":\"objects_infos\",\"active\":true}}'),
(76, '[]'),
(77, '[]'),
(78, '[]'),
(79, '[]'),
(80, '[]'),
(81, '[]'),
(82, '[]'),
(83, '[]'),
(84, '[]'),
(85, '[]'),
(86, '[]'),
(87, '[]'),
(88, '[]'),
(89, '[]'),
(90, '[]'),
(91, '[]'),
(92, '[]'),
(93, '[]'),
(94, '[]'),
(95, '[]'),
(96, '[]'),
(97, '[]'),
(98, '[]'),
(99, '{\"objects_infos\":{\"name\":\"objects_infos\",\"active\":true}}'),
(100, '[]'),
(101, '[]'),
(102, '[]'),
(103, '[]'),
(104, '[]'),
(105, '[]'),
(106, '[]'),
(107, '[]'),
(108, '[]'),
(109, '[]'),
(110, '[]'),
(111, '[]'),
(112, '[]'),
(113, '[]'),
(114, '[]'),
(115, '[]'),
(116, '[]'),
(117, '[]'),
(118, '[]'),
(119, '[]'),
(120, '[]'),
(121, '[]'),
(122, '[]'),
(123, '[]'),
(124, '[]'),
(125, '[]');

-- --------------------------------------------------------

--
-- Structure de la table `phone_accounts`
--

CREATE TABLE `phone_accounts` (
  `app` varchar(50) NOT NULL,
  `id` varchar(80) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `interested` text NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_alertjobs`
--

CREATE TABLE `phone_alertjobs` (
  `id` int(11) NOT NULL,
  `job` varchar(255) NOT NULL,
  `alerts` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_chatrooms`
--

CREATE TABLE `phone_chatrooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(50) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT NULL,
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_masked` tinyint(1) DEFAULT 0,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `phone_chatrooms`
--

INSERT INTO `phone_chatrooms` (`id`, `room_code`, `room_name`, `room_owner_id`, `room_owner_name`, `room_members`, `room_pin`, `unpaid_balance`, `is_masked`, `is_pinned`, `created`) VALUES
(1, 'social', 'Social', 'official', 'Government', NULL, NULL, 0.00, 0, 1, '2025-02-18 07:55:08'),
(2, 'lounge', 'The Lounge', 'official', 'Government', NULL, NULL, 0.00, 0, 1, '2025-02-18 07:55:08'),
(3, 'events', 'Events', 'official', 'Government', NULL, NULL, 0.00, 0, 1, '2025-02-18 07:55:08');

-- --------------------------------------------------------

--
-- Structure de la table `phone_chatroom_messages`
--

CREATE TABLE `phone_chatroom_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED DEFAULT NULL,
  `member_id` varchar(50) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_chats`
--

CREATE TABLE `phone_chats` (
  `app` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_invoices`
--

CREATE TABLE `phone_invoices` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `number` varchar(50) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `messages` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  `created` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_notifies`
--

CREATE TABLE `phone_notifies` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `msg_content` text NOT NULL,
  `msg_head` varchar(50) NOT NULL DEFAULT '',
  `app_name` text NOT NULL,
  `msg_time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_phones`
--

CREATE TABLE `phone_phones` (
  `id` varchar(100) NOT NULL,
  `owner_id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `face_id` varchar(100) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `is_setup` tinyint(1) DEFAULT 0,
  `assigned` tinyint(1) DEFAULT 0,
  `battery` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_phones`
--

INSERT INTO `phone_phones` (`id`, `owner_id`, `phone_number`, `name`, `pin`, `face_id`, `settings`, `is_setup`, `assigned`, `battery`) VALUES
('license:12b45c82a2e11bfb30e3c164711a3c589f2a89a3', 'license:12b45c82a2e11bfb30e3c164711a3c589f2a89a3', '55560535', 'Téléphone de Alexis', NULL, NULL, '{\"streamerMode\":false,\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"storage\":{\"total\":128000000,\"used\":8576331},\"display\":{\"size\":0.7,\"automatic\":false,\"brightness\":1,\"theme\":\"dark\",\"frameColor\":\"#000000\"},\"security\":{\"faceId\":false,\"pinCode\":false},\"doNotDisturb\":false,\"weather\":{\"celcius\":true},\"latestVersion\":\"2.0.3\",\"version\":\"2.0.3\",\"phone\":{\"showCallerId\":true},\"notifications\":[],\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"TikTok\"]],\"wallpaper\":{\"background\":\"rose2\",\"blur\":true},\"name\":\"Téléphone de Alexis\",\"locale\":\"fr\",\"sound\":{\"silent\":false,\"volume\":0.45,\"ringtone\":\"harp\",\"texttone\":\"default\"},\"airplaneMode\":false,\"time\":{\"twelveHourClock\":false}}', 1, 0, 100),
('license:1840cc9607cd710b1fc588c00029773bbcc63855', 'license:1840cc9607cd710b1fc588c00029773bbcc63855', '55597121', 'Téléphone de Yanis', '1234', 'license:1840cc9607cd710b1fc588c00029773bbcc63855', '{\"wallpaper\":{\"blur\":false,\"background\":\"cloud8\"},\"airplaneMode\":false,\"notifications\":[],\"sound\":{\"volume\":0.5,\"silent\":false,\"ringtone\":\"default\",\"texttone\":\"default\"},\"weather\":{\"celcius\":false},\"locale\":\"fr\",\"storage\":{\"used\":8576331,\"total\":128000000},\"phone\":{\"showCallerId\":true},\"security\":{\"pinCode\":true,\"faceId\":true},\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"latestVersion\":\"2.1.0\",\"time\":{\"twelveHourClock\":false},\"version\":\"2.0.3\",\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]],\"name\":\"Téléphone de Yanis\",\"streamerMode\":false,\"doNotDisturb\":false,\"display\":{\"automatic\":false,\"theme\":\"dark\",\"size\":0.7,\"brightness\":1}}', 1, 0, 100),
('license:19101c65e5a20141ad5232becb2bd4f03ed49f90', 'license:19101c65e5a20141ad5232becb2bd4f03ed49f90', '55535389', 'Téléphone de jules ', '0000', 'license:19101c65e5a20141ad5232becb2bd4f03ed49f90', '{\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"airplaneMode\":false,\"doNotDisturb\":false,\"sound\":{\"volume\":0.5,\"silent\":false,\"texttone\":\"default\",\"ringtone\":\"default\"},\"weather\":{\"celcius\":false},\"locale\":\"fr\",\"display\":{\"theme\":\"dark\",\"automatic\":false,\"size\":0.7,\"brightness\":1},\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"security\":{\"faceId\":true,\"pinCode\":true},\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"Instagram\"]],\"latestVersion\":\"2.1.0\",\"time\":{\"twelveHourClock\":false},\"version\":\"2.0.3\",\"name\":\"Téléphone de jules \",\"phone\":{\"showCallerId\":true},\"streamerMode\":false,\"notifications\":[],\"storage\":{\"used\":8576331,\"total\":128000000}}', 1, 0, 100),
('license:242ae1959b1bc408fbf88b0c8ce39065bc2ae003', 'license:242ae1959b1bc408fbf88b0c8ce39065bc2ae003', '55548004', 'Téléphone de awdawd', '2408', 'license:242ae1959b1bc408fbf88b0c8ce39065bc2ae003', '{\"notifications\":[],\"doNotDisturb\":false,\"security\":{\"pinCode\":true,\"faceId\":true},\"locale\":\"fr\",\"weather\":{\"celcius\":false},\"time\":{\"twelveHourClock\":false},\"storage\":{\"used\":8576331,\"total\":128000000},\"latestVersion\":\"2.1.0\",\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"airplaneMode\":false,\"lockscreen\":{\"color\":\"gradient\",\"fontStyle\":1,\"layout\":1},\"sound\":{\"volume\":0.5,\"texttone\":\"default\",\"silent\":false,\"ringtone\":\"default\"},\"streamerMode\":false,\"phone\":{\"showCallerId\":true},\"display\":{\"theme\":\"dark\",\"size\":0.7,\"brightness\":1,\"automatic\":false},\"name\":\"Téléphone de awdawd\",\"version\":\"2.0.3\",\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]]}', 1, 0, 100),
('license:34bafb152520de122b1ba49bcd2bf99682db883b', 'license:34bafb152520de122b1ba49bcd2bf99682db883b', '55563838', ' Tyson ', NULL, NULL, '{\"notifications\":[],\"doNotDisturb\":false,\"security\":{\"pinCode\":false,\"faceId\":false},\"locale\":\"fr\",\"weather\":{\"celcius\":false},\"time\":{\"twelveHourClock\":false},\"name\":\" Tyson \",\"airplaneMode\":false,\"wallpaper\":{\"blur\":false,\"background\":\"cloud8\"},\"lockscreen\":{\"color\":\"gradient\",\"fontStyle\":1,\"layout\":1},\"phone\":{\"showCallerId\":true},\"storage\":{\"used\":8576331,\"total\":128000000},\"streamerMode\":false,\"sound\":{\"volume\":0.5,\"texttone\":\"default\",\"silent\":false,\"ringtone\":\"default\"},\"display\":{\"theme\":\"dark\",\"brightness\":1,\"size\":0.7,\"automatic\":false},\"latestVersion\":\"2.0.3\",\"version\":\"2.0.3\",\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]]}', 1, 0, 100),
('license:473a2b63cd0512f0f298741d60370e29d6d28547', 'license:473a2b63cd0512f0f298741d60370e29d6d28547', '55599173', 'Téléphone de june ', NULL, NULL, '{\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"airplaneMode\":false,\"notifications\":[],\"sound\":{\"volume\":0.5,\"silent\":false,\"texttone\":\"default\",\"ringtone\":\"default\"},\"weather\":{\"celcius\":false},\"locale\":\"fr\",\"storage\":{\"used\":8576331,\"total\":128000000},\"phone\":{\"showCallerId\":true},\"security\":{\"pinCode\":false,\"faceId\":false},\"display\":{\"theme\":\"dark\",\"automatic\":false,\"size\":0.7,\"brightness\":1},\"lockscreen\":{\"layout\":1,\"fontStyle\":1,\"color\":\"gradient\"},\"time\":{\"twelveHourClock\":false},\"version\":\"2.0.3\",\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]],\"doNotDisturb\":false,\"streamerMode\":false,\"name\":\"Téléphone de june \",\"latestVersion\":\"2.1.0\"}', 1, 0, 100),
('license:4b0dd07b5e670e661a94febf8783c07af9e6026e', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e', '55599843', 'Téléphone de Jean Yves ', NULL, NULL, '{\"notifications\":[],\"doNotDisturb\":false,\"security\":{\"pinCode\":false,\"faceId\":false},\"locale\":\"fr\",\"sound\":{\"silent\":false,\"texttone\":\"default\",\"volume\":0.5,\"ringtone\":\"default\"},\"time\":{\"twelveHourClock\":false},\"lockscreen\":{\"color\":\"gradient\",\"fontStyle\":1,\"layout\":1},\"weather\":{\"celcius\":false},\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"storage\":{\"used\":8576331,\"total\":128000000},\"phone\":{\"showCallerId\":true},\"version\":\"2.0.3\",\"streamerMode\":false,\"latestVersion\":\"2.0.3\",\"display\":{\"theme\":\"dark\",\"brightness\":1,\"size\":0.7,\"automatic\":false},\"name\":\"Téléphone de Jean Yves \",\"airplaneMode\":false,\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]]}', 1, 0, 100),
('license:500afc62035c6ad0a209438b146d7d8515c6ae99', 'license:500afc62035c6ad0a209438b146d7d8515c6ae99', '55533801', 'Téléphone de Kurtis', '0000', 'license:500afc62035c6ad0a209438b146d7d8515c6ae99', '{\"notifications\":[],\"doNotDisturb\":false,\"security\":{\"faceId\":true,\"pinCode\":true},\"locale\":\"fr\",\"sound\":{\"silent\":false,\"texttone\":\"default\",\"volume\":0.5,\"ringtone\":\"default\"},\"airplaneMode\":false,\"weather\":{\"celcius\":false},\"name\":\"Téléphone de Kurtis\",\"version\":\"2.0.3\",\"wallpaper\":{\"blur\":false,\"background\":\"cloud8\"},\"phone\":{\"showCallerId\":true},\"lockscreen\":{\"color\":\"gradient\",\"fontStyle\":1,\"layout\":1},\"streamerMode\":false,\"time\":{\"twelveHourClock\":false},\"display\":{\"theme\":\"dark\",\"brightness\":1,\"automatic\":false,\"size\":0.7},\"latestVersion\":\"2.1.0\",\"storage\":{\"used\":8576331,\"total\":128000000},\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]]}', 1, 0, 100),
('license:5212c5e307fb6b06db10b3181025b1b29a8d6600', 'license:5212c5e307fb6b06db10b3181025b1b29a8d6600', '55502080', ' Wade', NULL, NULL, '{\"notifications\":[],\"doNotDisturb\":false,\"security\":{\"pinCode\":false,\"faceId\":false},\"locale\":\"fr\",\"sound\":{\"volume\":0.5,\"texttone\":\"default\",\"silent\":false,\"ringtone\":\"default\"},\"airplaneMode\":false,\"time\":{\"twelveHourClock\":false},\"wallpaper\":{\"background\":\"underwater\",\"blur\":false},\"version\":\"2.0.3\",\"storage\":{\"used\":9327931,\"total\":128000000},\"lockscreen\":{\"color\":\"gradient\",\"fontStyle\":1,\"layout\":1},\"latestVersion\":\"2.0.3\",\"streamerMode\":false,\"weather\":{\"celcius\":false},\"display\":{\"theme\":\"dark\",\"brightness\":1,\"automatic\":false,\"size\":0.7},\"name\":\" Wade\",\"phone\":{\"showCallerId\":true},\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"MarketPlace\",\"Instagram\",\"Twitter\",\"Tinder\"]]}', 1, 0, 100),
('license:54ba9fcd510212fc5451570083b78743eb6cd8b9', 'license:54ba9fcd510212fc5451570083b78743eb6cd8b9', '55574671', 'Téléphone de Leo', '0000', 'license:54ba9fcd510212fc5451570083b78743eb6cd8b9', '{\"streamerMode\":false,\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"storage\":{\"used\":8576331,\"total\":128000000},\"display\":{\"theme\":\"dark\",\"brightness\":1,\"size\":0.7,\"automatic\":false},\"security\":{\"pinCode\":true,\"faceId\":true},\"doNotDisturb\":false,\"weather\":{\"celcius\":false},\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"latestVersion\":\"2.0.3\",\"phone\":{\"showCallerId\":true},\"notifications\":[],\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]],\"version\":\"2.0.3\",\"name\":\"Téléphone de Leo\",\"locale\":\"fr\",\"sound\":{\"silent\":false,\"ringtone\":\"default\",\"volume\":0.5,\"texttone\":\"default\"},\"airplaneMode\":false,\"time\":{\"twelveHourClock\":false}}', 1, 0, 100),
('license:5df0ebb39c7e9413737b468aba7788349345ba50', 'license:5df0ebb39c7e9413737b468aba7788349345ba50', '55580855', 'Pablito Pop', NULL, NULL, '{\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"airplaneMode\":false,\"notifications\":[],\"sound\":{\"volume\":0.5,\"silent\":false,\"texttone\":\"default\",\"ringtone\":\"default\"},\"weather\":{\"celcius\":false},\"locale\":\"fr\",\"display\":{\"automatic\":false,\"theme\":\"dark\",\"size\":0.7,\"brightness\":1},\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"security\":{\"faceId\":false,\"pinCode\":false},\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"Tinder\"]],\"latestVersion\":\"2.1.0\",\"time\":{\"twelveHourClock\":false},\"version\":\"2.0.3\",\"phone\":{\"showCallerId\":true},\"name\":\"Pablito Pop\",\"streamerMode\":false,\"doNotDisturb\":false,\"storage\":{\"used\":8576331,\"total\":128000000}}', 1, 0, 100),
('license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', '55593210', 'Gustave Picard', '3100', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', '{\"notifications\":[],\"doNotDisturb\":false,\"security\":{\"pinCode\":true,\"faceId\":true},\"locale\":\"fr\",\"weather\":{\"celcius\":false},\"airplaneMode\":false,\"storage\":{\"used\":8576331,\"total\":128000000},\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"version\":\"2.0.3\",\"time\":{\"twelveHourClock\":false},\"lockscreen\":{\"color\":\"gradient\",\"fontStyle\":1,\"layout\":1},\"sound\":{\"volume\":0.5,\"texttone\":\"default\",\"silent\":false,\"ringtone\":\"default\"},\"streamerMode\":false,\"name\":\"Gustave Picard\",\"display\":{\"automatic\":false,\"size\":0.7,\"theme\":\"light\",\"brightness\":1},\"latestVersion\":\"2.1.0\",\"phone\":{\"showCallerId\":true},\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]]}', 1, 0, 100),
('license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', '55578622', ' Alban ', NULL, NULL, '{\"notifications\":[],\"doNotDisturb\":false,\"security\":{\"faceId\":false,\"pinCode\":false},\"locale\":\"fr\",\"sound\":{\"silent\":false,\"texttone\":\"default\",\"volume\":0.5,\"ringtone\":\"default\"},\"airplaneMode\":false,\"phone\":{\"showCallerId\":true},\"time\":{\"twelveHourClock\":false},\"version\":\"2.0.3\",\"lockscreen\":{\"color\":\"gradient\",\"fontStyle\":1,\"layout\":1},\"storage\":{\"used\":8576426.06,\"total\":128000000},\"latestVersion\":\"2.1.0\",\"streamerMode\":false,\"weather\":{\"celcius\":false},\"display\":{\"theme\":\"dark\",\"brightness\":1,\"size\":0.7,\"automatic\":false},\"name\":\" Alban \",\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]]}', 1, 0, 100),
('license:9401a46ea0e6272f38b847b85732515e7b26e69f', 'license:9401a46ea0e6272f38b847b85732515e7b26e69f', '55595333', 'Brayan', '0000', 'license:9401a46ea0e6272f38b847b85732515e7b26e69f', '{\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"airplaneMode\":false,\"phone\":{\"showCallerId\":true},\"sound\":{\"volume\":0.5,\"silent\":false,\"texttone\":\"default\",\"ringtone\":\"default\"},\"name\":\"Brayan\",\"locale\":\"fr\",\"storage\":{\"used\":8672027.67,\"total\":128000000},\"weather\":{\"celcius\":false},\"security\":{\"faceId\":true,\"pinCode\":true},\"latestVersion\":\"2.0.3\",\"lockscreen\":{\"layout\":1,\"fontStyle\":1,\"color\":\"gradient\"},\"time\":{\"twelveHourClock\":false},\"version\":\"2.0.3\",\"display\":{\"automatic\":false,\"theme\":\"light\",\"size\":0.7,\"brightness\":1},\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"DarkChat\",\"MarketPlace\",\"TikTok\",\"Twitter\",\"Instagram\",\"Crypto\",\"Tinder\",\"YellowPages\"]],\"streamerMode\":false,\"notifications\":[],\"doNotDisturb\":false}', 1, 0, 100),
('license:99572c46c4419a0f597d110a31640f1a3ff1655e', 'license:99572c46c4419a0f597d110a31640f1a3ff1655e', '55554596', 'Marco Alvarez', NULL, NULL, '{\"doNotDisturb\":false,\"name\":\"Marco Alvarez\",\"phone\":{\"showCallerId\":true},\"notifications\":[],\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"airplaneMode\":false,\"storage\":{\"used\":8582399.339999998,\"total\":128000000},\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]],\"locale\":\"fr\",\"weather\":{\"celcius\":false},\"sound\":{\"volume\":0.5,\"silent\":false,\"texttone\":\"default\",\"ringtone\":\"default\"},\"security\":{\"faceId\":false,\"pinCode\":false},\"lockscreen\":{\"color\":\"gradient\",\"fontStyle\":1,\"layout\":1},\"version\":\"2.0.3\",\"streamerMode\":false,\"latestVersion\":\"2.1.0\",\"display\":{\"brightness\":1,\"theme\":\"dark\",\"automatic\":false,\"size\":0.7},\"time\":{\"twelveHourClock\":false}}', 1, 0, 100),
('license:9c6b7781157b6d228ad93235d97ae796f6537f18', 'license:9c6b7781157b6d228ad93235d97ae796f6537f18', '55570385', 'Téléphone de Alvaro', '0000', 'license:9c6b7781157b6d228ad93235d97ae796f6537f18', '{\"streamerMode\":false,\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"storage\":{\"total\":128000000,\"used\":8799331},\"display\":{\"theme\":\"light\",\"brightness\":1,\"size\":0.7,\"automatic\":false},\"security\":{\"faceId\":true,\"pinCode\":true},\"doNotDisturb\":false,\"weather\":{\"celcius\":false},\"latestVersion\":\"2.0.3\",\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"phone\":{\"showCallerId\":true},\"notifications\":[],\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"Tinder\",\"Crypto\",\"TikTok\",\"Instagram\",\"MarketPlace\",\"DarkChat\",\"Twitter\",\"YellowPages\"]],\"airplaneMode\":false,\"name\":\"Téléphone de Alvaro\",\"locale\":\"fr\",\"sound\":{\"silent\":false,\"volume\":0.5,\"ringtone\":\"default\",\"texttone\":\"default\"},\"version\":\"2.0.3\",\"time\":{\"twelveHourClock\":false}}', 1, 0, 100),
('license:b393d8a65f3ae0b77472b99fb8071c5e1f13c944', 'license:b393d8a65f3ae0b77472b99fb8071c5e1f13c944', '55586629', 'Eric', '0000', 'license:b393d8a65f3ae0b77472b99fb8071c5e1f13c944', '{\"latestVersion\":\"2.0.3\",\"weather\":{\"celcius\":false},\"security\":{\"pinCode\":true,\"faceId\":true},\"storage\":{\"used\":8576331,\"total\":128000000},\"streamerMode\":false,\"sound\":{\"texttone\":\"default\",\"ringtone\":\"default\",\"silent\":false,\"volume\":0.5},\"time\":{\"twelveHourClock\":false},\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]],\"name\":\"Eric\",\"version\":\"2.0.3\",\"airplaneMode\":false,\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"locale\":\"fr\",\"doNotDisturb\":false,\"phone\":{\"showCallerId\":true},\"wallpaper\":{\"blur\":false,\"background\":\"cloud8\"},\"notifications\":[],\"display\":{\"automatic\":false,\"theme\":\"dark\",\"size\":0.7,\"brightness\":1}}', 1, 0, 100),
('license:c2cb2d5b547242283b0ecf3ac9db8286ae2f45d6', 'license:c2cb2d5b547242283b0ecf3ac9db8286ae2f45d6', '55579410', 'Téléphone de patrick', '0509', 'license:c2cb2d5b547242283b0ecf3ac9db8286ae2f45d6', '{\"streamerMode\":false,\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"storage\":{\"total\":128000000,\"used\":8576331},\"display\":{\"theme\":\"dark\",\"brightness\":1,\"size\":0.7,\"automatic\":false},\"security\":{\"faceId\":true,\"pinCode\":true},\"doNotDisturb\":false,\"weather\":{\"celcius\":false},\"latestVersion\":\"2.0.3\",\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"phone\":{\"showCallerId\":true},\"notifications\":[],\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"MarketPlace\",\"Crypto\",\"DarkChat\"]],\"airplaneMode\":false,\"name\":\"Téléphone de patrick\",\"locale\":\"fr\",\"sound\":{\"silent\":false,\"volume\":0.5,\"ringtone\":\"default\",\"texttone\":\"default\"},\"version\":\"2.0.3\",\"time\":{\"twelveHourClock\":false}}', 1, 0, 100),
('license:c7047a717d79967217452e8ff7bf40cd8b5fa667', 'license:c7047a717d79967217452e8ff7bf40cd8b5fa667', '55557038', 'Jaden', '1111', 'license:c7047a717d79967217452e8ff7bf40cd8b5fa667', '{\"streamerMode\":false,\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"storage\":{\"total\":128000000,\"used\":8576331},\"display\":{\"theme\":\"light\",\"brightness\":1,\"size\":0.7,\"automatic\":false},\"security\":{\"faceId\":true,\"pinCode\":true},\"doNotDisturb\":false,\"weather\":{\"celcius\":false},\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"latestVersion\":\"2.0.3\",\"phone\":{\"showCallerId\":true},\"notifications\":[],\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"Instagram\"]],\"airplaneMode\":false,\"name\":\"Jaden\",\"locale\":\"fr\",\"sound\":{\"silent\":false,\"volume\":0.5,\"ringtone\":\"default\",\"texttone\":\"default\"},\"version\":\"2.0.3\",\"time\":{\"twelveHourClock\":false}}', 1, 0, 100),
('license:cb21ef59ccffd45de19271c7756f3ea297e13a35', 'license:cb21ef59ccffd45de19271c7756f3ea297e13a35', '55538201', 'Téléphone de jolyt', '7278', 'license:cb21ef59ccffd45de19271c7756f3ea297e13a35', '{\"notifications\":[],\"doNotDisturb\":false,\"security\":{\"faceId\":true,\"pinCode\":true},\"locale\":\"fr\",\"sound\":{\"silent\":false,\"texttone\":\"default\",\"volume\":0.5,\"ringtone\":\"default\"},\"airplaneMode\":false,\"time\":{\"twelveHourClock\":false},\"latestVersion\":\"2.1.0\",\"version\":\"2.0.3\",\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"storage\":{\"used\":8576331,\"total\":128000000},\"phone\":{\"showCallerId\":true},\"streamerMode\":false,\"weather\":{\"celcius\":false},\"display\":{\"automatic\":false,\"brightness\":1,\"size\":0.7,\"theme\":\"light\"},\"name\":\"Téléphone de jolyt\",\"lockscreen\":{\"color\":\"gradient\",\"fontStyle\":1,\"layout\":1},\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"Crypto\",\"Twitter\",\"TikTok\",\"Tinder\",\"Instagram\",\"MarketPlace\",\"DarkChat\",\"YellowPages\"]]}', 1, 0, 100),
('license:cd7a190f9f5e1519d3c533ecbd70ca7163270d67', 'license:cd7a190f9f5e1519d3c533ecbd70ca7163270d67', '55546645', 'Donk', '0000', 'license:cd7a190f9f5e1519d3c533ecbd70ca7163270d67', '{\"streamerMode\":false,\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"storage\":{\"total\":128000000,\"used\":8576331},\"display\":{\"theme\":\"dark\",\"brightness\":1,\"size\":0.7,\"automatic\":false},\"security\":{\"faceId\":true,\"pinCode\":true},\"doNotDisturb\":false,\"weather\":{\"celcius\":false},\"latestVersion\":\"2.0.3\",\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"phone\":{\"showCallerId\":true},\"notifications\":[],\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"DarkChat\",\"MarketPlace\",\"Twitter\",\"Instagram\",\"Crypto\",\"TikTok\",\"Tinder\",\"YellowPages\"]],\"version\":\"2.0.3\",\"name\":\"Donk\",\"locale\":\"fr\",\"sound\":{\"silent\":false,\"volume\":0.5,\"ringtone\":\"default\",\"texttone\":\"default\"},\"airplaneMode\":false,\"time\":{\"twelveHourClock\":false}}', 1, 0, 100),
('license:dd6728cf227a8864c2f25bfdb439fb9bd7cd4c0b', 'license:dd6728cf227a8864c2f25bfdb439fb9bd7cd4c0b', '55567329', 'Téléphone de Marco', NULL, NULL, '{\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"airplaneMode\":false,\"phone\":{\"showCallerId\":true},\"sound\":{\"volume\":0.5,\"silent\":false,\"ringtone\":\"default\",\"texttone\":\"default\"},\"weather\":{\"celcius\":false},\"locale\":\"fr\",\"storage\":{\"total\":128000000,\"used\":8576331},\"doNotDisturb\":false,\"security\":{\"pinCode\":false,\"faceId\":false},\"display\":{\"automatic\":false,\"theme\":\"dark\",\"size\":0.7,\"brightness\":1},\"latestVersion\":\"2.1.0\",\"time\":{\"twelveHourClock\":false},\"version\":\"2.0.3\",\"name\":\"Téléphone de Marco\",\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"streamerMode\":false,\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]],\"notifications\":[]}', 1, 0, 100),
('license:e21baac241ad40dadc65770b25e4edd0a57a011b', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', '55588089', 'Sandrine LaQueen', '1111', 'license:e21baac241ad40dadc65770b25e4edd0a57a011b', '{\"phone\":{\"showCallerId\":true},\"storage\":{\"used\":8576983.299999999,\"total\":128000000},\"weather\":{\"celcius\":false},\"time\":{\"twelveHourClock\":false},\"version\":\"2.0.3\",\"airplaneMode\":false,\"display\":{\"size\":1.1,\"brightness\":1,\"automatic\":false,\"frameColor\":\"#E63B7B\",\"theme\":\"dark\"},\"notifications\":[],\"name\":\"Sandrine LaQueen\",\"streamerMode\":false,\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"security\":{\"faceId\":true,\"pinCode\":true},\"sound\":{\"ringtone\":\"default\",\"volume\":0.5,\"texttone\":\"default\",\"silent\":false},\"locale\":\"fr\",\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"Instagram\"]],\"doNotDisturb\":false,\"latestVersion\":\"2.1.0\",\"lockscreen\":{\"layout\":1,\"fontStyle\":1,\"color\":\"gradient\"}}', 1, 0, 100),
('license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', '55545342', 'Ava', '2107', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', '{\"notifications\":[],\"airplaneMode\":false,\"sound\":{\"silent\":false,\"texttone\":\"default\",\"volume\":0.5,\"ringtone\":\"default\"},\"time\":{\"twelveHourClock\":false},\"security\":{\"faceId\":true,\"pinCode\":true},\"weather\":{\"celcius\":false},\"wallpaper\":{\"background\":\"cloud8\",\"blur\":false},\"version\":\"2.0.3\",\"name\":\"Ava\",\"display\":{\"theme\":\"dark\",\"size\":0.7,\"automatic\":false,\"brightness\":1},\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\"]],\"lockscreen\":{\"layout\":1,\"color\":\"gradient\",\"fontStyle\":1},\"storage\":{\"used\":8576331,\"total\":128000000},\"phone\":{\"showCallerId\":true},\"latestVersion\":\"2.0.3\",\"locale\":\"fr\",\"streamerMode\":false,\"doNotDisturb\":false}', 1, 0, 100),
('license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', '55562302', 'Lory', '0000', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', '{\"phone\":{\"showCallerId\":true},\"storage\":{\"total\":128000000,\"used\":8576331},\"weather\":{\"celcius\":false},\"lockscreen\":{\"layout\":1,\"fontStyle\":1,\"color\":\"gradient\"},\"version\":\"2.0.3\",\"airplaneMode\":false,\"display\":{\"size\":0.7,\"brightness\":1,\"automatic\":false,\"theme\":\"dark\"},\"notifications\":[],\"name\":\"Lory\",\"streamerMode\":false,\"wallpaper\":{\"blur\":false,\"background\":\"cloud8\"},\"security\":{\"faceId\":true,\"pinCode\":true},\"sound\":{\"ringtone\":\"default\",\"volume\":0.5,\"texttone\":\"default\",\"silent\":false},\"locale\":\"fr\",\"time\":{\"twelveHourClock\":false},\"doNotDisturb\":false,\"latestVersion\":\"2.1.0\",\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"Instagram\"]]}', 1, 0, 100);

-- --------------------------------------------------------

--
-- Structure de la table `playerstattoos`
--

CREATE TABLE `playerstattoos` (
  `identifier` varchar(50) NOT NULL,
  `tattoos` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `playerstattoos`
--

INSERT INTO `playerstattoos` (`identifier`, `tattoos`) VALUES
('license:968abcbb2dced60f0e6caeea28c431b744430742', '[{\"cat\":-2086773,\"name\":1860213958},{\"cat\":-2086773,\"name\":193320466},{\"cat\":-2086773,\"name\":434115743},{\"cat\":-2086773,\"name\":1819096318},{\"cat\":-975527441,\"name\":893288510},{\"cat\":-975527441,\"name\":962023066},{\"cat\":-363871405,\"name\":211084},{\"cat\":-363871405,\"name\":-1009472289},{\"cat\":-363871405,\"name\":-1462570018},{\"cat\":-363871405,\"name\":361610929},{\"cat\":-363871405,\"name\":-1170154756},{\"cat\":-363871405,\"name\":-1406186689}]'),
('license:f4d3fb85bea564473e906a45a96ba15a3141526b', '[{\"name\":893288510,\"cat\":-975527441},{\"name\":413754974,\"cat\":-975527441}]'),
('license:7a293177d8a85a2e64817f3e16dfa8aff94acf00', '[{\"cat\":484754152,\"name\":-1806626643}]'),
('license:d5c1412a77f75f2a4bd47d0ae06c04e3f205df3d', '[{\"cat\":62137527,\"name\":-2053984264},{\"cat\":1529191571,\"name\":-1222200221},{\"cat\":-240234547,\"name\":745912106}]'),
('license:99572c46c4419a0f597d110a31640f1a3ff1655e', '[{\"cat\":-2086773,\"name\":-1126042648},{\"cat\":-2086773,\"name\":1058197095},{\"cat\":-1398869298,\"name\":1348967356},{\"name\":709663738,\"cat\":-2086773},{\"name\":-188624940,\"cat\":1616273011}]'),
('license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', '[{\"cat\":1616273011,\"name\":-1365916084},{\"cat\":-1056335443,\"name\":-47863515},{\"cat\":-1056335443,\"name\":1720638120},{\"cat\":484754152,\"name\":-1008363280},{\"cat\":484754152,\"name\":2049704410},{\"cat\":484754152,\"name\":-1272951326},{\"cat\":598190139,\"name\":-814317724}]'),
('license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7', '[{\"cat\":598190139,\"name\":393127953},{\"cat\":-1398869298,\"name\":43105745},{\"cat\":-240234547,\"name\":-1530816149}]'),
('license:86e0cd20f839d97378b1021e6529d0c210c6286e', '[{\"cat\":-2086773,\"name\":193320466},{\"cat\":-1398869298,\"name\":-441853516},{\"cat\":-240234547,\"name\":1988133312},{\"cat\":1616273011,\"name\":1832021545},{\"cat\":1616273011,\"name\":-1521133289},{\"cat\":1616273011,\"name\":-303409019},{\"cat\":1616273011,\"name\":1173525590},{\"cat\":-975527441,\"name\":2056773549},{\"cat\":-975527441,\"name\":893288510},{\"cat\":-975527441,\"name\":1963590204},{\"cat\":-975527441,\"name\":919272855},{\"cat\":-975527441,\"name\":-88186884},{\"name\":-241894528,\"cat\":-975527441},{\"name\":-1425414573,\"cat\":-975527441},{\"name\":2048866271,\"cat\":1529191571},{\"name\":-676067408,\"cat\":1529191571},{\"name\":-578277428,\"cat\":1529191571},{\"name\":1676439910,\"cat\":1529191571},{\"name\":-294157184,\"cat\":1529191571},{\"name\":1654917353,\"cat\":1529191571},{\"name\":-13131391,\"cat\":1529191571},{\"name\":-1401933531,\"cat\":1529191571},{\"name\":1522216340,\"cat\":62137527},{\"name\":283995288,\"cat\":62137527},{\"name\":1744801848,\"cat\":62137527},{\"name\":-636638153,\"cat\":62137527},{\"name\":843062770,\"cat\":1926256505},{\"name\":-1462570018,\"cat\":-363871405},{\"name\":-1873628095,\"cat\":-363871405},{\"name\":361610929,\"cat\":-363871405}]'),
('license:9401a46ea0e6272f38b847b85732515e7b26e69f', '[{\"name\":1708731435,\"cat\":598190139},{\"name\":827974775,\"cat\":-2086773},{\"name\":1595162603,\"cat\":-2086773},{\"name\":-1060893559,\"cat\":-363871405},{\"name\":2056773549,\"cat\":-975527441},{\"name\":401532197,\"cat\":1529191571}]'),
('license:19101c65e5a20141ad5232becb2bd4f03ed49f90', '[{\"cat\":1616273011,\"name\":-1841627189},{\"cat\":1529191571,\"name\":-1222200221},{\"cat\":-363871405,\"name\":-1462570018},{\"cat\":-363871405,\"name\":-1170154756},{\"cat\":1185637852,\"name\":113768799},{\"cat\":1347816957,\"name\":-145302944},{\"cat\":598190139,\"name\":-1352706360},{\"cat\":-975527441,\"name\":-2088223199},{\"cat\":1529191571,\"name\":788520303},{\"cat\":-975527441,\"name\":-504012739}]'),
('license:c7047a717d79967217452e8ff7bf40cd8b5fa667', '[{\"name\":2024821433,\"cat\":598190139},{\"name\":-791841628,\"cat\":1926256505},{\"name\":2144765713,\"cat\":-1016521996},{\"name\":-962894007,\"cat\":-1016521996},{\"name\":-187785912,\"cat\":-1016521996},{\"name\":25158851,\"cat\":-1719270477},{\"name\":-270395278,\"cat\":-1398869298},{\"name\":-694786597,\"cat\":-1398869298},{\"name\":-1210698509,\"cat\":-1398869298},{\"name\":123359970,\"cat\":-1398869298},{\"name\":1395583642,\"cat\":-1398869298},{\"name\":523240077,\"cat\":-1398869298},{\"name\":1285643631,\"cat\":-1398869298}]'),
('license:500afc62035c6ad0a209438b146d7d8515c6ae99', '[{\"name\":26968202,\"cat\":-1056335443},{\"name\":-47863515,\"cat\":-1056335443}]');

-- --------------------------------------------------------

--
-- Structure de la table `players_props`
--

CREATE TABLE `players_props` (
  `UniqueID` int(11) NOT NULL DEFAULT 0,
  `data` longtext DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `players_props`
--

INSERT INTO `players_props` (`UniqueID`, `data`, `name`, `id`) VALUES
(1, '{\"count\":1,\"name\":\"prop_fib_3b_bench\",\"owner\":1,\"label\":\"Chaise 3 places\"}', 'prop_fib_3b_bench', 5),
(1, '{\"name\":\"prop_fib_3b_bench\",\"label\":\"Chaise 3 places\",\"owner\":1,\"count\":1}', 'prop_fib_3b_bench', 6);

-- --------------------------------------------------------

--
-- Structure de la table `players_territories`
--

CREATE TABLE `players_territories` (
  `id` int(11) NOT NULL,
  `control` varchar(50) DEFAULT 'none',
  `namecontrol` varchar(50) DEFAULT 'none',
  `influence` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_clothes`
--

CREATE TABLE `player_clothes` (
  `UniqueID` int(11) NOT NULL,
  `clothes` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_clothes`
--

INSERT INTO `player_clothes` (`UniqueID`, `clothes`) VALUES
(1, '[{\"label\":\"Chic Noir\",\"data\":[{\"number\":0,\"name\":\"arms\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":15,\"name\":\"tshirt_1\"},{\"number\":0,\"name\":\"shoes_2\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":0,\"name\":\"pants_2\"},{\"number\":0,\"name\":\"tshirt_2\"},{\"number\":10,\"name\":\"shoes_1\"},{\"number\":3,\"name\":\"torso_2\"},{\"number\":654,\"name\":\"torso_1\"},{\"number\":92,\"name\":\"pants_1\"}]},{\"label\":\"Summer Black\",\"data\":[{\"number\":5,\"name\":\"arms\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":5,\"name\":\"tshirt_1\"},{\"number\":0,\"name\":\"shoes_2\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":0,\"name\":\"pants_2\"},{\"number\":0,\"name\":\"tshirt_2\"},{\"number\":56,\"name\":\"shoes_1\"},{\"number\":6,\"name\":\"torso_2\"},{\"number\":724,\"name\":\"torso_1\"},{\"number\":41,\"name\":\"pants_1\"}]},{\"label\":\"Chic White\",\"data\":[{\"number\":8,\"name\":\"arms\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":15,\"name\":\"tshirt_1\"},{\"number\":3,\"name\":\"shoes_2\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":8,\"name\":\"pants_2\"},{\"number\":0,\"name\":\"tshirt_2\"},{\"number\":93,\"name\":\"shoes_1\"},{\"number\":0,\"name\":\"torso_2\"},{\"number\":693,\"name\":\"torso_1\"},{\"number\":92,\"name\":\"pants_1\"}]}]'),
(4, '[{\"label\":\"test\",\"data\":[{\"number\":3,\"name\":\"pants_2\"},{\"number\":30,\"name\":\"shoes_1\"},{\"number\":8,\"name\":\"arms\"},{\"number\":0,\"name\":\"tshirt_2\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":15,\"name\":\"tshirt_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":86,\"name\":\"pants_1\"},{\"number\":0,\"name\":\"torso_2\"},{\"number\":693,\"name\":\"torso_1\"},{\"number\":0,\"name\":\"shoes_2\"}]}]'),
(5, '[{\"label\":\"SASP\",\"data\":[{\"name\":\"torso_2\",\"number\":0},{\"name\":\"torso_1\",\"number\":733},{\"name\":\"pants_1\",\"number\":43},{\"name\":\"bproof_2\",\"number\":0},{\"name\":\"pants_2\",\"number\":1},{\"name\":\"shoes_2\",\"number\":2},{\"name\":\"tshirt_1\",\"number\":23},{\"name\":\"tshirt_2\",\"number\":0},{\"name\":\"bproof_1\",\"number\":0},{\"name\":\"decals_1\",\"number\":0},{\"name\":\"arms\",\"number\":1},{\"name\":\"shoes_1\",\"number\":7}]}]'),
(6, '[{\"label\":\"33\",\"data\":[{\"name\":\"pants_2\",\"number\":2},{\"name\":\"decals_1\",\"number\":0},{\"name\":\"shoes_2\",\"number\":1},{\"name\":\"torso_2\",\"number\":0},{\"name\":\"shoes_1\",\"number\":30},{\"name\":\"tshirt_2\",\"number\":0},{\"name\":\"tshirt_1\",\"number\":15},{\"name\":\"pants_1\",\"number\":212},{\"name\":\"bproof_2\",\"number\":0},{\"name\":\"torso_1\",\"number\":390},{\"name\":\"arms\",\"number\":0},{\"name\":\"bproof_1\",\"number\":0}]},{\"data\":[{\"name\":\"tshirt_2\",\"number\":0},{\"name\":\"pants_1\",\"number\":212},{\"name\":\"tshirt_1\",\"number\":15},{\"name\":\"torso_1\",\"number\":654},{\"name\":\"decals_1\",\"number\":0},{\"name\":\"arms\",\"number\":0},{\"name\":\"bproof_1\",\"number\":0},{\"name\":\"pants_2\",\"number\":2},{\"name\":\"shoes_2\",\"number\":1},{\"name\":\"torso_2\",\"number\":4},{\"name\":\"bproof_2\",\"number\":0},{\"name\":\"shoes_1\",\"number\":30}],\"label\":\"44\\n\"},{\"data\":[{\"name\":\"tshirt_2\",\"number\":0},{\"name\":\"pants_1\",\"number\":212},{\"name\":\"tshirt_1\",\"number\":15},{\"name\":\"torso_1\",\"number\":679},{\"name\":\"decals_1\",\"number\":0},{\"name\":\"arms\",\"number\":0},{\"name\":\"bproof_1\",\"number\":0},{\"name\":\"pants_2\",\"number\":2},{\"name\":\"shoes_2\",\"number\":1},{\"name\":\"torso_2\",\"number\":0},{\"name\":\"bproof_2\",\"number\":0},{\"name\":\"shoes_1\",\"number\":30}],\"label\":\"44\"}]'),
(20, '[{\"label\":\"1\",\"data\":[{\"number\":0,\"name\":\"decals_1\"},{\"number\":2,\"name\":\"torso_2\"},{\"number\":711,\"name\":\"torso_1\"},{\"number\":212,\"name\":\"pants_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":2,\"name\":\"pants_2\"},{\"number\":15,\"name\":\"tshirt_1\"},{\"number\":30,\"name\":\"shoes_1\"},{\"number\":1,\"name\":\"shoes_2\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":0,\"name\":\"arms\"},{\"number\":0,\"name\":\"tshirt_2\"}]}]'),
(53, '[{\"label\":\"Chic Noir\",\"data\":[{\"number\":10,\"name\":\"shoes_1\"},{\"number\":92,\"name\":\"pants_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":0,\"name\":\"pants_2\"},{\"number\":0,\"name\":\"shoes_2\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":654,\"name\":\"torso_1\"},{\"number\":0,\"name\":\"arms\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":3,\"name\":\"torso_2\"},{\"number\":15,\"name\":\"tshirt_1\"},{\"number\":0,\"name\":\"tshirt_2\"}]}]'),
(55, '[{\"label\":\"tenue sortie\",\"data\":[{\"name\":\"tshirt_1\",\"number\":15},{\"name\":\"pants_1\",\"number\":70},{\"name\":\"torso_2\",\"number\":5},{\"name\":\"tshirt_2\",\"number\":0},{\"name\":\"shoes_2\",\"number\":0},{\"name\":\"decals_1\",\"number\":0},{\"name\":\"arms\",\"number\":12},{\"name\":\"shoes_1\",\"number\":32},{\"name\":\"torso_1\",\"number\":719},{\"name\":\"pants_2\",\"number\":0},{\"name\":\"bproof_2\",\"number\":0},{\"name\":\"bproof_1\",\"number\":0}]},{\"label\":\"agent gouv\",\"data\":[{\"name\":\"tshirt_1\",\"number\":365},{\"name\":\"pants_1\",\"number\":335},{\"name\":\"shoes_1\",\"number\":126},{\"name\":\"torso_1\",\"number\":819},{\"name\":\"bproof_1\",\"number\":153},{\"name\":\"bproof_2\",\"number\":7},{\"name\":\"arms\",\"number\":1},{\"name\":\"decals_1\",\"number\":0},{\"name\":\"pants_2\",\"number\":2},{\"name\":\"shoes_2\",\"number\":0},{\"name\":\"torso_2\",\"number\":0},{\"name\":\"tshirt_2\",\"number\":0}]},{\"label\":\"tenue ceremonie \",\"data\":[{\"name\":\"tshirt_1\",\"number\":15},{\"name\":\"pants_1\",\"number\":99},{\"name\":\"shoes_1\",\"number\":10},{\"name\":\"torso_1\",\"number\":734},{\"name\":\"bproof_1\",\"number\":0},{\"name\":\"bproof_2\",\"number\":0},{\"name\":\"arms\",\"number\":84},{\"name\":\"decals_1\",\"number\":0},{\"name\":\"pants_2\",\"number\":0},{\"name\":\"shoes_2\",\"number\":0},{\"name\":\"torso_2\",\"number\":0},{\"name\":\"tshirt_2\",\"number\":0}]}]'),
(56, '[{\"label\":\"de\",\"data\":[{\"name\":\"torso_1\",\"number\":155},{\"name\":\"pants_2\",\"number\":1},{\"name\":\"decals_1\",\"number\":0},{\"name\":\"bproof_2\",\"number\":0},{\"name\":\"arms\",\"number\":3},{\"name\":\"pants_1\",\"number\":248},{\"name\":\"tshirt_1\",\"number\":9},{\"name\":\"torso_2\",\"number\":0},{\"name\":\"shoes_2\",\"number\":0},{\"name\":\"shoes_1\",\"number\":88},{\"name\":\"bproof_1\",\"number\":0},{\"name\":\"tshirt_2\",\"number\":0}]},{\"label\":\"mil\",\"data\":[{\"name\":\"arms\",\"number\":4},{\"name\":\"pants_1\",\"number\":195},{\"name\":\"bproof_2\",\"number\":0},{\"name\":\"shoes_1\",\"number\":18},{\"name\":\"torso_1\",\"number\":38},{\"name\":\"decals_1\",\"number\":0},{\"name\":\"shoes_2\",\"number\":1},{\"name\":\"bproof_1\",\"number\":0},{\"name\":\"torso_2\",\"number\":0},{\"name\":\"tshirt_1\",\"number\":1},{\"name\":\"pants_2\",\"number\":0},{\"name\":\"tshirt_2\",\"number\":0}]}]'),
(57, '[{\"label\":\"po\",\"data\":[{\"number\":1,\"name\":\"shoes_2\"},{\"number\":391,\"name\":\"tshirt_1\"},{\"number\":4,\"name\":\"tshirt_2\"},{\"number\":220,\"name\":\"shoes_1\"},{\"number\":319,\"name\":\"pants_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":248,\"name\":\"torso_1\"},{\"number\":64,\"name\":\"arms\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":7,\"name\":\"torso_2\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":0,\"name\":\"pants_2\"}]},{\"label\":\"lili\",\"data\":[{\"number\":49,\"name\":\"tshirt_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":12,\"name\":\"pants_2\"},{\"number\":226,\"name\":\"shoes_1\"},{\"number\":325,\"name\":\"pants_1\"},{\"number\":3,\"name\":\"torso_2\"},{\"number\":4,\"name\":\"shoes_2\"},{\"number\":112,\"name\":\"torso_1\"},{\"number\":64,\"name\":\"arms\"},{\"number\":0,\"name\":\"tshirt_2\"}]},{\"label\":\"bon lii\\n\",\"data\":[{\"number\":49,\"name\":\"tshirt_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":12,\"name\":\"pants_2\"},{\"number\":226,\"name\":\"shoes_1\"},{\"number\":325,\"name\":\"pants_1\"},{\"number\":3,\"name\":\"torso_2\"},{\"number\":8,\"name\":\"shoes_2\"},{\"number\":112,\"name\":\"torso_1\"},{\"number\":64,\"name\":\"arms\"},{\"number\":0,\"name\":\"tshirt_2\"}]},{\"label\":\"v\",\"data\":[{\"number\":17,\"name\":\"arms\"},{\"number\":49,\"name\":\"tshirt_1\"},{\"number\":24,\"name\":\"shoes_2\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":3,\"name\":\"torso_2\"},{\"number\":0,\"name\":\"tshirt_2\"},{\"number\":145,\"name\":\"shoes_1\"},{\"number\":191,\"name\":\"pants_1\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":292,\"name\":\"torso_1\"},{\"number\":3,\"name\":\"pants_2\"}]},{\"label\":\"bon ballas\\n\",\"data\":[{\"number\":301,\"name\":\"arms\"},{\"number\":402,\"name\":\"tshirt_1\"},{\"number\":1,\"name\":\"shoes_2\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":5,\"name\":\"torso_2\"},{\"number\":0,\"name\":\"tshirt_2\"},{\"number\":85,\"name\":\"shoes_1\"},{\"number\":326,\"name\":\"pants_1\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":685,\"name\":\"torso_1\"},{\"number\":2,\"name\":\"pants_2\"}]},{\"label\":\"on est la\\n\",\"data\":[{\"number\":302,\"name\":\"arms\"},{\"number\":49,\"name\":\"tshirt_1\"},{\"number\":0,\"name\":\"shoes_2\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":0,\"name\":\"torso_2\"},{\"number\":0,\"name\":\"tshirt_2\"},{\"number\":222,\"name\":\"shoes_1\"},{\"number\":322,\"name\":\"pants_1\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":700,\"name\":\"torso_1\"},{\"number\":2,\"name\":\"pants_2\"}]},{\"data\":[{\"number\":17,\"name\":\"arms\"},{\"number\":49,\"name\":\"tshirt_1\"},{\"number\":24,\"name\":\"shoes_2\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":3,\"name\":\"torso_2\"},{\"number\":0,\"name\":\"tshirt_2\"},{\"number\":145,\"name\":\"shoes_1\"},{\"number\":191,\"name\":\"pants_1\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":292,\"name\":\"torso_1\"},{\"number\":3,\"name\":\"pants_2\"}]},{\"data\":[{\"number\":4,\"name\":\"pants_2\"},{\"number\":64,\"name\":\"arms\"},{\"number\":1,\"name\":\"shoes_2\"},{\"number\":84,\"name\":\"shoes_1\"},{\"number\":100,\"name\":\"torso_1\"},{\"number\":0,\"name\":\"bproof_2\"},{\"number\":30,\"name\":\"pants_1\"},{\"number\":0,\"name\":\"torso_2\"},{\"number\":0,\"name\":\"tshirt_2\"},{\"number\":49,\"name\":\"tshirt_1\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":0,\"name\":\"decals_1\"}],\"label\":\"robe step\\n\\n\"}]'),
(63, '[{\"data\":[{\"number\":0,\"name\":\"bproof_2\"},{\"number\":0,\"name\":\"arms\"},{\"number\":95,\"name\":\"torso_1\"},{\"number\":0,\"name\":\"bproof_1\"},{\"number\":220,\"name\":\"shoes_1\"},{\"number\":0,\"name\":\"decals_1\"},{\"number\":0,\"name\":\"tshirt_2\"},{\"number\":15,\"name\":\"tshirt_1\"},{\"number\":1,\"name\":\"pants_2\"},{\"number\":7,\"name\":\"torso_2\"},{\"number\":4,\"name\":\"shoes_2\"},{\"number\":315,\"name\":\"pants_1\"}],\"label\":\"AS\"}]');

-- --------------------------------------------------------

--
-- Structure de la table `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  `display` varchar(50) DEFAULT NULL,
  `note` text NOT NULL,
  `pp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_entreprise`
--

CREATE TABLE `player_entreprise` (
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `PosVestiaire` varchar(255) DEFAULT NULL,
  `PosCustom` varchar(255) DEFAULT NULL,
  `PosCustom2` varchar(255) DEFAULT NULL,
  `PosCustom3` varchar(255) DEFAULT NULL,
  `PosBoss` varchar(255) DEFAULT NULL,
  `namerecolteitem` varchar(255) DEFAULT NULL,
  `PosRecolte` varchar(255) DEFAULT NULL,
  `nametraitementitem` varchar(255) DEFAULT NULL,
  `PosTraitement` varchar(255) DEFAULT NULL,
  `PosVente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_entreprise`
--

INSERT INTO `player_entreprise` (`type`, `name`, `label`, `PosVestiaire`, `PosCustom`, `PosCustom2`, `PosCustom3`, `PosBoss`, `namerecolteitem`, `PosRecolte`, `nametraitementitem`, `PosTraitement`, `PosVente`) VALUES
('Farm', 'le_ferailleur', 'Le Férailleur', NULL, NULL, NULL, NULL, 'null', 'reco_ferrailleur', '{\"x\":-471.3713073730469,\"y\":-1692.560546875,\"z\":18.90809059143066}', 'trait_ferrailleur', '{\"x\":1060.7255859375,\"y\":-1998.80908203125,\"z\":31.01581382751465}', '{\"x\":1269.7349853515626,\"y\":-3222.6962890625,\"z\":5.90104293823242}'),
('Farm', 'petitpecheur', 'PetitPecheur', NULL, NULL, NULL, NULL, 'null', 'reco_petitpecheur', '{\"x\":-161.963134765625,\"y\":-3560.025146484375,\"z\":1.38876366615295}', 'trait_petitpecheur', '{\"x\":907.828369140625,\"y\":-1723.7042236328126,\"z\":32.15963363647461}', '{\"x\":-1038.5352783203126,\"y\":-1396.851806640625,\"z\":5.55319213867187}'),
('Farm', 'tabac', 'Tabac', NULL, NULL, NULL, NULL, 'null', 'reco_tabac', '{\"x\":2868.0263671875,\"y\":4610.85205078125,\"z\":48.1182861328125}', 'trait_tabac', '{\"x\":932.3169555664063,\"y\":-1803.5010986328126,\"z\":30.69332313537597}', '{\"x\":1276.494140625,\"y\":-3217.777099609375,\"z\":5.90104436874389}'),
('Farm', 'vangelico', 'Vangelico', NULL, NULL, NULL, NULL, 'null', 'diamant', '{\"x\":1006.6739501953125,\"y\":-1219.7052001953126,\"z\":25.13553237915039}', 'bijoux', '{\"x\":-403.7701721191406,\"y\":-2274.496826171875,\"z\":7.60825490951538}', '{\"x\":-624.5750732421875,\"y\":-231.01414489746095,\"z\":38.0570068359375}'),
('Farm', 'vigne', 'Vigneron', NULL, NULL, NULL, NULL, 'null', 'reco_vigneron', '{\"x\":-1811.5535888671876,\"y\":2210.196044921875,\"z\":91.2333984375}', 'trait_vigneron', '{\"x\":-1137.95751953125,\"y\":2686.93798828125,\"z\":18.61795806884765}', '{\"x\":-25.15570068359375,\"y\":-86.69558715820313,\"z\":57.25407409667969}');

-- --------------------------------------------------------

--
-- Structure de la table `player_fishing`
--

CREATE TABLE `player_fishing` (
  `UniqueID` int(11) DEFAULT NULL,
  `level` longtext DEFAULT 0,
  `fishList` longtext DEFAULT NULL,
  `permit` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_fishing`
--

INSERT INTO `player_fishing` (`UniqueID`, `level`, `fishList`, `permit`) VALUES
(1, '0', '[]', '0'),
(11, '0', '[]', '0'),
(61, '0', '[]', '0'),
(2, '0', '[]', '0');

-- --------------------------------------------------------

--
-- Structure de la table `player_gallery`
--

CREATE TABLE `player_gallery` (
  `id` int(11) NOT NULL,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_idcard`
--

CREATE TABLE `player_idcard` (
  `UID` longtext NOT NULL,
  `UniqueID` longtext NOT NULL,
  `firstname` longtext NOT NULL,
  `lastname` longtext NOT NULL,
  `dateofbirth` longtext NOT NULL,
  `sex` longtext NOT NULL,
  `height` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_idcard`
--

INSERT INTO `player_idcard` (`UID`, `UniqueID`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES
('5', 'license:968abcbb2dced60f0e6caeea28c431b744430742', 'Daryl', 'Dayl', '1999-12-11', '0', '180'),
('6', 'license:86e0cd20f839d97378b1021e6529d0c210c6286e', 'Alban ', 'Rivera ', '1998-06-09', '0', '180'),
('65', 'license:3d7d38e68331edc546b751900193bada997ba147', 'Valentin', 'Agl', '2006-08-16', '0', '180'),
('56', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7', 'Ava', 'Smith', '2000-05-20', '1', '180'),
('71', 'license:54ba9fcd510212fc5451570083b78743eb6cd8b9', 'Leo', 'Daltone', '2000-08-31', '0', '180'),
('70', 'license:cd7a190f9f5e1519d3c533ecbd70ca7163270d67', 'Donk', 'Onmund', '1999-02-10', '0', '180'),
('76', 'license:5212c5e307fb6b06db10b3181025b1b29a8d6600', 'Wade', 'Díaz', '1999-05-23', '0', '180'),
('80', 'license:12b45c82a2e11bfb30e3c164711a3c589f2a89a3', 'Alexis', 'Blacke', '1990-12-12', '0', '180'),
('77', 'license:500afc62035c6ad0a209438b146d7d8515c6ae99', 'Kurtis', 'Bellevie', '2000-05-16', '0', '180'),
('114', 'license:5df0ebb39c7e9413737b468aba7788349345ba50', 'Pablito', 'Pop', '2000-08-11', '0', '180'),
('115', 'license:473a2b63cd0512f0f298741d60370e29d6d28547', 'june ', 'pop', '2002-10-01', '1', '180'),
('1', 'license:6d2ec16715a79825289a0f8312f8c80532aa51c5', 'Oles', 'Rozales', '2000-10-10', '0', '180');

-- --------------------------------------------------------

--
-- Structure de la table `player_inventory_clothes`
--

CREATE TABLE `player_inventory_clothes` (
  `UniqueID` int(11) NOT NULL,
  `clothes` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_inventory_clothes`
--

INSERT INTO `player_inventory_clothes` (`UniqueID`, `clothes`) VALUES
(1, '[{\"name\":\"decals_1\",\"label\":\"test\",\"number\":0},{\"name\":\"arms\",\"label\":\"test\",\"number\":0},{\"name\":\"tshirt_1\",\"number2\":0,\"label\":\"test\",\"number\":15},{\"name\":\"decals_1\",\"label\":\"test\",\"number\":0},{\"name\":\"arms\",\"label\":\"test\",\"number\":0},{\"name\":\"tshirt_1\",\"number2\":0,\"label\":\"test\",\"number\":15},{\"name\":\"tshirt_1\",\"number2\":0,\"label\":\"test\",\"number\":15},{\"name\":\"arms\",\"label\":\"test\",\"number\":0},{\"name\":\"decals_1\",\"label\":\"test\",\"number\":0},{\"name\":\"tshirt_1\",\"number2\":0,\"label\":\"aaaa\",\"number\":15},{\"name\":\"decals_1\",\"label\":\"aaaa\",\"number\":0},{\"name\":\"arms\",\"label\":\"aaaa\",\"number\":0},{\"name\":\"tshirt_1\",\"number2\":0,\"label\":\"aaaa\",\"number\":15},{\"name\":\"decals_1\",\"label\":\"aaaa\",\"number\":0},{\"name\":\"arms\",\"label\":\"aaaa\",\"number\":0},{\"name\":\"tshirt_1\",\"number2\":0,\"label\":\"Civil\",\"number\":15},{\"name\":\"arms\",\"label\":\"Civil\",\"number\":0},{\"name\":\"decals_1\",\"label\":\"Civil\",\"number\":0},{\"name\":\"tshirt_1\",\"number2\":0,\"label\":\"Civil\",\"number\":15},{\"name\":\"arms\",\"label\":\"Civil\",\"number\":11},{\"name\":\"decals_1\",\"label\":\"Civil\",\"number\":0},{\"name\":\"decals_1\",\"label\":\"Civil\\n\",\"number\":0},{\"name\":\"arms\",\"label\":\"Civil\\n\",\"number\":1},{\"name\":\"tshirt_1\",\"number2\":0,\"label\":\"Civil\\n\",\"number\":15},{\"number2\":0,\"name\":\"glasses_1\",\"label\":\"Lunette\",\"number\":16},{\"label\":\"Chic Noir\",\"name\":\"arms\",\"number\":0},{\"label\":\"Chic Noir\",\"name\":\"bproof_1\",\"number\":0,\"number2\":0},{\"label\":\"Chic Noir\",\"name\":\"tshirt_1\",\"number\":15,\"number2\":0},{\"label\":\"Chic Noir\",\"name\":\"decals_1\",\"number\":0},{\"label\":\"Chic Noir\",\"name\":\"shoes_1\",\"number\":10,\"number2\":0},{\"label\":\"Chic Noir\",\"name\":\"torso_1\",\"number\":654,\"number2\":3},{\"label\":\"Chic Noir\",\"name\":\"pants_1\",\"number\":92,\"number2\":0},{\"label\":\"Chic White\",\"number\":8,\"name\":\"arms\"},{\"label\":\"Chic White\",\"number2\":0,\"number\":0,\"name\":\"bproof_1\"},{\"label\":\"Chic White\",\"number2\":0,\"number\":15,\"name\":\"tshirt_1\"},{\"label\":\"Chic White\",\"number\":0,\"name\":\"decals_1\"},{\"label\":\"Chic White\",\"number2\":3,\"number\":93,\"name\":\"shoes_1\"},{\"label\":\"Chic White\",\"number2\":0,\"number\":693,\"name\":\"torso_1\"},{\"label\":\"Chic White\",\"number2\":8,\"number\":92,\"name\":\"pants_1\"}]'),
(4, '[{\"number\":8,\"label\":\"test\",\"name\":\"arms\"},{\"number\":0,\"label\":\"test\",\"name\":\"decals_1\"},{\"number2\":0,\"number\":15,\"name\":\"tshirt_1\",\"label\":\"test\"},{\"number\":8,\"label\":\"test\",\"name\":\"arms\"},{\"number\":0,\"label\":\"test\",\"name\":\"decals_1\"},{\"number2\":0,\"number\":15,\"name\":\"tshirt_1\",\"label\":\"test\"},{\"number2\":0,\"number\":125,\"name\":\"bags_1\",\"label\":\"SACSKATE\"},{\"number\":8,\"label\":\"test\",\"name\":\"arms\"},{\"number\":0,\"label\":\"test\",\"name\":\"decals_1\"},{\"number2\":0,\"number\":15,\"label\":\"test\",\"name\":\"tshirt_1\"},{\"number2\":3,\"number\":33,\"label\":\"lunette\",\"name\":\"glasses_1\"},{\"number2\":0,\"number\":30,\"label\":\"test\",\"name\":\"shoes_1\"},{\"number\":8,\"label\":\"test\",\"name\":\"arms\"},{\"number\":0,\"label\":\"test\",\"name\":\"decals_1\"},{\"number2\":0,\"number\":15,\"label\":\"test\",\"name\":\"tshirt_1\"},{\"number2\":0,\"number\":0,\"label\":\"test\",\"name\":\"bproof_1\"},{\"number2\":3,\"number\":86,\"label\":\"test\",\"name\":\"pants_1\"},{\"number2\":0,\"number\":693,\"label\":\"test\",\"name\":\"torso_1\"}]'),
(5, '[{\"label\":\"z\",\"number\":2,\"name\":\"helmet_1\",\"number2\":0},{\"label\":\"aaa\",\"number\":11,\"name\":\"helmet_1\",\"number2\":0},{\"label\":\"1\",\"name\":\"glasses_1\",\"number\":1,\"number2\":0},{\"label\":\"1\",\"name\":\"mask_1\",\"number\":1,\"number2\":0}]'),
(6, '[{\"number2\":0,\"name\":\"bags_1\",\"number\":125,\"label\":\"3\"},{\"number2\":0,\"name\":\"glasses_1\",\"number\":20,\"label\":\"4\"},{\"number2\":0,\"name\":\"glasses_1\",\"number\":21,\"label\":\"33\\n\"}]'),
(20, '[{\"label\":\"1\",\"number\":96,\"number2\":0,\"name\":\"bags_1\"},{\"label\":\"2\\n\",\"name\":\"bags_1\",\"number2\":0,\"number\":125},{\"label\":\"3\\n\",\"number\":134,\"number2\":0,\"name\":\"bags_1\"},{\"label\":\"2\",\"name\":\"glasses_1\",\"number2\":12,\"number\":50},{\"label\":\"1\",\"number2\":12,\"number\":50,\"name\":\"glasses_1\"}]'),
(53, '[{\"number\":10,\"name\":\"shoes_1\",\"label\":\"Chic Noir\",\"number2\":0},{\"number\":92,\"name\":\"pants_1\",\"label\":\"Chic Noir\",\"number2\":0},{\"number\":0,\"name\":\"decals_1\",\"label\":\"Chic Noir\"},{\"number\":654,\"name\":\"torso_1\",\"label\":\"Chic Noir\",\"number2\":3},{\"number\":0,\"name\":\"arms\",\"label\":\"Chic Noir\"},{\"number\":0,\"name\":\"bproof_1\",\"label\":\"Chic Noir\",\"number2\":0},{\"number\":15,\"name\":\"tshirt_1\",\"label\":\"Chic Noir\",\"number2\":0},{\"number\":16,\"name\":\"glasses_1\",\"label\":\"Lunette noir\",\"number2\":5}]'),
(55, '[{\"label\":\"tenue sortie\",\"number2\":0,\"number\":15,\"name\":\"tshirt_1\"},{\"label\":\"tenue sortie\",\"number\":0,\"name\":\"decals_1\"},{\"label\":\"tenue sortie\",\"number\":12,\"name\":\"arms\"},{\"label\":\"tenue sortie\",\"number2\":0,\"number\":15,\"name\":\"tshirt_1\"},{\"label\":\"tenue sortie\",\"number\":0,\"name\":\"decals_1\"},{\"label\":\"tenue sortie\",\"number\":12,\"name\":\"arms\"},{\"label\":\"tenue sortie\",\"number2\":0,\"number\":15,\"name\":\"tshirt_1\"},{\"label\":\"tenue sortie\",\"number\":0,\"name\":\"decals_1\"},{\"label\":\"tenue sortie\",\"number\":12,\"name\":\"arms\"},{\"label\":\"tenue sortie\",\"number2\":0,\"number\":15,\"name\":\"tshirt_1\"},{\"label\":\"tenue sortie\",\"number\":0,\"name\":\"decals_1\"},{\"label\":\"tenue sortie\",\"number\":12,\"name\":\"arms\"},{\"label\":\"tenue sortie\",\"number2\":0,\"number\":15,\"name\":\"tshirt_1\"},{\"label\":\"tenue sortie\",\"number\":0,\"name\":\"decals_1\"},{\"label\":\"tenue sortie\",\"number\":12,\"name\":\"arms\"},{\"label\":\"lunette\",\"number2\":8,\"number\":62,\"name\":\"glasses_1\"},{\"number2\":0,\"number\":125,\"name\":\"bags_1\"},{\"label\":\"montre\\n\",\"number2\":0,\"number\":20,\"name\":\"watches_1\"}]'),
(56, '[{\"number2\":0,\"number\":155,\"label\":\"dead\",\"name\":\"torso_1\"},{\"number\":0,\"label\":\"dead\",\"name\":\"decals_1\"},{\"number\":3,\"label\":\"dead\",\"name\":\"arms\"},{\"number2\":1,\"number\":248,\"label\":\"dead\",\"name\":\"pants_1\"},{\"number2\":0,\"number\":360,\"label\":\"dead\",\"name\":\"tshirt_1\"},{\"number2\":0,\"number\":88,\"label\":\"dead\",\"name\":\"shoes_1\"},{\"number2\":2,\"number\":176,\"label\":\"dead\",\"name\":\"bproof_1\"},{\"number2\":0,\"number\":112,\"label\":\"sac\",\"name\":\"bags_1\"}]'),
(57, '[{\"number2\":0,\"number\":389,\"name\":\"tshirt_1\",\"label\":\"oui\\n\"},{\"number\":64,\"name\":\"arms\",\"label\":\"oui\\n\"},{\"number\":0,\"name\":\"decals_1\",\"label\":\"oui\\n\"},{\"number2\":0,\"number\":389,\"name\":\"tshirt_1\",\"label\":\"oui\\n\"},{\"number\":64,\"name\":\"arms\",\"label\":\"oui\\n\"},{\"number\":0,\"name\":\"decals_1\",\"label\":\"oui\\n\"},{\"number2\":0,\"number\":389,\"name\":\"tshirt_1\",\"label\":\"oui\\n\"},{\"number\":64,\"name\":\"arms\",\"label\":\"oui\\n\"},{\"number\":0,\"name\":\"decals_1\",\"label\":\"oui\\n\"},{\"number2\":0,\"number\":389,\"name\":\"tshirt_1\",\"label\":\"oui\\n\"},{\"number\":64,\"name\":\"arms\",\"label\":\"oui\\n\"},{\"number\":0,\"name\":\"decals_1\",\"label\":\"oui\\n\"},{\"number2\":0,\"number\":389,\"name\":\"tshirt_1\",\"label\":\"oui\\n\"},{\"number\":64,\"name\":\"arms\",\"label\":\"oui\\n\"},{\"number\":0,\"name\":\"decals_1\",\"label\":\"oui\\n\"},{\"number2\":0,\"number\":389,\"name\":\"tshirt_1\",\"label\":\"oui\\n\"},{\"number\":64,\"name\":\"arms\",\"label\":\"oui\\n\"},{\"number\":0,\"name\":\"decals_1\",\"label\":\"oui\\n\"},{\"number\":232,\"name\":\"mask_1\",\"number2\":0},{\"number\":219,\"name\":\"mask_1\",\"number2\":2},{\"number2\":14,\"number\":219,\"name\":\"mask_1\",\"label\":\"oui bon\\n\"},{\"number2\":2,\"number\":40,\"name\":\"glasses_1\",\"label\":\"gg\\n\"},{\"number2\":4,\"number\":30,\"name\":\"pants_1\",\"label\":\"oui\\n\"},{\"number2\":0,\"number\":389,\"name\":\"tshirt_1\",\"label\":\"oui\\n\"},{\"number\":64,\"name\":\"arms\",\"label\":\"oui\\n\"},{\"number2\":6,\"number\":79,\"name\":\"torso_1\",\"label\":\"oui\\n\"},{\"number\":0,\"name\":\"decals_1\",\"label\":\"oui\\n\"},{\"number2\":4,\"number\":58,\"name\":\"shoes_1\",\"label\":\"oui\\n\"},{\"number2\":4,\"number\":391,\"name\":\"tshirt_1\",\"label\":\"po\"},{\"number2\":1,\"number\":220,\"name\":\"shoes_1\",\"label\":\"po\"},{\"number2\":0,\"number\":319,\"name\":\"pants_1\",\"label\":\"po\"},{\"number2\":7,\"number\":248,\"name\":\"torso_1\",\"label\":\"po\"},{\"number\":64,\"name\":\"arms\",\"label\":\"po\"},{\"number\":0,\"name\":\"decals_1\",\"label\":\"po\"},{\"number2\":0,\"number\":38,\"name\":\"glasses_1\",\"label\":\"BON\\n\"},{\"label\":\"oui\",\"number\":107,\"name\":\"helmet_1\",\"number2\":3},{\"number2\":0,\"number\":23,\"name\":\"helmet_1\",\"label\":\"flor\"}]'),
(58, '[{\"name\":\"bags_1\",\"number2\":5,\"number\":114,\"label\":\"sac\\n\"}]');

-- --------------------------------------------------------

--
-- Structure de la table `player_isdead`
--

CREATE TABLE `player_isdead` (
  `UniqueID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_isdead`
--

INSERT INTO `player_isdead` (`UniqueID`) VALUES
(99),
(55),
(55),
(55),
(55);

-- --------------------------------------------------------

--
-- Structure de la table `player_jails`
--

CREATE TABLE `player_jails` (
  `UniqueID` int(11) NOT NULL,
  `time` longtext DEFAULT NULL,
  `staff` longtext DEFAULT NULL,
  `reason` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_jails`
--

INSERT INTO `player_jails` (`UniqueID`, `time`, `staff`, `reason`) VALUES
(93, '1000', 'NEVA', 'Ticket discord pour unjail'),
(103, 'cheat', 'jean yve bodassin', 'cheat'),
(122, '60', 'Rory', 'NON RESPECT');

-- --------------------------------------------------------

--
-- Structure de la table `player_leboncoin`
--

CREATE TABLE `player_leboncoin` (
  `identifier` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `count` longtext DEFAULT NULL,
  `type` longtext DEFAULT NULL,
  `price` longtext DEFAULT NULL,
  `id` longtext DEFAULT NULL,
  `plate` longtext DEFAULT NULL,
  `vehicle` longtext DEFAULT NULL,
  `UniqueID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_leboncoin`
--

INSERT INTO `player_leboncoin` (`identifier`, `label`, `name`, `count`, `type`, `price`, `id`, `plate`, `vehicle`, `UniqueID`) VALUES
(NULL, NULL, 'Wewe', NULL, 'car', '10', '564147', 'TEMP8187', '{\"plate\":\"TEMP8187\",\"model\":970598228}', 1);

-- --------------------------------------------------------

--
-- Structure de la table `player_livraisons`
--

CREATE TABLE `player_livraisons` (
  `uniqueid` int(11) NOT NULL,
  `levels` int(11) DEFAULT 0,
  `gains` int(11) NOT NULL DEFAULT 100,
  `livraisons` int(11) DEFAULT 0,
  `vehicle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_livraisons`
--

INSERT INTO `player_livraisons` (`uniqueid`, `levels`, `gains`, `livraisons`, `vehicle`) VALUES
(1, 0, 100, 0, '[\"boxville\"]'),
(6, 0, 100, 0, '[\"boxville\"]');

-- --------------------------------------------------------

--
-- Structure de la table `player_ltdsales`
--

CREATE TABLE `player_ltdsales` (
  `uid` int(11) NOT NULL,
  `job` longtext NOT NULL,
  `u` longtext DEFAULT NULL,
  `d` longtext DEFAULT NULL,
  `night` longtext NOT NULL,
  `day` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_mails`
--

CREATE TABLE `player_mails` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_notes`
--

CREATE TABLE `player_notes` (
  `id` int(11) NOT NULL,
  `identifier` text NOT NULL,
  `baslik` text NOT NULL,
  `aciklama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `police_plainte`
--

CREATE TABLE `police_plainte` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `date` text DEFAULT NULL,
  `numberphone` text DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `author` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `police_plainte`
--

INSERT INTO `police_plainte` (`id`, `name`, `date`, `numberphone`, `reason`, `author`) VALUES
(1, 'd', '12222', 'd', 'j\'essais !', 'Valentin Agl');

-- --------------------------------------------------------

--
-- Structure de la table `properties`
--

CREATE TABLE `properties` (
  `propertiesID` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `propertiesOWNER` longtext DEFAULT NULL,
  `ownerName` longtext DEFAULT NULL,
  `enter` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `garage` tinyint(1) UNSIGNED ZEROFILL DEFAULT 0,
  `garagePos` varchar(255) DEFAULT NULL,
  `garageSpawn` varchar(255) DEFAULT NULL,
  `garageRotation` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `garageType` longtext DEFAULT NULL,
  `players` longtext DEFAULT '{}',
  `type` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `trunkPos` varchar(255) DEFAULT NULL,
  `logementType` longtext DEFAULT NULL,
  `time` int(11) UNSIGNED ZEROFILL DEFAULT NULL,
  `street` longtext DEFAULT NULL,
  `entrepot` tinyint(4) DEFAULT NULL,
  `pound` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `properties_access`
--

CREATE TABLE `properties_access` (
  `id_access` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `id_property` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `properties_list`
--

CREATE TABLE `properties_list` (
  `id_property` int(11) NOT NULL,
  `property_name` varchar(50) NOT NULL,
  `property_pos` varchar(100) DEFAULT NULL,
  `property_chest` varchar(50) DEFAULT NULL,
  `property_type` varchar(50) DEFAULT NULL,
  `property_price` int(11) DEFAULT NULL,
  `property_status` varchar(50) DEFAULT 'free',
  `property_owner` varchar(50) DEFAULT NULL,
  `garage_pos` varchar(100) DEFAULT NULL,
  `garage_max` int(11) DEFAULT NULL,
  `jobs` varchar(50) DEFAULT NULL,
  `orga` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `properties_news`
--

CREATE TABLE `properties_news` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `ownerName` longtext DEFAULT NULL,
  `positions` longtext DEFAULT NULL,
  `garage` longtext DEFAULT NULL,
  `entrepot` longtext DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `players` longtext DEFAULT '[]',
  `informations` longtext DEFAULT NULL,
  `colocations` longtext DEFAULT NULL,
  `chest` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `properties_vehicles`
--

CREATE TABLE `properties_vehicles` (
  `propertyID` int(11) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `data_vehicle` longtext NOT NULL,
  `stored` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `property_created`
--

CREATE TABLE `property_created` (
  `propertyID` int(11) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `pNumber` varchar(255) DEFAULT NULL,
  `pEnterPos` varchar(255) DEFAULT NULL,
  `gEnterPos` varchar(255) DEFAULT NULL,
  `gPlaces` varchar(255) DEFAULT NULL,
  `stockCapacity` varchar(255) DEFAULT NULL,
  `dateRented` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `pInventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}',
  `pVehicules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}',
  `pKeys` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `race_tracks`
--

CREATE TABLE `race_tracks` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `selling_weapons`
--

CREATE TABLE `selling_weapons` (
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `lab_name` varchar(50) NOT NULL,
  `job` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `slots_inventory`
--

CREATE TABLE `slots_inventory` (
  `UniqueID` int(11) NOT NULL,
  `slots` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `slots_inventory`
--

INSERT INTO `slots_inventory` (`UniqueID`, `slots`) VALUES
(1, '[{\"label\":\"\",\"item\":{\"label\":\"\",\"name\":-1569615261},\"slot\":1,\"name\":-1569615261},{\"label\":\"\",\"item\":{\"label\":\"\",\"name\":-1569615261},\"slot\":2,\"name\":-1569615261},{\"label\":\"\",\"item\":{\"label\":\"\",\"name\":-1569615261},\"slot\":3,\"name\":-1569615261}]'),
(2, '[{\"slot\":1,\"label\":\"Aucun\",\"name\":-1569615261,\"item\":{\"label\":\"Aucun\",\"name\":-1569615261}},{\"slot\":2,\"label\":\"Aucun\",\"name\":-1569615261,\"item\":{\"label\":\"Aucun\",\"name\":-1569615261}},{\"slot\":3,\"label\":\"Aucun\",\"name\":-1569615261,\"item\":{\"label\":\"Aucun\",\"name\":-1569615261}},{\"slot\":4,\"label\":\"Aucun\",\"name\":-1569615261,\"item\":{\"label\":\"Aucun\",\"name\":-1569615261}},{\"slot\":5,\"label\":\"Aucun\",\"name\":-1569615261,\"item\":{\"label\":\"Aucun\",\"name\":-1569615261}}]'),
(4, '[{\"item\":{\"name\":-1569615261,\"label\":\"\"},\"slot\":2,\"name\":-1569615261,\"label\":\"\"},{\"slot\":1,\"label\":\"Lance-rocket (255)\",\"item\":{\"usable\":true,\"count\":255,\"informationsText\":\"Indéfini\",\"label\":\"Lance-rocket (255)\",\"name\":\"WEAPON_RPG\",\"informations\":false,\"image\":\"/src/html/assets/icons/toolbox.png\",\"type\":\"item_weapon\"},\"image\":\"/src/html/assets/icons/toolbox.png\",\"name\":\"WEAPON_RPG\"}]'),
(5, '[{\"slot\":1,\"label\":\"\",\"name\":-1569615261,\"item\":{\"name\":-1569615261,\"label\":\"\"}},{\"slot\":2,\"label\":\"\",\"name\":-1569615261,\"item\":{\"name\":-1569615261,\"label\":\"\"}}]'),
(6, '[{\"name\":-1569615261,\"slot\":3,\"item\":{\"name\":-1569615261,\"label\":\"\"},\"label\":\"\"},{\"slot\":1,\"label\":\"SCAR-17 (255)\",\"name\":\"WEAPON_SCAR17FM\",\"image\":\"/src/html/assets/icons/WEAPON_SCAR17FM.png\",\"item\":{\"usable\":true,\"count\":255,\"informationsText\":\"Indéfini\",\"label\":\"SCAR-17 (255)\",\"name\":\"WEAPON_SCAR17FM\",\"informations\":false,\"image\":\"/src/html/assets/icons/WEAPON_SCAR17FM.png\",\"type\":\"item_weapon\"}},{\"slot\":2,\"label\":\"Lance-rocket (255)\",\"name\":\"WEAPON_RPG\",\"image\":\"/src/html/assets/icons/toolbox.png\",\"item\":{\"usable\":true,\"count\":255,\"informationsText\":\"Indéfini\",\"label\":\"Lance-rocket (255)\",\"name\":\"WEAPON_RPG\",\"informations\":false,\"image\":\"/src/html/assets/icons/toolbox.png\",\"type\":\"item_weapon\"}}]'),
(7, '[{\"name\":-1569615261,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"slot\":2},{\"name\":-1569615261,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"slot\":3},{\"name\":-1569615261,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"slot\":4},{\"name\":-1569615261,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"slot\":5},{\"name\":\"WEAPON_REVOLVER\",\"image\":\"/src/html/assets/icons/WEAPON_REVOLVER.png\",\"label\":\"Revolver (137)\",\"item\":{\"name\":\"WEAPON_REVOLVER\",\"label\":\"Revolver (137)\",\"informations\":false,\"image\":\"/src/html/assets/icons/WEAPON_REVOLVER.png\",\"usable\":true,\"count\":137,\"type\":\"item_weapon\",\"informationsText\":\"Indéfini\"},\"slot\":1}]'),
(8, '[{\"slot\":1,\"image\":\"/src/html/assets/icons/WEAPON_PISTOL.png\",\"label\":\"Pistolet (100)\",\"item\":{\"name\":\"WEAPON_PISTOL\",\"informations\":false,\"label\":\"Pistolet (100)\",\"type\":\"item_weapon\",\"image\":\"/src/html/assets/icons/WEAPON_PISTOL.png\",\"count\":100,\"usable\":true,\"informationsText\":\"Indéfini\"},\"name\":\"WEAPON_PISTOL\"}]'),
(9, '[]'),
(10, '[{\"slot\":1,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"name\":-1569615261},{\"slot\":2,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"name\":-1569615261},{\"slot\":3,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"name\":-1569615261},{\"slot\":4,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"name\":-1569615261},{\"slot\":5,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"name\":-1569615261}]'),
(11, '[{\"slot\":1,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"name\":-1569615261},{\"slot\":2,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"name\":-1569615261},{\"slot\":3,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"name\":-1569615261},{\"slot\":4,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"name\":-1569615261},{\"slot\":5,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"name\":-1569615261}]'),
(13, '[{\"name\":-1569615261,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"slot\":1},{\"name\":-1569615261,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"slot\":2},{\"name\":-1569615261,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"slot\":3},{\"name\":-1569615261,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"slot\":4},{\"name\":-1569615261,\"label\":\"Aucun\",\"item\":{\"name\":-1569615261,\"label\":\"Aucun\"},\"slot\":5}]'),
(53, '[]'),
(54, '[]'),
(55, '[{\"label\":\"MCX Spear (255)\",\"item\":{\"count\":255,\"label\":\"MCX Spear (255)\",\"usable\":true,\"type\":\"item_weapon\",\"informationsText\":\"Indéfini\",\"image\":\"/src/html/assets/icons/toolbox.png\",\"informations\":false,\"name\":\"WEAPON_MCXSPEAR\"},\"image\":\"/src/html/assets/icons/toolbox.png\",\"slot\":1,\"name\":\"WEAPON_MCXSPEAR\"},{\"label\":\"AK47 Neon-Ride (255)\",\"item\":{\"count\":255,\"label\":\"AK47 Neon-Ride (255)\",\"usable\":true,\"type\":\"item_weapon\",\"informationsText\":\"Indéfini\",\"image\":\"/src/html/assets/icons/toolbox.png\",\"informations\":false,\"name\":\"WEAPON_AK47NEONRIDE\"},\"image\":\"/src/html/assets/icons/toolbox.png\",\"slot\":2,\"name\":\"WEAPON_AK47NEONRIDE\"}]'),
(56, '[{\"name\":-1569615261,\"item\":{\"name\":-1569615261,\"label\":\"\"},\"label\":\"\",\"slot\":1}]'),
(57, '[{\"label\":\"\",\"item\":{\"label\":\"\",\"name\":-1569615261},\"slot\":3,\"name\":-1569615261},{\"label\":\"AK47 Neon-Ride (255)\",\"item\":{\"count\":255,\"usable\":true,\"label\":\"AK47 Neon-Ride (255)\",\"type\":\"item_weapon\",\"informationsText\":\"Indéfini\",\"image\":\"/src/html/assets/icons/toolbox.png\",\"informations\":false,\"name\":\"WEAPON_AK47NEONRIDE\"},\"image\":\"/src/html/assets/icons/toolbox.png\",\"slot\":1,\"name\":\"WEAPON_AK47NEONRIDE\"},{\"label\":\"Pistolet sns (28)\",\"item\":{\"count\":28,\"usable\":true,\"label\":\"Pistolet sns (28)\",\"type\":\"item_weapon\",\"informationsText\":\"Indéfini\",\"image\":\"/src/html/assets/icons/WEAPON_SNSPISTOL.png\",\"informations\":false,\"name\":\"WEAPON_SNSPISTOL\"},\"image\":\"/src/html/assets/icons/WEAPON_SNSPISTOL.png\",\"slot\":2,\"name\":\"WEAPON_SNSPISTOL\"}]'),
(58, '[{\"item\":{\"usable\":true,\"informationsText\":\"Indéfini\",\"image\":\"/src/html/assets/icons/toolbox.png\",\"count\":255,\"informations\":false,\"type\":\"item_weapon\",\"name\":\"WEAPON_HK416\",\"label\":\"HK-416 (255)\"},\"image\":\"/src/html/assets/icons/toolbox.png\",\"name\":\"WEAPON_HK416\",\"label\":\"HK-416 (255)\",\"slot\":1}]'),
(59, '[{\"slot\":1,\"item\":{\"name\":-1569615261,\"label\":\"\"},\"label\":\"\",\"name\":-1569615261},{\"slot\":2,\"item\":{\"name\":-1569615261,\"label\":\"\"},\"label\":\"\",\"name\":-1569615261},{\"slot\":3,\"item\":{\"name\":-1569615261,\"label\":\"\"},\"label\":\"\",\"name\":-1569615261},{\"slot\":4,\"item\":{\"name\":-1569615261,\"label\":\"\"},\"label\":\"\",\"name\":-1569615261},{\"slot\":5,\"item\":{\"name\":-1569615261,\"label\":\"\"},\"label\":\"\",\"name\":-1569615261}]'),
(61, '[{\"label\":\"\",\"item\":{\"label\":\"\",\"name\":-1569615261},\"slot\":1,\"name\":-1569615261},{\"label\":\"\",\"item\":{\"label\":\"\",\"name\":-1569615261},\"slot\":2,\"name\":-1569615261}]'),
(62, '[]'),
(63, '[]');

-- --------------------------------------------------------

--
-- Structure de la table `society_data`
--

CREATE TABLE `society_data` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `label` text DEFAULT NULL,
  `coffre` longtext DEFAULT NULL,
  `permissions` longtext DEFAULT NULL,
  `posCoffre` varchar(255) DEFAULT NULL,
  `posBoss` varchar(255) DEFAULT NULL,
  `blips` longtext DEFAULT NULL,
  `tax` text DEFAULT '0',
  `cloakroom` tinyint(1) DEFAULT NULL,
  `clothes` longtext DEFAULT '[]',
  `cloakpos` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `society_data`
--

INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(20, 'salieris', 'Slieris', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"deposit_money_society\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":true,\"copatron\":true,\"copat\":true,\"securiter\":true,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true},\"novice\":true},\"delete_grade\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Supprimer un grade\",\"grades\":{\"boss\":true},\"novice\":false},\"recruit_player\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Recruté un joueur\",\"grades\":{\"boss\":true},\"novice\":false},\"deposit_black_money_coffre\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":true,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true},\"novice\":true},\"withdraw_money_society\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"editClothes\":{\"CO-PATRON \":true,\"label\":\"Gérer les tenues dans le vestiaire\",\"danseuce\":false,\"securiter\":false,\"recrue\":false,\"grades\":{\"boss\":true},\"novice\":false},\"change_permissions_grade\":{\"securiter\":false,\"CO-PATRON \":true,\"label\":\"Changer les permissions d\'un grade\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":false,\"novice\":false},\"dposit_item_chest_society\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":true,\"label\":\"Déposer un item dans le coffre de la société\",\"grades\":{\"boss\":true},\"novice\":true},\"withdraw_black_money_coffre\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"remove_weapon_chest_society\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"grades\":{\"boss\":true},\"novice\":[]},\"manage_grades\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Gérer les grades de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"deposit_item_chest\":{\"securiter\":false,\"CO-PATRON \":true,\"label\":\"Déposer un item dans le coffre\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":[],\"novice\":[]},\"deposit_weapon_chest\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":true,\"label\":\"Déposer une arme dans le coffre\",\"grades\":{\"boss\":true},\"novice\":true},\"deposit_cash_coffre\":{\"securiter\":true,\"CO-PATRON \":true,\"label\":\"Déposer de l\'argent dans le coffre\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":true,\"novice\":false},\"unmote_player\":{\"securiter\":false,\"CO-PATRON \":true,\"label\":\"Descendre un employé\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":false,\"novice\":false},\"weapons_chest_society\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Arme(s) du coffre de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"open_boss\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Ouvrir le menu boss\",\"grades\":{\"boss\":true},\"novice\":false},\"remove_item_chest_society\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"withdraw_cash_coffre\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"open_coffre\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Ouvrir le coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"change_number_grade\":{\"securiter\":false,\"CO-PATRON \":true,\"label\":\"Changer le numéro d\'un grade\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":false,\"novice\":false},\"rename_label_grade\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Changer le label d\'un grade\",\"grades\":{\"boss\":true},\"novice\":false},\"items_chest\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Items du coffre\",\"grades\":{\"boss\":true},\"novice\":[]},\"change_salary_grade\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Changer le salaire d\'un grade\",\"grades\":{\"boss\":true},\"novice\":false},\"manage_employeds\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Gérer les employés de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"weapons_chest\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Armes du coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"demote_player\":{\"CO-PATRON \":false,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":false,\"copat\":true,\"securiter\":false,\"label\":\"Virer un employé\",\"grades\":{\"boss\":true},\"novice\":false},\"rename_grade\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Changer le nom d\'un grade\",\"grades\":{\"boss\":true},\"novice\":false},\"remove_item_chest\":{\"CO-PATRON \":false,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer un item dans le coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"items_chest:society\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Item(s) du coffre de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"promote_player\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":[],\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Augmenter un employé\",\"grades\":{\"boss\":true},\"novice\":false},\"chest\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Accéder au coffre de la société\",\"grades\":{\"boss\":true},\"novice\":false},\"remove_weapon_chest\":{\"CO-PATRON \":false,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Retirer une arme dans le coffre\",\"grades\":{\"boss\":true},\"novice\":false},\"deposit_weapon_chest_society\":{\"securiter\":true,\"CO-PATRON \":true,\"label\":\"Déposer une arme dans le coffre de la société\",\"danseuce\":false,\"boss\":true,\"grades\":{\"boss\":true},\"recrue\":[],\"novice\":false},\"create_grade\":{\"CO-PATRON \":true,\"danseuce\":false,\"boss\":true,\"recrue\":false,\"copatron\":true,\"copat\":true,\"securiter\":false,\"label\":\"Créer un grade\",\"grades\":{\"boss\":true},\"novice\":false}}', '{\"z\":33.80733489990234,\"x\":415.5896606445313,\"y\":-1505.79052734375}', '{\"z\":33.80732727050781,\"x\":410.9037170410156,\"y\":-1500.8223876953126}', '{\"sprite\":93,\"color\":21,\"position\":{\"z\":33.80731582641601,\"x\":412.6139221191406,\"y\":-1490.606201171875},\"active\":true}', '1', 1, '[]', '{\"z\":33.80727386474609,\"x\":416.34576416015627,\"y\":-1484.687255859375}'),
(23, 'realestateagent', 'Agence Immobilière', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"deposit_weapon_chest_society\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Déposer une arme dans le coffre de la société\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"create_grade\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Créer un grade\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"weapons_chest_society\":{\"co-patron\":false,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Arme(s) du coffre de la société\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"change_number_grade\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Changer le numéro d\'un grade\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"manage_grades\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Gérer les grades de la société\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"withdraw_cash_coffre\":{\"co-patron\":false,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"Agent de sécurité\":true,\"boss\":true,\"Recru\":false},\"deposit_item_chest\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":[],\"label\":\"Déposer un item dans le coffre\",\"Agent de sécurité\":true,\"boss\":true,\"Recru\":false},\"remove_item_chest\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Retirer un item dans le coffre\",\"Agent de sécurité\":true,\"boss\":true,\"Recru\":false},\"change_salary_grade\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Changer le salaire d\'un grade\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"withdraw_money_society\":{\"co-patron\":false,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"unmote_player\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Descendre un employé\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"items_chest:society\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Item(s) du coffre de la société\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"open_coffre\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":true,\"label\":\"Ouvrir le coffre\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"rename_grade\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Changer le nom d\'un grade\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"withdraw_black_money_coffre\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"Agent de sécurité\":true,\"boss\":true,\"Recru\":false},\"items_chest\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":true,\"label\":\"Items du coffre\",\"Agent de sécurité\":true,\"boss\":true,\"Recru\":false},\"remove_weapon_chest\":{\"co-patron\":false,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Retirer une arme dans le coffre\",\"Agent de sécurité\":true,\"boss\":true,\"Recru\":false},\"change_permissions_grade\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Changer les permissions d\'un grade\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"demote_player\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Virer un employé\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"open_boss\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Ouvrir le menu boss\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"remove_item_chest_society\":{\"co-patron\":false,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"deposit_weapon_chest\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":true,\"label\":\"Déposer une arme dans le coffre\",\"Agent de sécurité\":true,\"boss\":true,\"Recru\":false},\"remove_weapon_chest_society\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"promote_player\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Augmenter un employé\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"deposit_cash_coffre\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":true,\"label\":\"Déposer de l\'argent dans le coffre\",\"Agent de sécurité\":true,\"boss\":true,\"Recru\":false},\"manage_employeds\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Gérer les employés de la société\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"dposit_item_chest_society\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Déposer un item dans le coffre de la société\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"recruit_player\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Recruté un joueur\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"chest\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Accéder au coffre de la société\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"delete_grade\":{\"co-patron\":false,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Supprimer un grade\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"editClothes\":{\"co-patron\":true,\"grades\":{\"boss\":true},\"label\":\"Gérer les tenues dans le vestiaire\",\"vendeur\":false,\"Recru\":false},\"deposit_black_money_coffre\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"Agent de sécurité\":true,\"boss\":true,\"Recru\":false},\"weapons_chest\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Armes du coffre\",\"Agent de sécurité\":true,\"boss\":true,\"Recru\":false},\"rename_label_grade\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":false,\"label\":\"Changer le label d\'un grade\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false},\"deposit_money_society\":{\"co-patron\":true,\"Co-gérant\":[],\"grades\":{\"boss\":true},\"employed\":[],\"vendeur\":[],\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"Agent de sécurité\":false,\"boss\":true,\"Recru\":false}}', '{\"x\":-130.36439514160157,\"z\":168.820556640625,\"y\":-633.6214599609375}', '{\"x\":-138.48251342773438,\"z\":168.82034301757813,\"y\":-633.8392944335938}', '{\"active\":true,\"position\":{\"x\":-199.11761474609376,\"z\":40.48923873901367,\"y\":-574.9561157226563},\"sprite\":411,\"color\":53}', '3', 1, '[{\"grade\":false,\"name\":\"agent immo\",\"data\":{\"bracelets_1\":-1,\"beard_2\":0,\"lip_thickness\":0,\"moles_2\":0,\"bodyb_2\":0,\"blush_3\":0,\"eyebrows_1\":0,\"bproof_2\":0,\"bags_1\":0,\"arms\":24,\"beard_1\":0,\"blush_1\":0,\"chain_1\":0,\"chin_1\":0,\"decals_1\":0,\"pants_1\":28,\"eyebrows_2\":0,\"cheeks_3\":0,\"glasses_2\":0,\"lipstick_3\":0,\"nose_2\":0,\"blemishes_2\":0,\"age_2\":0,\"tshirt_2\":2,\"nose_6\":0,\"face_md_weight\":30,\"glasses_1\":5,\"eyebrows_6\":0,\"eyebrows_4\":0,\"mom\":29,\"bodyb_1\":-1,\"ears_2\":0,\"sun_1\":0,\"blemishes_1\":0,\"dad\":0,\"cheeks_1\":0,\"nose_3\":0,\"nose_4\":0,\"chin_2\":0,\"nose_1\":0,\"torso_1\":4,\"bproof_1\":0,\"nose_5\":0,\"age_1\":0,\"chest_1\":0,\"hair_1\":57,\"moles_1\":0,\"cheeks_2\":0,\"jaw_1\":0,\"neck_thickness\":0,\"bodyb_3\":-1,\"chest_3\":0,\"decals_2\":0,\"chin_4\":0,\"lipstick_4\":0,\"eyebrows_3\":0,\"mask_2\":0,\"eyebrows_5\":0,\"eye_color\":0,\"mask_1\":0,\"sex\":0,\"pants_2\":0,\"ears_1\":-1,\"arms_2\":0,\"shoes_2\":3,\"complexion_1\":0,\"shoes_1\":20,\"makeup_4\":0,\"chain_2\":0,\"beard_3\":0,\"complexion_2\":0,\"makeup_2\":0,\"beard_4\":0,\"makeup_3\":0,\"eye_squint\":0,\"makeup_1\":0,\"helmet_2\":0,\"tshirt_1\":13,\"sun_2\":0,\"blush_2\":0,\"chest_2\":0,\"jaw_2\":0,\"skin_md_weight\":50,\"watches_2\":0,\"hair_color_2\":0,\"lipstick_2\":0,\"torso_2\":0,\"hair_color_1\":0,\"watches_1\":-1,\"chin_3\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"bodyb_4\":0,\"helmet_1\":12,\"bags_2\":0,\"hair_2\":0},\"grades\":[]}]', '{\"x\":-132.2990264892578,\"z\":168.82034301757813,\"y\":-631.323974609375}'),
(26, 'cardealer', 'Concessionnaire Automobile', '{\"accounts\":{\"black_money\":0,\"society\":17740.0,\"cash\":0},\"weapons\":[],\"items\":[],\"items_boss\":[],\"weapons_boss\":[]}', '{\"change_permissions_grade\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Changer les permissions d\'un grade\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"remove_item_chest_society\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Retirer un item dans le coffre de la société\",\"dori\":true,\"recru\":false,\"junior\":true,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"chest\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Accéder au coffre de la société\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":true,\"responable des ventes\":true,\"King le boss\":true},\"manage_employeds\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Gérer les employés de la société\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"rename_label_grade\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Changer le label d\'un grade\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"promote_player\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Augmenter un employé\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"create_grade\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Créer un grade\",\"dori\":false,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"deposit_cash_coffre\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":[],\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Déposer de l\'argent dans le coffre\",\"dori\":true,\"recru\":true,\"junior\":true,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"items_chest\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":[],\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Items du coffre\",\"dori\":true,\"recru\":true,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"dposit_item_chest_society\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Déposer un item dans le coffre de la société\",\"dori\":true,\"recru\":true,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"manage_grades\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":[],\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Gérer les grades de la société\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"demote_player\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Virer un employé\",\"dori\":false,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"weapons_chest_society\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Arme(s) du coffre de la société\",\"dori\":true,\"recru\":true,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":true,\"responable des ventes\":true,\"King le boss\":true},\"remove_weapon_chest\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Retirer une arme dans le coffre\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"recruit_player\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Recruté un joueur\",\"dori\":false,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"deposit_item_chest\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":[],\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Déposer un item dans le coffre\",\"dori\":true,\"recru\":true,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"editClothes\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":[],\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Gérer les tenues dans le vestiaire\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"open_coffre\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":[],\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Ouvrir le coffre\",\"dori\":true,\"recru\":true,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"deposit_money_society\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":[],\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"dori\":true,\"recru\":true,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"withdraw_money_society\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"dori\":false,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":false,\"King le boss\":true},\"withdraw_cash_coffre\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Retirer de l\'argent dans le coffre\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":false,\"King le boss\":true},\"deposit_weapon_chest_society\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Déposer une arme dans le coffre de la société\",\"dori\":true,\"recru\":true,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"rename_grade\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Changer le nom d\'un grade\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"delete_grade\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Supprimer un grade\",\"dori\":false,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"weapons_chest\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":true,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Armes du coffre\",\"dori\":true,\"recru\":true,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"remove_weapon_chest_society\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Retirer une arme dans la coffre de la société\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":true,\"responable des ventes\":true,\"King le boss\":true},\"change_salary_grade\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Changer le salaire d\'un grade\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"deposit_weapon_chest\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Déposer une arme dans le coffre\",\"dori\":true,\"recru\":true,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":true,\"responable des ventes\":true,\"King le boss\":true},\"open_boss\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Ouvrir le menu boss\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"unmote_player\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Descendre un employé\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"remove_item_chest\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":[],\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Retirer un item dans le coffre\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"items_chest:society\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":[],\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Item(s) du coffre de la société\",\"dori\":true,\"recru\":true,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":true,\"responable des ventes\":true,\"King le boss\":true},\"withdraw_black_money_coffre\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":false,\"King le boss\":true},\"deposit_black_money_coffre\":{\"grades\":{\"boss\":true},\"responsable des ventes\":false,\"boss\":true,\"experienced\":true,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"dori\":true,\"recru\":true,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true},\"change_number_grade\":{\"grades\":{\"boss\":true},\"responsable des ventes\":true,\"boss\":true,\"experienced\":false,\"novice\":false,\"vide\":false,\"Gerant\":[],\"mec trop gentil\":true,\"label\":\"Changer le numéro d\'un grade\",\"dori\":true,\"recru\":false,\"junior\":false,\"expérimenté\":false,\"recruit\":false,\"recruu\":false,\"BOSSSSSS\":true,\"sénior\":false,\"responable des ventes\":true,\"King le boss\":true}}', '{\"z\":32.75215911865234,\"y\":-801.8919677734375,\"x\":-323.052734375}', '{\"z\":32.83231353759765,\"y\":-797.21533203125,\"x\":-323.9679870605469}', '{\"color\":0,\"position\":{\"z\":-610.9868,\"y\":-1124.0439,\"x\":25.5666},\"sprite\":225,\"active\":true}', '3', 1, '[{\"grades\":{\"responable des ventes\":\"responable des ventes\",\"dori\":\"dori\"},\"grade\":false,\"name\":\"concessionnaire \",\"data\":{\"sun_2\":0,\"eyebrows_1\":33,\"hair_color_2\":0,\"sun_1\":0,\"cheeks_1\":0,\"mask_1\":0,\"skin_md_weight\":0.0,\"chest_1\":0,\"arms_2\":0,\"dad\":35,\"beard_4\":0,\"blemishes_1\":0,\"beard_1\":0,\"makeup_4\":3.0,\"makeup_3\":0,\"bags_1\":0,\"mask_2\":0,\"hair_1\":15,\"nose_6\":0,\"face_md_weight\":0.0,\"cheeks_2\":0,\"sex\":0,\"glasses_2\":-1,\"eyebrows_6\":0,\"neck_thickness\":-1,\"age_1\":0,\"bproof_1\":0,\"hair_2\":0,\"bodyb_1\":-1,\"eyebrows_2\":10,\"bracelets_1\":-1,\"lipstick_2\":10.0,\"ears_1\":-1,\"watches_1\":-1,\"blush_2\":10.0,\"bags_2\":0,\"blush_3\":0,\"chin_4\":0,\"beard_2\":0,\"watches_2\":-1,\"bracelets_2\":0,\"decals_2\":0,\"nose_4\":5,\"nose_2\":0,\"chin_2\":0,\"eye_color\":5,\"blush_1\":-1,\"moles_2\":10.0,\"eyebrows_4\":0,\"makeup_2\":10.0,\"blemishes_2\":0,\"age_2\":10.0,\"ears_2\":-1,\"bproof_2\":0,\"decals_1\":0,\"eyebrows_5\":0,\"torso_1\":11,\"lipstick_4\":0,\"beard_3\":0,\"bodyb_2\":0,\"makeup_1\":-1,\"mom\":24,\"glasses_1\":-1,\"chest_2\":0,\"nose_1\":0,\"pants_1\":25,\"bodyb_3\":-1,\"tshirt_2\":0,\"chin_3\":0,\"nose_3\":0,\"chest_3\":0,\"jaw_2\":-1,\"bodyb_4\":0,\"eyebrows_3\":0,\"jaw_1\":-1,\"arms\":14,\"chain_1\":-1,\"pants_2\":1,\"nose_5\":0,\"complexion_1\":0,\"helmet_1\":-1,\"cheeks_3\":0,\"complexion_2\":0,\"shoes_1\":10,\"lipstick_3\":0,\"lip_thickness\":0.0,\"chain_2\":0,\"hair_color_1\":27,\"chin_1\":-1,\"moles_1\":6,\"tshirt_1\":22,\"eye_squint\":0,\"torso_2\":0,\"shoes_2\":0,\"helmet_2\":-1,\"lipstick_1\":-1}},{\"grades\":{\"responable des ventes\":\"responable des ventes\",\"boss\":\"boss\"},\"grade\":true,\"name\":\"responsable des ventes /patron\",\"data\":{\"lipstick_1\":8,\"eyebrows_1\":24,\"hair_color_2\":0,\"sun_1\":0,\"cheeks_1\":8,\"mask_1\":121,\"skin_md_weight\":50,\"chest_1\":0,\"arms_2\":0,\"dad\":3,\"cheeks_3\":9,\"blemishes_1\":0,\"beard_1\":25,\"makeup_4\":0,\"makeup_3\":0,\"bags_1\":0,\"mask_2\":0,\"hair_1\":73,\"nose_6\":0,\"face_md_weight\":15,\"cheeks_2\":3,\"sex\":0,\"glasses_2\":0,\"eyebrows_6\":0,\"neck_thickness\":10,\"age_1\":0,\"bproof_1\":0,\"hair_2\":0,\"bodyb_1\":3,\"eyebrows_2\":10,\"bracelets_1\":11,\"lipstick_2\":0,\"mom\":2,\"ears_1\":11,\"watches_1\":4,\"blush_2\":0,\"bags_2\":0,\"blush_3\":0,\"eyebrows_4\":0,\"beard_2\":10,\"bproof_2\":0,\"bracelets_2\":5,\"decals_2\":0,\"nose_4\":0,\"tshirt_2\":0,\"chin_2\":0,\"eye_color\":13,\"blush_1\":0,\"face_color\":18,\"makeup_1\":0,\"makeup_2\":0,\"sun_2\":0,\"blemishes_2\":0,\"age_2\":0,\"beard_4\":0,\"decals_1\":0,\"chin_4\":0,\"moles_2\":0,\"lipstick_4\":0,\"beard_3\":0,\"chest_2\":0,\"eyebrows_5\":0,\"torso_1\":750,\"glasses_1\":47,\"watches_2\":0,\"nose_1\":0,\"pants_1\":24,\"bodyb_2\":0,\"bodyb_3\":-1,\"nose_2\":0,\"chin_3\":0,\"chest_3\":0,\"jaw_2\":0,\"nose_3\":0,\"eyebrows_3\":0,\"moles_1\":0,\"arms\":1,\"jaw_1\":0,\"pants_2\":0,\"nose_5\":0,\"complexion_1\":0,\"helmet_1\":8,\"chain_1\":295,\"shoes_2\":0,\"shoes_1\":10,\"lipstick_3\":0,\"bodyb_4\":0,\"chain_2\":0,\"hair_color_1\":0,\"chin_1\":0,\"lip_thickness\":10,\"tshirt_1\":299,\"eye_squint\":0,\"complexion_2\":0,\"ears_2\":0,\"helmet_2\":0,\"torso_2\":0}},{\"data\":{\"lipstick_1\":0,\"eyebrows_1\":0,\"hair_color_2\":0,\"sun_1\":0,\"cheeks_1\":0,\"mask_1\":0,\"skin_md_weight\":50,\"watches_2\":0,\"arms_2\":0,\"dad\":1,\"beard_4\":0,\"moles_1\":0,\"beard_1\":8,\"makeup_4\":0,\"makeup_3\":0,\"bags_1\":0,\"mask_2\":0,\"ears_2\":0,\"nose_6\":0,\"face_md_weight\":50,\"cheeks_2\":0,\"sex\":0,\"eyebrows_4\":0,\"chin_3\":0,\"neck_thickness\":0,\"age_1\":0,\"bproof_1\":0,\"hair_2\":0,\"bodyb_1\":-1,\"eyebrows_2\":0,\"bracelets_1\":-1,\"chain_1\":167,\"chin_2\":0,\"ears_1\":-1,\"watches_1\":-1,\"blush_2\":0,\"bags_2\":0,\"blush_3\":0,\"makeup_1\":0,\"beard_2\":10,\"chest_2\":0,\"bracelets_2\":0,\"decals_2\":0,\"nose_4\":0,\"nose_2\":0,\"eye_squint\":0,\"eye_color\":0,\"blush_1\":0,\"face_color\":0,\"eyebrows_6\":0,\"makeup_2\":0,\"complexion_2\":0,\"jaw_1\":0,\"bodyb_2\":0,\"lipstick_2\":0,\"decals_1\":0,\"shoes_2\":0,\"nose_3\":0,\"lipstick_4\":0,\"beard_3\":0,\"eyebrows_5\":0,\"blemishes_2\":0,\"hair_color_1\":28,\"glasses_1\":56,\"hair_1\":91,\"nose_1\":0,\"pants_1\":35,\"torso_2\":1,\"bproof_2\":0,\"mom\":0,\"cheeks_3\":0,\"chest_3\":0,\"jaw_2\":0,\"torso_1\":11,\"eyebrows_3\":0,\"nose_5\":0,\"arms\":11,\"complexion_1\":0,\"pants_2\":0,\"bodyb_3\":-1,\"age_2\":0,\"helmet_1\":27,\"moles_2\":0,\"lip_thickness\":0,\"shoes_1\":51,\"lipstick_3\":0,\"sun_2\":0,\"chain_2\":0,\"bodyb_4\":0,\"chin_1\":0,\"chest_1\":0,\"tshirt_1\":6,\"glasses_2\":0,\"blemishes_1\":0,\"chin_4\":0,\"helmet_2\":0,\"tshirt_2\":0},\"grade\":true,\"name\":\"patron\",\"grades\":{\"boss\":\"boss\"}}]', '{\"z\":32.75215911865234,\"y\":-803.8225708007813,\"x\":-326.57666015625}'),
(27, 'airdealer', 'Concessionnaire Aérien', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"manage_employeds\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Gérer les employés de la société\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"remove_weapon_chest\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer une arme dans le coffre\",\"boss\":true,\"Novice\":false,\"Co Patron\":[]},\"recruit_player\":{\"Chef d\'equipe\":true,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Recruté un joueur\",\"boss\":true,\"Novice\":false,\"Co Patron\":[]},\"change_permissions_grade\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Changer les permissions d\'un grade\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"deposit_weapon_chest\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer une arme dans le coffre\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"manage_grades\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Gérer les grades de la société\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"deposit_money_society\":{\"Chef d\'equipe\":true,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"boss\":true,\"Novice\":false,\"Co Patron\":true},\"remove_item_chest_society\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer un item dans le coffre de la société\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"weapons_chest_society\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Arme(s) du coffre de la société\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"open_boss\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Ouvrir le menu boss\",\"boss\":true,\"Novice\":false,\"Co Patron\":true},\"editClothes\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Gérer les tenues dans le vestiaire\",\"boss\":[],\"Novice\":false,\"Co Patron\":true},\"demote_player\":{\"Chef d\'equipe\":true,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Virer un employé\",\"boss\":true,\"Novice\":false,\"Co Patron\":[]},\"delete_grade\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Supprimer un grade\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"change_salary_grade\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le salaire d\'un grade\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"withdraw_black_money_coffre\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent sale dans le coffre\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"dposit_item_chest_society\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer un item dans le coffre de la société\",\"boss\":true,\"Novice\":false,\"Co Patron\":[]},\"promote_player\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Augmenter un employé\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"rename_grade\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le nom d\'un grade\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"rename_label_grade\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le label d\'un grade\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"items_chest\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Items du coffre\",\"boss\":true,\"Novice\":false,\"Co Patron\":true},\"open_coffre\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Ouvrir le coffre\",\"boss\":true,\"Novice\":false,\"Co Patron\":true},\"remove_item_chest\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer un item dans le coffre\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"deposit_black_money_coffre\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent sale dans le coffre\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"unmote_player\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Descendre un employé\",\"boss\":true,\"Novice\":false,\"Co Patron\":true},\"chest\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Accéder au coffre de la société\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"remove_weapon_chest_society\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer une arme dans la coffre de la société\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"change_number_grade\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le numéro d\'un grade\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"items_chest:society\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Item(s) du coffre de la société\",\"boss\":true,\"Novice\":false,\"Co Patron\":true},\"deposit_cash_coffre\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent dans le coffre\",\"boss\":true,\"Novice\":false,\"Co Patron\":true},\"weapons_chest\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Armes du coffre\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"deposit_item_chest\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer un item dans le coffre\",\"boss\":true,\"Novice\":false,\"Co Patron\":true},\"deposit_weapon_chest_society\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer une arme dans le coffre de la société\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"withdraw_money_society\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"create_grade\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Créer un grade\",\"boss\":true,\"Novice\":false,\"Co Patron\":false},\"withdraw_cash_coffre\":{\"Chef d\'equipe\":false,\"Salarié\":true,\"Nouveau\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent dans le coffre\",\"boss\":true,\"Novice\":false,\"Co Patron\":false}}', '{\"y\":-2979.162109375,\"z\":19.84539794921875,\"x\":-900.5676879882813}', '{\"y\":-2954.657470703125,\"z\":19.84539794921875,\"x\":-941.421142578125}', '{\"sprite\":423,\"color\":0,\"active\":true,\"position\":{\"y\":-2954.657470703125,\"z\":19.84539794921875,\"x\":-941.421142578125}}', '3', 1, '[{\"name\":\"Patron-Blanc\",\"data\":{\"cheeks_2\":0,\"hair_1\":51,\"jaw_1\":-1,\"watches_2\":-1,\"eyebrows_3\":0,\"complexion_2\":0,\"cheeks_1\":0,\"pants_2\":5,\"shoes_1\":20,\"tshirt_2\":0,\"pants_1\":24,\"makeup_3\":0,\"blush_3\":0,\"complexion_1\":0,\"chest_3\":0,\"bags_1\":0,\"moles_1\":-1,\"skin_md_weight\":0.0,\"sun_1\":0,\"nose_2\":0,\"arms\":39,\"chin_1\":-1,\"bodyb_4\":0,\"eyebrows_4\":0,\"eye_color\":0,\"chain_2\":0,\"shoes_2\":3,\"hair_2\":0,\"sex\":0,\"lipstick_2\":10.0,\"torso_2\":4,\"face_md_weight\":0.0,\"blush_2\":10.0,\"eyebrows_6\":0,\"beard_1\":0,\"dad\":0,\"beard_2\":0,\"nose_5\":0,\"beard_3\":0,\"torso_1\":24,\"nose_3\":0,\"glasses_2\":-1,\"tshirt_1\":25,\"bags_2\":0,\"chin_3\":0,\"helmet_2\":-1,\"bproof_2\":0,\"mask_2\":0,\"blush_1\":-1,\"chest_2\":0,\"watches_1\":-1,\"bodyb_3\":-1,\"bracelets_1\":-1,\"blemishes_2\":0,\"nose_1\":0,\"eyebrows_2\":10,\"ears_2\":-1,\"makeup_2\":10.0,\"chin_4\":0,\"hair_color_2\":0,\"age_2\":10.0,\"bracelets_2\":0,\"helmet_1\":-1,\"makeup_4\":3.0,\"decals_1\":0,\"mask_1\":0,\"beard_4\":0,\"cheeks_3\":0,\"ears_1\":-1,\"nose_6\":0,\"chain_1\":-1,\"bproof_1\":0,\"lip_thickness\":0.0,\"chest_1\":0,\"neck_thickness\":-1,\"lipstick_3\":0,\"hair_color_1\":0,\"bodyb_1\":-1,\"sun_2\":0,\"mom\":0,\"lipstick_1\":-1,\"bodyb_2\":0,\"glasses_1\":-1,\"arms_2\":0,\"lipstick_4\":0,\"moles_2\":10.0,\"makeup_1\":-1,\"nose_4\":0,\"chin_2\":0,\"decals_2\":0,\"eyebrows_5\":0,\"jaw_2\":-1,\"blemishes_1\":0,\"age_1\":0,\"eye_squint\":0,\"eyebrows_1\":0},\"grades\":{\"boss\":\"boss\"},\"grade\":true}]', '{\"y\":-2965.811767578125,\"z\":19.84539794921875,\"x\":-923.8231811523438}');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(28, 'boatdealer', 'Concessionaire Bateau', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"deposit_cash_coffre\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent dans le coffre\",\"CO-FONDA\":false},\"dposit_item_chest_society\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer un item dans le coffre de la société\",\"CO-FONDA\":true},\"change_permissions_grade\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Changer les permissions d\'un grade\",\"CO-FONDA\":false},\"open_coffre\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"stagiaire\":false,\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Ouvrir le coffre\",\"CO-FONDA\":true},\"items_chest:society\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Item(s) du coffre de la société\",\"CO-FONDA\":false},\"delete_grade\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"stagiaire\":false,\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Supprimer un grade\",\"CO-FONDA\":false},\"manage_grades\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"stagiaire\":false,\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Gérer les grades de la société\",\"CO-FONDA\":false},\"remove_weapon_chest_society\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer une arme dans la coffre de la société\",\"CO-FONDA\":false},\"weapons_chest\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Armes du coffre\",\"CO-FONDA\":true},\"manage_employeds\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Gérer les employés de la société\",\"CO-FONDA\":false},\"rename_grade\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le nom d\'un grade\",\"CO-FONDA\":false},\"change_salary_grade\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le salaire d\'un grade\",\"CO-FONDA\":false},\"remove_item_chest\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"stagiaire\":false,\"CONSEILLER\":true,\"grades\":{\"boss\":true},\"label\":\"Retirer un item dans le coffre\",\"CO-FONDA\":true},\"withdraw_black_money_coffre\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent sale dans le coffre\",\"CO-FONDA\":false},\"deposit_black_money_coffre\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent sale dans le coffre\",\"CO-FONDA\":true},\"deposit_item_chest\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"stagiaire\":false,\"CONSEILLER\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer un item dans le coffre\",\"CO-FONDA\":false},\"items_chest\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Items du coffre\",\"CO-FONDA\":true},\"deposit_money_society\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"CO-FONDA\":false},\"recruit_player\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Recruté un joueur\",\"CO-FONDA\":true},\"withdraw_cash_coffre\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent dans le coffre\",\"CO-FONDA\":false},\"change_number_grade\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le numéro d\'un grade\",\"CO-FONDA\":false},\"unmote_player\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"stagiaire\":false,\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Descendre un employé\",\"CO-FONDA\":false},\"create_grade\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"stagiaire\":false,\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Créer un grade\",\"CO-FONDA\":false},\"remove_item_chest_society\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":false,\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer un item dans le coffre de la société\",\"CO-FONDA\":true},\"deposit_weapon_chest\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer une arme dans le coffre\",\"CO-FONDA\":true},\"promote_player\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Augmenter un employé\",\"CO-FONDA\":false},\"demote_player\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Virer un employé\",\"CO-FONDA\":true},\"withdraw_money_society\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":false,\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"CO-FONDA\":false},\"weapons_chest_society\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Arme(s) du coffre de la société\",\"CO-FONDA\":false},\"open_boss\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Ouvrir le menu boss\",\"CO-FONDA\":false},\"chest\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Accéder au coffre de la société\",\"CO-FONDA\":true},\"remove_weapon_chest\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer une arme dans le coffre\",\"CO-FONDA\":false},\"deposit_weapon_chest_society\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"stagiaire\":false,\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer une arme dans le coffre de la société\",\"CO-FONDA\":false},\"rename_label_grade\":{\"boss\":true,\"EMPLOYER\":false,\"novice\":[],\"CONSEILLER\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le label d\'un grade\",\"CO-FONDA\":false}}', '{\"x\":-810.6853637695313,\"y\":-1368.5792236328126,\"z\":5.17834520339965}', '{\"x\":-788.5839233398438,\"y\":-1345.907958984375,\"z\":5.1783447265625}', '{\"sprite\":410,\"position\":{\"x\":-788.5839233398438,\"y\":-1345.907958984375,\"z\":5.1783447265625},\"active\":true,\"color\":0}', '3', 1, '[]', '{\"x\":-791.1055908203125,\"y\":-1344.47021484375,\"z\":9.03531646728515}'),
(29, 'motodealer', 'Concessionnaire Moto', '{\"weapons\":[],\"items\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"cash\":0,\"black_money\":0},\"items_boss\":[]}', '{\"recruit_player\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":true,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Recruté un joueur\",\"grades\":{\"boss\":true}},\"rename_label_grade\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Changer le label d\'un grade\",\"grades\":{\"boss\":true}},\"deposit_black_money_coffre\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":[],\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true}},\"withdraw_money_society\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true}},\"manage_employeds\":{\"boss\":true,\"Apprentie\":false,\"grades\":{\"boss\":true},\"Stagiaire\":false,\"Manager \":false,\"Employer expert\":false,\"Employer\":false,\"Stagiaire \":false,\"employer Confirmer\":false,\"Manager\":false,\"label\":\"Gérer les employés de la société\",\"employer confirmer\":false,\"Employer \":false,\"Responsable\":true,\"Employer Expert\":false,\"Expérimenter\":false},\"deposit_money_society\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":[],\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true}},\"change_salary_grade\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Changer le salaire d\'un grade\",\"grades\":{\"boss\":true}},\"remove_weapon_chest\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Retirer une arme dans le coffre\",\"grades\":{\"boss\":true}},\"remove_item_chest_society\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Retirer un item dans le coffre de la société\",\"grades\":{\"boss\":true}},\"editClothes\":{\"Apprentie\":true,\"grades\":{\"boss\":true},\"Expérimenter\":true,\"Stagiaire \":false,\"Manager \":false,\"Employer\":false,\"Employer expert\":false,\"employer Confirmer\":false,\"Manager\":false,\"label\":\"Gérer les tenues dans le vestiaire\",\"employer confirmer\":false,\"Employer \":false,\"Responsable\":[],\"Employer Expert\":false,\"Stagiaire\":false},\"withdraw_cash_coffre\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Retirer de l\'argent dans le coffre\",\"grades\":{\"boss\":true}},\"unmote_player\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Descendre un employé\",\"grades\":{\"boss\":true}},\"open_coffre\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":[],\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Ouvrir le coffre\",\"grades\":{\"boss\":true}},\"deposit_weapon_chest\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":[],\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Déposer une arme dans le coffre\",\"grades\":{\"boss\":true}},\"remove_item_chest\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Retirer un item dans le coffre\",\"grades\":{\"boss\":true}},\"items_chest\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Items du coffre\",\"grades\":{\"boss\":true}},\"deposit_item_chest\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":[],\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Déposer un item dans le coffre\",\"grades\":{\"boss\":true}},\"change_permissions_grade\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Changer les permissions d\'un grade\",\"grades\":{\"boss\":true}},\"remove_weapon_chest_society\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Retirer une arme dans la coffre de la société\",\"grades\":{\"boss\":true}},\"create_grade\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Créer un grade\",\"grades\":{\"boss\":true}},\"items_chest:society\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Item(s) du coffre de la société\",\"grades\":{\"boss\":true}},\"withdraw_black_money_coffre\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Retirer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true}},\"rename_grade\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Changer le nom d\'un grade\",\"grades\":{\"boss\":true}},\"deposit_weapon_chest_society\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":[],\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Déposer une arme dans le coffre de la société\",\"grades\":{\"boss\":true}},\"promote_player\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Augmenter un employé\",\"grades\":{\"boss\":true}},\"deposit_cash_coffre\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":[],\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Déposer de l\'argent dans le coffre\",\"grades\":{\"boss\":true}},\"weapons_chest_society\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Arme(s) du coffre de la société\",\"grades\":{\"boss\":true}},\"demote_player\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Virer un employé\",\"grades\":{\"boss\":true}},\"open_boss\":{\"boss\":true,\"Apprentie\":false,\"grades\":{\"boss\":true},\"Stagiaire\":false,\"Manager \":false,\"Employer expert\":false,\"Employer\":false,\"Stagiaire \":false,\"employer Confirmer\":false,\"Manager\":false,\"label\":\"Ouvrir le menu boss\",\"employer confirmer\":false,\"Employer \":false,\"Responsable\":true,\"Employer Expert\":false,\"Expérimenter\":false},\"dposit_item_chest_society\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":[],\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Déposer un item dans le coffre de la société\",\"grades\":{\"boss\":true}},\"manage_grades\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Gérer les grades de la société\",\"grades\":{\"boss\":true}},\"chest\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Accéder au coffre de la société\",\"grades\":{\"boss\":true}},\"change_number_grade\":{\"boss\":true,\"Apprentie\":false,\"grades\":{\"boss\":true},\"Stagiaire\":false,\"Manager \":false,\"Employer expert\":false,\"Employer\":false,\"Stagiaire \":false,\"employer Confirmer\":false,\"Manager\":false,\"label\":\"Changer le numéro d\'un grade\",\"employer confirmer\":false,\"Employer \":false,\"Responsable\":[],\"Employer Expert\":false,\"Expérimenter\":false},\"delete_grade\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":false,\"Manager \":false,\"Expérimenter\":false,\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":[],\"label\":\"Supprimer un grade\",\"grades\":{\"boss\":true}},\"weapons_chest\":{\"Stagiaire \":false,\"Employer\":false,\"Employer \":false,\"Employer expert\":false,\"Employer Expert\":false,\"Apprentie\":[],\"Manager \":false,\"Expérimenter\":[],\"Stagiaire\":false,\"employer Confirmer\":false,\"Manager\":false,\"confirmer\":false,\"employer confirmer\":false,\"boss\":true,\"Responsable\":true,\"label\":\"Armes du coffre\",\"grades\":{\"boss\":true}}}', '{\"x\":1218.3592529296876,\"y\":2733.442138671875,\"z\":38.10158157348633}', '{\"x\":1236.1961669921876,\"y\":2731.91796875,\"z\":38.2231559753418}', '{\"color\":0,\"position\":{\"y\":2740.476318359375,\"z\":37.97674942016601,\"x\":1220.5162353515626},\"sprite\":348,\"active\":true}', '3', 1, '[{\"grade\":true,\"name\":\"Patron\",\"grades\":{\"boss\":\"boss\"},\"data\":{\"bags_1\":0,\"pants_2\":0,\"chest_1\":0,\"beard_1\":16,\"blemishes_2\":0,\"moles_1\":-1,\"makeup_4\":3.0,\"eye_squint\":0,\"shoes_2\":0,\"lipstick_2\":10.0,\"age_2\":10.0,\"chain_1\":0,\"bodyb_1\":-1,\"neck_thickness\":-1,\"bracelets_1\":-1,\"nose_1\":0,\"eyebrows_1\":33,\"nose_5\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_1\":0,\"helmet_2\":-1,\"jaw_1\":-1,\"hair_2\":0,\"shoes_1\":140,\"blush_2\":10.0,\"chest_3\":0,\"makeup_1\":-1,\"bproof_1\":93,\"decals_2\":6,\"blush_1\":-1,\"complexion_2\":0,\"sun_1\":0,\"tshirt_1\":296,\"cheeks_2\":0,\"beard_4\":0,\"lip_thickness\":0.0,\"torso_1\":25,\"glasses_2\":0,\"bodyb_3\":-1,\"skin_md_weight\":0.0,\"helmet_1\":11,\"cheeks_3\":0,\"sex\":0,\"complexion_1\":0,\"glasses_1\":50,\"chest_2\":0,\"dad\":31,\"chin_2\":0,\"nose_2\":0,\"watches_2\":-1,\"decals_1\":0,\"arms\":41,\"arms_2\":0,\"lipstick_3\":0,\"ears_1\":-1,\"nose_6\":0,\"eyebrows_4\":0,\"watches_1\":-1,\"mom\":28,\"hair_color_2\":0,\"lipstick_1\":-1,\"eyebrows_5\":0,\"eyebrows_3\":57,\"bodyb_4\":0,\"jaw_2\":-1,\"sun_2\":0,\"chin_4\":0,\"hair_1\":52,\"blush_3\":0,\"beard_2\":20,\"eyebrows_2\":10,\"torso_2\":1,\"chin_3\":0,\"nose_4\":0,\"moles_2\":10.0,\"lipstick_4\":0,\"makeup_2\":10.0,\"ears_2\":-1,\"bags_2\":0,\"tshirt_2\":0,\"bodyb_2\":0,\"nose_3\":0,\"chain_2\":0,\"chin_1\":-1,\"face_md_weight\":0.0,\"blemishes_1\":0,\"eye_color\":12,\"eyebrows_6\":0,\"beard_3\":55,\"mask_1\":0,\"makeup_3\":0,\"pants_1\":48,\"mask_2\":0,\"bracelets_2\":0,\"cheeks_1\":0}},{\"grade\":true,\"name\":\"Responsable\",\"grades\":{\"Responsable\":\"Responsable\"},\"data\":{\"bags_1\":0,\"pants_2\":0,\"chest_1\":0,\"beard_1\":16,\"blemishes_2\":0,\"moles_1\":-1,\"makeup_4\":3.0,\"eye_squint\":0,\"shoes_2\":0,\"lipstick_2\":10.0,\"age_2\":10.0,\"chain_1\":0,\"bodyb_1\":-1,\"neck_thickness\":-1,\"bracelets_1\":-1,\"nose_1\":0,\"eyebrows_1\":33,\"nose_5\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_1\":0,\"helmet_2\":-1,\"jaw_1\":-1,\"hair_2\":0,\"shoes_1\":140,\"blush_2\":10.0,\"chest_3\":0,\"makeup_1\":-1,\"bproof_1\":93,\"decals_2\":6,\"blush_1\":-1,\"complexion_2\":0,\"sun_1\":0,\"tshirt_1\":296,\"cheeks_2\":0,\"beard_4\":0,\"lip_thickness\":0.0,\"torso_1\":835,\"glasses_2\":0,\"bodyb_3\":-1,\"skin_md_weight\":0.0,\"helmet_1\":11,\"cheeks_3\":0,\"sex\":0,\"complexion_1\":0,\"glasses_1\":50,\"chest_2\":0,\"dad\":31,\"chin_2\":0,\"nose_2\":0,\"watches_2\":-1,\"decals_1\":0,\"arms\":41,\"arms_2\":0,\"lipstick_3\":0,\"ears_1\":-1,\"nose_6\":0,\"eyebrows_4\":0,\"watches_1\":-1,\"mom\":28,\"hair_color_2\":0,\"lipstick_1\":-1,\"eyebrows_5\":0,\"eyebrows_3\":57,\"bodyb_4\":0,\"jaw_2\":-1,\"sun_2\":0,\"chin_4\":0,\"hair_1\":52,\"blush_3\":0,\"beard_2\":20,\"eyebrows_2\":10,\"torso_2\":0,\"chin_3\":0,\"nose_4\":0,\"moles_2\":10.0,\"lipstick_4\":0,\"makeup_2\":10.0,\"ears_2\":-1,\"bags_2\":0,\"tshirt_2\":0,\"bodyb_2\":0,\"nose_3\":0,\"chain_2\":0,\"chin_1\":-1,\"face_md_weight\":0.0,\"blemishes_1\":0,\"eye_color\":12,\"eyebrows_6\":0,\"beard_3\":55,\"mask_1\":0,\"makeup_3\":0,\"pants_1\":48,\"mask_2\":0,\"bracelets_2\":0,\"cheeks_1\":0}},{\"grade\":true,\"name\":\"Recrue\",\"grades\":{\"Apprentie\":\"Apprentie\"},\"data\":{\"bags_1\":0,\"pants_2\":0,\"chest_1\":0,\"beard_1\":16,\"blemishes_2\":0,\"moles_1\":-1,\"makeup_4\":3.0,\"eye_squint\":0,\"shoes_2\":0,\"lipstick_2\":10.0,\"age_2\":10.0,\"chain_1\":0,\"bodyb_1\":-1,\"neck_thickness\":-1,\"bracelets_1\":-1,\"nose_1\":0,\"eyebrows_1\":33,\"nose_5\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_1\":0,\"helmet_2\":-1,\"jaw_1\":-1,\"hair_2\":0,\"shoes_1\":140,\"blush_2\":10.0,\"chest_3\":0,\"makeup_1\":-1,\"bproof_1\":93,\"decals_2\":6,\"blush_1\":-1,\"complexion_2\":0,\"sun_1\":0,\"tshirt_1\":155,\"cheeks_2\":0,\"beard_4\":0,\"lip_thickness\":0.0,\"torso_1\":576,\"glasses_2\":0,\"bodyb_3\":-1,\"skin_md_weight\":0.0,\"helmet_1\":11,\"cheeks_3\":0,\"sex\":0,\"complexion_1\":0,\"glasses_1\":0,\"chest_2\":0,\"dad\":31,\"chin_2\":0,\"nose_2\":0,\"watches_2\":-1,\"decals_1\":0,\"arms\":40,\"arms_2\":0,\"lipstick_3\":0,\"ears_1\":-1,\"nose_6\":0,\"eyebrows_4\":0,\"watches_1\":-1,\"mom\":28,\"hair_color_2\":0,\"lipstick_1\":-1,\"eyebrows_5\":0,\"eyebrows_3\":57,\"bodyb_4\":0,\"jaw_2\":-1,\"sun_2\":0,\"chin_4\":0,\"hair_1\":52,\"blush_3\":0,\"beard_2\":20,\"eyebrows_2\":10,\"torso_2\":0,\"chin_3\":0,\"nose_4\":0,\"moles_2\":10.0,\"lipstick_4\":0,\"makeup_2\":10.0,\"ears_2\":-1,\"bags_2\":0,\"tshirt_2\":0,\"bodyb_2\":0,\"nose_3\":0,\"chain_2\":0,\"chin_1\":-1,\"face_md_weight\":0.0,\"blemishes_1\":0,\"eye_color\":12,\"eyebrows_6\":0,\"beard_3\":55,\"mask_1\":0,\"makeup_3\":0,\"pants_1\":48,\"mask_2\":0,\"bracelets_2\":0,\"cheeks_1\":0}},{\"grade\":true,\"name\":\"Experimenter\",\"grades\":{\"Expérimenter\":\"Expérimenter\"},\"data\":{\"bags_1\":0,\"pants_2\":0,\"chest_1\":0,\"beard_1\":16,\"blemishes_2\":0,\"moles_1\":-1,\"makeup_4\":3.0,\"eye_squint\":0,\"shoes_2\":0,\"lipstick_2\":10.0,\"age_2\":10.0,\"chain_1\":0,\"bodyb_1\":-1,\"neck_thickness\":-1,\"bracelets_1\":-1,\"nose_1\":0,\"eyebrows_1\":33,\"nose_5\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_1\":0,\"helmet_2\":-1,\"jaw_1\":-1,\"hair_2\":0,\"shoes_1\":140,\"blush_2\":10.0,\"chest_3\":0,\"makeup_1\":-1,\"bproof_1\":93,\"decals_2\":6,\"blush_1\":-1,\"complexion_2\":0,\"sun_1\":0,\"tshirt_1\":155,\"cheeks_2\":0,\"beard_4\":0,\"lip_thickness\":0.0,\"torso_1\":349,\"glasses_2\":0,\"bodyb_3\":-1,\"skin_md_weight\":0.0,\"helmet_1\":11,\"cheeks_3\":0,\"sex\":0,\"complexion_1\":0,\"glasses_1\":0,\"chest_2\":0,\"dad\":31,\"chin_2\":0,\"nose_2\":0,\"watches_2\":-1,\"decals_1\":0,\"arms\":41,\"arms_2\":0,\"lipstick_3\":0,\"ears_1\":-1,\"nose_6\":0,\"eyebrows_4\":0,\"watches_1\":-1,\"mom\":28,\"hair_color_2\":0,\"lipstick_1\":-1,\"eyebrows_5\":0,\"eyebrows_3\":57,\"bodyb_4\":0,\"jaw_2\":-1,\"sun_2\":0,\"chin_4\":0,\"hair_1\":52,\"blush_3\":0,\"beard_2\":20,\"eyebrows_2\":10,\"torso_2\":1,\"chin_3\":0,\"nose_4\":0,\"moles_2\":10.0,\"lipstick_4\":0,\"makeup_2\":10.0,\"ears_2\":-1,\"bags_2\":0,\"tshirt_2\":0,\"bodyb_2\":0,\"nose_3\":0,\"chain_2\":0,\"chin_1\":-1,\"face_md_weight\":0.0,\"blemishes_1\":0,\"eye_color\":12,\"eyebrows_6\":0,\"beard_3\":55,\"mask_1\":0,\"makeup_3\":0,\"pants_1\":48,\"mask_2\":0,\"bracelets_2\":0,\"cheeks_1\":0}}]', '{\"x\":1211.4820556640626,\"y\":2733.3935546875,\"z\":38.74958801269531}'),
(30, 'saspn', 'BCSO', '{\"items\":[],\"weapons_boss\":[],\"accounts\":{\"society\":1000,\"black_money\":0,\"cash\":0},\"weapons\":[],\"items_boss\":[]}', '{\"deposit_item_chest\":{\"sergent2\":[],\"Under Sheriff\":true,\"lieutenant\":true,\"label\":\"Déposer un item dans le coffre\",\"officier1\":[],\"officier3\":false,\"officierprincipal \":[],\"sergent1\":true,\"boss\":true,\"officier2\":true,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"open_coffre\":{\"sergent2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Ouvrir le coffre\",\"officier1\":[],\"officier3\":false,\"officierprincipal \":[],\"sergent1\":[],\"boss\":true,\"officier2\":false,\"capitaine\":[],\"cadet\":false,\"grades\":{\"boss\":true}},\"delete_grade\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Supprimer un grade\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"deposit_weapon_chest_society\":{\"sergent2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Déposer une arme dans le coffre de la société\",\"officier1\":[],\"officier3\":[],\"officierprincipal \":[],\"sergent1\":[],\"boss\":true,\"officier2\":[],\"capitaine\":[],\"cadet\":false,\"grades\":{\"boss\":true}},\"open_boss\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Ouvrir le menu boss\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":[],\"sergent1\":[],\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"rename_label_grade\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Changer le label d\'un grade\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"create_grade\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Créer un grade\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"chest\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Accéder au coffre de la société\",\"officier1\":[],\"officier3\":false,\"officierprincipal \":[],\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"change_salary_grade\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Changer le salaire d\'un grade\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"withdraw_cash_coffre\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"remove_weapon_chest\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Retirer une arme dans le coffre\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"recruit_player\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Recruté un joueur\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"change_permissions_grade\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Changer les permissions d\'un grade\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"items_chest\":{\"sergent2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Items du coffre\",\"officier1\":[],\"officier3\":[],\"officierprincipal \":true,\"sergent1\":[],\"boss\":true,\"officier2\":[],\"capitaine\":true,\"cadet\":[],\"grades\":{\"boss\":true}},\"promote_player\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Augmenter un employé\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":[],\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"demote_player\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Virer un employé\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"change_number_grade\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Changer le numéro d\'un grade\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"remove_item_chest_society\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"weapons_chest_society\":{\"sergent2\":true,\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Arme(s) du coffre de la société\",\"officier1\":[],\"officier3\":[],\"officierprincipal \":[],\"sergent1\":true,\"boss\":true,\"officier2\":[],\"capitaine\":[],\"cadet\":false,\"grades\":{\"boss\":true}},\"items_chest:society\":{\"sergent2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Item(s) du coffre de la société\",\"officier1\":[],\"officier3\":[],\"officierprincipal \":[],\"sergent1\":[],\"boss\":true,\"officier2\":[],\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"deposit_cash_coffre\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Déposer de l\'argent dans le coffre\",\"officier1\":[],\"officier3\":[],\"officierprincipal \":[],\"sergent1\":false,\"boss\":true,\"officier2\":true,\"capitaine\":[],\"cadet\":false,\"grades\":{\"boss\":true}},\"rename_grade\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Changer le nom d\'un grade\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"manage_employeds\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Gérer les employés de la société\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"withdraw_black_money_coffre\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":[],\"grades\":{\"boss\":true}},\"manage_grades\":{\"sergent2\":[],\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Gérer les grades de la société\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"withdraw_money_society\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"dposit_item_chest_society\":{\"sergent2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Déposer un item dans le coffre de la société\",\"officier1\":[],\"officier3\":[],\"officierprincipal \":[],\"sergent1\":[],\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"deposit_money_society\":{\"sergent2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"officier1\":[],\"officier3\":[],\"officierprincipal \":[],\"sergent1\":[],\"boss\":true,\"officier2\":[],\"capitaine\":[],\"cadet\":false,\"grades\":{\"boss\":true}},\"deposit_black_money_coffre\":{\"sergent2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Déposer de l\'argent sale dans le coffre\",\"officier1\":[],\"officier3\":false,\"officierprincipal \":[],\"sergent1\":[],\"boss\":true,\"officier2\":[],\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"remove_item_chest\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Retirer un item dans le coffre\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"deposit_weapon_chest\":{\"sergent2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Déposer une arme dans le coffre\",\"officier1\":[],\"officier3\":[],\"officierprincipal \":true,\"sergent1\":[],\"boss\":true,\"officier2\":[],\"capitaine\":[],\"cadet\":[],\"grades\":{\"boss\":true}},\"editClothes\":{\"capitaine\":[],\"label\":\"Gérer les tenues dans le vestiaire\",\"Under Sheriff\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"remove_weapon_chest_society\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"unmote_player\":{\"sergent2\":false,\"Under Sheriff\":true,\"lieutenant\":false,\"label\":\"Descendre un employé\",\"officier1\":false,\"officier3\":false,\"officierprincipal \":false,\"sergent1\":false,\"boss\":true,\"officier2\":false,\"capitaine\":true,\"cadet\":false,\"grades\":{\"boss\":true}},\"weapons_chest\":{\"sergent2\":[],\"Under Sheriff\":true,\"lieutenant\":[],\"label\":\"Armes du coffre\",\"officier1\":[],\"officier3\":[],\"officierprincipal \":[],\"sergent1\":[],\"boss\":true,\"officier2\":true,\"capitaine\":[],\"cadet\":false,\"grades\":{\"boss\":true}}}', '{\"z\":27.58152770996093,\"y\":6011.97412109375,\"x\":-437.8479614257813}', '{\"z\":36.99566268920898,\"y\":6006.29931640625,\"x\":-432.8706970214844}', '{\"color\":6,\"active\":true,\"sprite\":60,\"position\":{\"z\":36.99566268920898,\"y\":6006.29931640625,\"x\":-432.8706970214844}}', '5000', 1, '[{\"name\":\"unefined\",\"grades\":[],\"grade\":false,\"data\":{\"bracelets_2\":0,\"neck_thickness\":0,\"blemishes_1\":0,\"mask_1\":223,\"hair_color_1\":60,\"nose_1\":0,\"mask_2\":0,\"complexion_2\":0,\"tshirt_2\":2,\"hair_2\":0,\"chest_3\":0,\"nose_2\":0,\"beard_1\":16,\"bproof_1\":0,\"glasses_1\":56,\"lipstick_1\":0,\"lip_thickness\":0,\"watches_1\":21,\"lipstick_3\":0,\"dad\":37,\"chin_2\":0,\"bodyb_3\":-1,\"shoes_2\":0,\"mom\":21,\"eyebrows_6\":0,\"eyebrows_5\":0,\"complexion_1\":0,\"chin_4\":0,\"beard_2\":10,\"bags_1\":125,\"blemishes_2\":0,\"eyebrows_2\":0,\"face_md_weight\":50,\"face_color\":0,\"decals_1\":0,\"torso_2\":0,\"chin_1\":0,\"nose_3\":0,\"decals_2\":0,\"arms\":1,\"pants_2\":2,\"beard_3\":0,\"sun_2\":0,\"eyebrows_1\":0,\"tshirt_1\":81,\"sex\":0,\"bproof_2\":0,\"chain_2\":2,\"eyebrows_4\":0,\"cheeks_2\":0,\"hair_color_2\":0,\"ears_2\":0,\"chain_1\":278,\"eye_squint\":0,\"makeup_2\":0,\"sun_1\":0,\"helmet_2\":3,\"torso_1\":783,\"bags_2\":0,\"moles_1\":0,\"helmet_1\":113,\"pants_1\":327,\"skin_md_weight\":50,\"makeup_4\":0,\"hair_1\":73,\"nose_4\":0,\"watches_2\":0,\"moles_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"chest_1\":0,\"jaw_1\":0,\"chest_2\":0,\"blush_3\":0,\"nose_6\":0,\"ears_1\":-1,\"bodyb_1\":-1,\"shoes_1\":54,\"lipstick_4\":0,\"blush_2\":0,\"bracelets_1\":3,\"bodyb_2\":0,\"glasses_2\":0,\"beard_4\":0,\"blush_1\":0,\"nose_5\":0,\"eye_color\":0,\"makeup_3\":0,\"makeup_1\":0,\"chin_3\":0,\"age_1\":0,\"bodyb_4\":0,\"arms_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"jaw_2\":0,\"lipstick_2\":0}}]', '{\"z\":36.99565887451172,\"y\":6011.17041015625,\"x\":-439.0482177734375}');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(32, 'police', 'SASP', '{\"weapons\":[],\"accounts\":{\"society\":3310000,\"black_money\":0,\"cash\":0},\"items_boss\":[],\"items\":[],\"weapons_boss\":[]}', '{\"withdraw_cash_coffre\":{\"Chief \":true,\"officierprincipal \":[],\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":true,\"officier1\":false,\"cadet\":false,\"sergent2\":[],\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent dans le coffre\",\"boss\":true,\"crm\":false},\"create_grade\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":true,\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Créer un grade\",\"boss\":true,\"crm\":false},\"remove_weapon_chest\":{\"Chief \":true,\"officierprincipal \":[],\"officier2\":true,\"swat\":false,\"capitaine\":[],\"sergent1\":[],\"officier1\":false,\"cadet\":false,\"sergent2\":[],\"lieutenant\":false,\"officier3\":true,\"grades\":{\"boss\":true},\"label\":\"Retirer une arme dans le coffre\",\"boss\":true,\"crm\":true},\"weapons_chest\":{\"Chief \":true,\"officierprincipal \":true,\"officier2\":true,\"swat\":true,\"capitaine\":[],\"sergent1\":[],\"officier1\":false,\"cadet\":[],\"sergent2\":[],\"lieutenant\":false,\"officier3\":true,\"grades\":{\"boss\":true},\"label\":\"Armes du coffre\",\"boss\":true,\"crm\":false},\"deposit_item_chest\":{\"Chief \":true,\"officierprincipal \":[],\"officier2\":true,\"swat\":true,\"capitaine\":[],\"sergent1\":[],\"officier1\":true,\"cadet\":true,\"sergent2\":[],\"lieutenant\":[],\"officier3\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer un item dans le coffre\",\"boss\":true,\"crm\":true},\"change_permissions_grade\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":false,\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Changer les permissions d\'un grade\",\"boss\":true,\"crm\":false},\"deposit_weapon_chest_society\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer une arme dans le coffre de la société\",\"boss\":true,\"crm\":false},\"rename_grade\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":false,\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":true,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le nom d\'un grade\",\"boss\":true,\"crm\":false},\"open_boss\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":true,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Ouvrir le menu boss\",\"boss\":true,\"crm\":false},\"deposit_cash_coffre\":{\"Chief \":true,\"officierprincipal \":[],\"officier2\":true,\"swat\":true,\"capitaine\":[],\"sergent1\":[],\"officier1\":[],\"cadet\":true,\"sergent2\":[],\"lieutenant\":[],\"officier3\":[],\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent dans le coffre\",\"boss\":true,\"crm\":true},\"dposit_item_chest_society\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":true,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer un item dans le coffre de la société\",\"boss\":true,\"crm\":false},\"change_number_grade\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":false,\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le numéro d\'un grade\",\"boss\":true,\"crm\":false},\"recruit_player\":{\"Chief \":true,\"officierprincipal \":true,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":[],\"officier1\":false,\"cadet\":false,\"sergent2\":[],\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Recruté un joueur\",\"boss\":true,\"crm\":false},\"deposit_black_money_coffre\":{\"Chief \":true,\"officierprincipal \":[],\"officier2\":true,\"swat\":true,\"capitaine\":[],\"sergent1\":[],\"officier1\":true,\"cadet\":[],\"sergent2\":[],\"lieutenant\":[],\"officier3\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent sale dans le coffre\",\"boss\":true,\"crm\":true},\"manage_grades\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":false,\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":true,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Gérer les grades de la société\",\"boss\":true,\"crm\":false},\"editClothes\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Gérer les tenues dans le vestiaire\",\"boss\":true,\"crm\":false},\"remove_item_chest\":{\"Chief \":true,\"officierprincipal \":[],\"officier2\":false,\"swat\":true,\"capitaine\":[],\"sergent1\":[],\"officier1\":false,\"cadet\":false,\"sergent2\":[],\"lieutenant\":false,\"officier3\":true,\"grades\":{\"boss\":true},\"label\":\"Retirer un item dans le coffre\",\"boss\":true,\"crm\":true},\"remove_item_chest_society\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer un item dans le coffre de la société\",\"boss\":true,\"crm\":false},\"demote_player\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":true,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Virer un employé\",\"boss\":true,\"crm\":false},\"items_chest\":{\"Chief \":true,\"officierprincipal \":[],\"officier2\":true,\"swat\":true,\"capitaine\":[],\"sergent1\":[],\"officier1\":true,\"cadet\":true,\"sergent2\":[],\"lieutenant\":[],\"officier3\":true,\"grades\":{\"boss\":true},\"label\":\"Items du coffre\",\"boss\":true,\"crm\":false},\"promote_player\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":true,\"lieutenant\":[],\"officier3\":true,\"grades\":{\"boss\":true},\"label\":\"Augmenter un employé\",\"boss\":true,\"crm\":false},\"items_chest:society\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Item(s) du coffre de la société\",\"boss\":true,\"crm\":false},\"rename_label_grade\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":false,\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le label d\'un grade\",\"boss\":true,\"crm\":false},\"change_salary_grade\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Changer le salaire d\'un grade\",\"boss\":true,\"crm\":false},\"deposit_money_society\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":true,\"officier1\":false,\"cadet\":[],\"sergent2\":true,\"lieutenant\":[],\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"boss\":true,\"crm\":false},\"remove_weapon_chest_society\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer une arme dans la coffre de la société\",\"boss\":true,\"crm\":false},\"weapons_chest_society\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":[],\"grades\":{\"boss\":true},\"label\":\"Arme(s) du coffre de la société\",\"boss\":true,\"crm\":false},\"chest\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":[],\"officier1\":false,\"cadet\":false,\"sergent2\":true,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Accéder au coffre de la société\",\"boss\":true,\"crm\":false},\"delete_grade\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":true,\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Supprimer un grade\",\"boss\":true,\"crm\":false},\"deposit_weapon_chest\":{\"Chief \":true,\"officierprincipal \":[],\"officier2\":true,\"swat\":true,\"capitaine\":[],\"sergent1\":[],\"officier1\":true,\"cadet\":[],\"sergent2\":[],\"lieutenant\":false,\"officier3\":true,\"grades\":{\"boss\":true},\"label\":\"Déposer une arme dans le coffre\",\"boss\":true,\"crm\":true},\"withdraw_money_society\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":false,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"boss\":true,\"crm\":false},\"manage_employeds\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":true,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Gérer les employés de la société\",\"boss\":true,\"crm\":false},\"open_coffre\":{\"Chief \":true,\"officierprincipal \":[],\"officier2\":true,\"swat\":true,\"capitaine\":[],\"sergent1\":[],\"officier1\":true,\"cadet\":false,\"sergent2\":[],\"lieutenant\":[],\"officier3\":true,\"grades\":{\"boss\":true},\"label\":\"Ouvrir le coffre\",\"boss\":true,\"crm\":true},\"withdraw_black_money_coffre\":{\"Chief \":true,\"officierprincipal \":[],\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":[],\"officier1\":false,\"cadet\":false,\"sergent2\":[],\"lieutenant\":[],\"officier3\":true,\"grades\":{\"boss\":true},\"label\":\"Retirer de l\'argent sale dans le coffre\",\"boss\":true,\"crm\":false},\"unmote_player\":{\"Chief \":true,\"officierprincipal \":false,\"officier2\":false,\"swat\":false,\"capitaine\":[],\"sergent1\":false,\"officier1\":false,\"cadet\":false,\"sergent2\":true,\"lieutenant\":false,\"officier3\":false,\"grades\":{\"boss\":true},\"label\":\"Descendre un employé\",\"boss\":true,\"crm\":false}}', '{\"x\":-584.0240478515625,\"y\":-442.9743347167969,\"z\":31.16007423400879}', '{\"x\":-569.9465942382813,\"y\":-418.4309997558594,\"z\":39.63274002075195}', '{\"position\":{\"x\":574.9565,\"y\": -2.7788,\"z\":78.1980},\"sprite\":60,\"active\":true,\"color\":37}', '5000', 1, '[{\"grades\":{\"Chief \":\"Chief \"},\"data\":{\"torso_2\":0,\"blush_1\":0,\"skin_md_weight\":50,\"mask_2\":0,\"complexion_2\":0,\"nose_5\":0,\"beard_1\":26,\"watches_2\":0,\"ears_1\":-1,\"eye_squint\":0,\"hair_color_1\":0,\"hair_color_2\":0,\"eyebrows_2\":10,\"chain_1\":0,\"jaw_1\":0,\"chin_3\":0,\"beard_3\":0,\"eyebrows_3\":0,\"beard_2\":10,\"bracelets_1\":-1,\"tshirt_1\":23,\"chest_1\":0,\"nose_1\":0,\"beard_4\":0,\"shoes_2\":2,\"makeup_4\":0,\"mom\":25,\"eye_color\":0,\"glasses_1\":0,\"chin_1\":0,\"nose_3\":0,\"bodyb_3\":-1,\"chain_2\":0,\"bodyb_4\":0,\"watches_1\":-1,\"makeup_3\":0,\"bags_2\":0,\"cheeks_2\":0,\"nose_6\":0,\"eyebrows_5\":0,\"bproof_1\":0,\"sun_2\":0,\"bodyb_1\":-1,\"eyebrows_1\":33,\"moles_1\":0,\"chin_4\":0,\"blemishes_1\":0,\"lipstick_3\":0,\"dad\":3,\"eyebrows_4\":0,\"cheeks_1\":0,\"helmet_2\":0,\"blush_3\":0,\"neck_thickness\":0,\"arms_2\":0,\"face_color\":0,\"decals_2\":0,\"blush_2\":0,\"age_1\":0,\"mask_1\":0,\"decals_1\":0,\"lipstick_2\":0,\"sex\":0,\"pants_2\":1,\"age_2\":0,\"pants_1\":43,\"makeup_1\":0,\"nose_2\":0,\"chin_2\":0,\"arms\":1,\"chest_2\":0,\"blemishes_2\":0,\"shoes_1\":7,\"lip_thickness\":0,\"eyebrows_6\":0,\"bodyb_2\":0,\"glasses_2\":0,\"torso_1\":733,\"ears_2\":0,\"jaw_2\":0,\"nose_4\":0,\"hair_2\":0,\"sun_1\":0,\"makeup_2\":0,\"cheeks_3\":0,\"bags_1\":0,\"tshirt_2\":0,\"bproof_2\":0,\"moles_2\":0,\"helmet_1\":120,\"lipstick_1\":0,\"chest_3\":0,\"face_md_weight\":0,\"hair_1\":78,\"lipstick_4\":0,\"bracelets_2\":0,\"complexion_1\":0},\"name\":\"Chief trkl\",\"grade\":true}]', '{\"x\":-602.2515258789063,\"y\":-419.8621826171875,\"z\":35.17194366455078}'),
(33, 'gouvernement', 'Gouvernement', '{\"weapons\":[],\"accounts\":{\"society\":4302.781304293821,\"black_money\":0,\"cash\":0},\"items_boss\":[],\"items\":[],\"weapons_boss\":[]}', '{\"withdraw_cash_coffre\":{\"Secretaire au Logement\":false,\"garde\":true,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"create_grade\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Créer un grade\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"remove_weapon_chest\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Retirer une arme dans le coffre\",\"chefsecu\":true,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"weapons_chest\":{\"Secretaire au Logement\":false,\"garde\":true,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Armes du coffre\",\"chefsecu\":true,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"deposit_item_chest\":{\"Secretaire au Logement\":false,\"garde\":true,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Déposer un item dans le coffre\",\"chefsecu\":true,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"change_permissions_grade\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Changer les permissions d\'un grade\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"deposit_weapon_chest_society\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Déposer une arme dans le coffre de la société\",\"chefsecu\":true,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"rename_grade\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Changer le nom d\'un grade\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"open_boss\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Ouvrir le menu boss\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"deposit_cash_coffre\":{\"Secretaire au Logement\":false,\"garde\":true,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Déposer de l\'argent dans le coffre\",\"chefsecu\":true,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"dposit_item_chest_society\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Déposer un item dans le coffre de la société\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"change_number_grade\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Changer le numéro d\'un grade\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"recruit_player\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Recruté un joueur\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"deposit_black_money_coffre\":{\"Secretaire au Logement\":false,\"garde\":true,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"chefsecu\":true,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"manage_grades\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Gérer les grades de la société\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"editClothes\":{\"Secretaire au Logement\":true,\"garde\":false,\"Secrétaire d\'Etat\":[],\"Ministre de l\'Economie\":[],\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":true,\"label\":\"Gérer les tenues dans le vestiaire\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":true,\"boss\":true,\"Ministre de la Justice\":[],\"Secretaire Défense\":[],\"Vice Gouverneur\":true},\"remove_item_chest\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Retirer un item dans le coffre\",\"chefsecu\":true,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"remove_item_chest_society\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"demote_player\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Virer un employé\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"items_chest\":{\"Secretaire au Logement\":false,\"garde\":true,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Items du coffre\",\"chefsecu\":true,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"promote_player\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Augmenter un employé\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"items_chest:society\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Item(s) du coffre de la société\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"rename_label_grade\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Changer le label d\'un grade\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"change_salary_grade\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Changer le salaire d\'un grade\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"deposit_money_society\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"remove_weapon_chest_society\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"weapons_chest_society\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Arme(s) du coffre de la société\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"chest\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Accéder au coffre de la société\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"delete_grade\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Supprimer un grade\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"deposit_weapon_chest\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Déposer une arme dans le coffre\",\"chefsecu\":true,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"withdraw_money_society\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"manage_employeds\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Gérer les employés de la société\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"open_coffre\":{\"Secretaire au Logement\":false,\"garde\":true,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Ouvrir le coffre\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"withdraw_black_money_coffre\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":true,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true},\"unmote_player\":{\"Secretaire au Logement\":false,\"garde\":false,\"Secrétaire d\'Etat\":false,\"Ministre de l\'Economie\":false,\"Chef S\'écurité\":true,\"grades\":{\"boss\":true},\"president\":true,\"juge\":false,\"label\":\"Descendre un employé\",\"chefsecu\":false,\"test\":false,\"Avocat\":false,\"Premier Ministre\":false,\"procureur\":false,\"boss\":true,\"Ministre de la Justice\":false,\"Secretaire Défense\":false,\"Vice Gouverneur\":true}}', '{\"x\":-544.2180786132813,\"y\":-198.42184448242188,\"z\":47.41493606567383}', '{\"x\":-544.8018798828125,\"y\":-201.9675445556641,\"z\":47.41492080688476}', '{\"position\":{\"x\":-555.5638,\"y\":-597.1379,\"z\":34.6823},\"sprite\":419,\"active\":true,\"color\":0}', '0', 1, '[{\"name\":\"Premier Ministre\",\"grades\":{\"Premier Ministre\":\"Premier Ministre\"},\"grade\":true,\"data\":{\"complexion_2\":1,\"lipstick_4\":0,\"mask_2\":0,\"chin_3\":0,\"ears_2\":-1,\"blemishes_1\":1,\"blush_2\":3,\"bodyb_2\":0,\"neck_thickness\":10,\"torso_2\":1,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":5,\"cheeks_1\":10,\"moles_2\":7.0,\"glasses_1\":35,\"complexion_1\":5,\"bracelets_1\":1,\"lipstick_1\":-1,\"jaw_2\":-1,\"nose_2\":5,\"eyebrows_5\":6,\"beard_3\":0,\"hair_color_2\":0,\"bodyb_3\":-1,\"eyebrows_3\":41,\"tshirt_2\":0,\"watches_2\":-1,\"chin_1\":0,\"torso_1\":40,\"chest_3\":0,\"cheeks_2\":0,\"arms_2\":0,\"pants_2\":11,\"bodyb_1\":-1,\"moles_1\":6,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":-1,\"bags_2\":0,\"pants_1\":105,\"chain_2\":0,\"bags_1\":0,\"nose_6\":0,\"hair_color_1\":55,\"bracelets_2\":0,\"dad\":15,\"makeup_2\":0,\"helmet_2\":0,\"mask_1\":254,\"mom\":44,\"chin_4\":0,\"lip_thickness\":5,\"helmet_1\":8,\"sun_1\":1,\"glasses_2\":0,\"eye_squint\":5,\"eye_color\":0,\"makeup_3\":0,\"nose_3\":0,\"nose_5\":0,\"beard_1\":3,\"eyebrows_4\":0,\"beard_4\":0,\"hair_1\":111,\"bproof_1\":0,\"beard_2\":3,\"eyebrows_1\":2,\"age_1\":0,\"face_md_weight\":10,\"decals_1\":191,\"jaw_1\":10,\"sun_2\":1,\"nose_1\":5,\"tshirt_1\":158,\"shoes_2\":7,\"blush_3\":0,\"bodyb_4\":5,\"nose_4\":6,\"arms\":6,\"blush_1\":-1,\"shoes_1\":20,\"chain_1\":25,\"eyebrows_2\":4,\"lipstick_2\":10.0,\"bproof_2\":0,\"blemishes_2\":1,\"chest_2\":0,\"age_2\":10.0,\"makeup_4\":10,\"eyebrows_6\":0,\"skin_md_weight\":3,\"watches_1\":11,\"chest_1\":0,\"lipstick_3\":37,\"sex\":0}},{\"name\":\"Securité\",\"grades\":[],\"grade\":false,\"data\":{\"complexion_2\":1,\"lipstick_4\":0,\"chin_4\":0,\"chin_3\":0,\"ears_2\":-1,\"mom\":44,\"blush_2\":3,\"bodyb_2\":0,\"neck_thickness\":10,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":5,\"cheeks_1\":10,\"moles_2\":7.0,\"glasses_1\":47,\"complexion_1\":5,\"bracelets_1\":1,\"lipstick_1\":-1,\"jaw_2\":-1,\"nose_2\":5,\"eyebrows_5\":6,\"beard_3\":0,\"mask_2\":0,\"bodyb_3\":-1,\"hair_color_1\":55,\"lipstick_2\":10.0,\"watches_2\":-1,\"chin_1\":0,\"hair_1\":104,\"chest_3\":0,\"makeup_4\":10,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":6,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":-1,\"bags_2\":0,\"cheeks_2\":0,\"helmet_2\":-1,\"bags_1\":138,\"nose_6\":0,\"dad\":15,\"bracelets_2\":0,\"mask_1\":254,\"makeup_2\":0,\"blemishes_1\":1,\"torso_1\":835,\"eyebrows_2\":4,\"helmet_1\":0,\"lip_thickness\":5,\"hair_color_2\":0,\"eyebrows_3\":41,\"glasses_2\":0,\"eye_squint\":5,\"nose_5\":0,\"makeup_3\":0,\"nose_3\":0,\"eyebrows_4\":0,\"beard_1\":3,\"bodyb_4\":5,\"beard_4\":0,\"decals_1\":0,\"bproof_1\":66,\"beard_2\":3,\"eyebrows_1\":2,\"age_1\":0,\"eye_color\":0,\"shoes_2\":0,\"jaw_1\":10,\"sun_2\":1,\"nose_1\":5,\"tshirt_1\":266,\"pants_1\":304,\"blush_3\":0,\"eyebrows_6\":0,\"nose_4\":6,\"arms\":96,\"blush_1\":-1,\"shoes_1\":259,\"chain_1\":368,\"tshirt_2\":0,\"sun_1\":1,\"bproof_2\":0,\"blemishes_2\":1,\"chest_2\":0,\"age_2\":10.0,\"skin_md_weight\":3,\"face_md_weight\":10,\"chain_2\":0,\"watches_1\":11,\"chest_1\":0,\"lipstick_3\":37,\"sex\":0}},{\"name\":\"Chef de Sécurité\",\"grades\":{\"chefsecu\":\"chefsecu\"},\"grade\":true,\"data\":{\"complexion_2\":1,\"lipstick_4\":0,\"chin_4\":0,\"chin_3\":0,\"ears_2\":-1,\"mom\":44,\"blush_2\":3,\"bodyb_2\":0,\"neck_thickness\":10,\"torso_2\":3,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":5,\"cheeks_1\":10,\"moles_2\":7.0,\"glasses_1\":47,\"complexion_1\":5,\"bracelets_1\":1,\"lipstick_1\":-1,\"jaw_2\":-1,\"nose_2\":5,\"eyebrows_5\":6,\"beard_3\":0,\"mask_2\":0,\"bodyb_3\":-1,\"hair_color_1\":55,\"lipstick_2\":10.0,\"watches_2\":-1,\"chin_1\":0,\"hair_1\":104,\"chest_3\":0,\"makeup_4\":10,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":6,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":-1,\"bags_2\":0,\"cheeks_2\":0,\"helmet_2\":-1,\"bags_1\":138,\"nose_6\":0,\"dad\":15,\"bracelets_2\":0,\"mask_1\":254,\"makeup_2\":0,\"blemishes_1\":1,\"torso_1\":835,\"eyebrows_2\":4,\"helmet_1\":0,\"lip_thickness\":5,\"hair_color_2\":0,\"eyebrows_3\":41,\"glasses_2\":0,\"eye_squint\":5,\"nose_5\":0,\"makeup_3\":0,\"nose_3\":0,\"eyebrows_4\":0,\"beard_1\":3,\"bodyb_4\":5,\"beard_4\":0,\"decals_1\":0,\"bproof_1\":66,\"beard_2\":3,\"eyebrows_1\":2,\"age_1\":0,\"eye_color\":0,\"shoes_2\":0,\"jaw_1\":10,\"sun_2\":1,\"nose_1\":5,\"tshirt_1\":266,\"pants_1\":304,\"blush_3\":0,\"eyebrows_6\":0,\"nose_4\":6,\"arms\":96,\"blush_1\":-1,\"shoes_1\":259,\"chain_1\":368,\"tshirt_2\":0,\"sun_1\":1,\"bproof_2\":1,\"blemishes_2\":1,\"chest_2\":0,\"age_2\":10.0,\"skin_md_weight\":3,\"face_md_weight\":10,\"chain_2\":0,\"watches_1\":11,\"chest_1\":0,\"lipstick_3\":37,\"sex\":0}},{\"name\":\"Juge\",\"grades\":{\"Premier Ministre\":\"Premier Ministre\",\"juge\":\"juge\",\"procureur\":\"procureur\"},\"grade\":true,\"data\":{\"complexion_2\":1,\"lipstick_4\":0,\"mask_2\":0,\"chin_3\":0,\"ears_2\":0,\"blemishes_1\":1,\"blush_2\":3,\"bodyb_2\":0,\"neck_thickness\":10,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":5,\"cheeks_1\":10,\"moles_2\":7.0,\"glasses_1\":34,\"complexion_1\":5,\"bracelets_1\":1,\"lipstick_1\":-1,\"jaw_2\":-1,\"nose_2\":5,\"eyebrows_5\":6,\"beard_3\":0,\"glasses_2\":0,\"bodyb_3\":-1,\"mask_1\":254,\"tshirt_2\":0,\"watches_2\":-1,\"chin_1\":0,\"cheeks_2\":0,\"chest_3\":0,\"pants_1\":118,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":6,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":223,\"bags_2\":0,\"helmet_2\":0,\"torso_1\":817,\"bags_1\":0,\"nose_6\":0,\"dad\":15,\"bracelets_2\":0,\"hair_1\":104,\"makeup_2\":0,\"nose_5\":0,\"chin_4\":0,\"eyebrows_3\":41,\"helmet_1\":8,\"lip_thickness\":5,\"sun_1\":1,\"hair_color_2\":0,\"face_md_weight\":10,\"eye_squint\":5,\"chain_2\":0,\"makeup_3\":0,\"nose_3\":0,\"eyebrows_4\":0,\"beard_1\":3,\"mom\":44,\"beard_4\":0,\"eyebrows_6\":0,\"bproof_1\":0,\"beard_2\":3,\"eyebrows_1\":2,\"age_1\":0,\"decals_1\":0,\"eye_color\":0,\"jaw_1\":10,\"sun_2\":1,\"nose_1\":5,\"tshirt_1\":311,\"shoes_2\":3,\"blush_3\":0,\"bodyb_4\":5,\"nose_4\":6,\"arms\":4,\"blush_1\":-1,\"shoes_1\":20,\"chain_1\":26,\"makeup_4\":10,\"lipstick_2\":10.0,\"bproof_2\":0,\"blemishes_2\":1,\"chest_2\":0,\"age_2\":10.0,\"hair_color_1\":55,\"skin_md_weight\":3,\"eyebrows_2\":4,\"watches_1\":11,\"chest_1\":0,\"lipstick_3\":37,\"sex\":0}},{\"name\":\"Secrétaire de Défense\",\"grades\":{\"Secretaire Défense\":\"Secretaire Défense\",\"boss\":\"boss\",\"Vice Gouverneur\":\"Vice Gouverneur\"},\"grade\":true,\"data\":{\"complexion_2\":1,\"lipstick_4\":0,\"mask_2\":0,\"chin_3\":0,\"ears_2\":0,\"mom\":44,\"blush_2\":3,\"bodyb_2\":0,\"neck_thickness\":10,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":5,\"cheeks_1\":10,\"moles_2\":7.0,\"glasses_1\":47,\"complexion_1\":5,\"bracelets_1\":1,\"lipstick_1\":-1,\"jaw_2\":-1,\"nose_2\":5,\"eyebrows_5\":6,\"beard_3\":0,\"pants_1\":315,\"bodyb_3\":-1,\"shoes_2\":1,\"lipstick_2\":10.0,\"watches_2\":-1,\"chin_1\":0,\"torso_1\":838,\"chest_3\":0,\"hair_color_1\":55,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":6,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":223,\"bags_2\":0,\"helmet_2\":-1,\"mask_1\":254,\"bags_1\":138,\"nose_6\":0,\"dad\":15,\"bracelets_2\":0,\"tshirt_2\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"eyebrows_3\":41,\"makeup_4\":10,\"helmet_1\":8,\"lip_thickness\":5,\"chin_4\":0,\"hair_color_2\":0,\"glasses_2\":0,\"eye_squint\":5,\"sun_1\":1,\"makeup_3\":0,\"nose_3\":0,\"blemishes_1\":1,\"beard_1\":3,\"hair_1\":104,\"beard_4\":0,\"bodyb_4\":5,\"bproof_1\":73,\"beard_2\":3,\"eyebrows_1\":2,\"age_1\":0,\"decals_1\":165,\"eye_color\":0,\"jaw_1\":10,\"sun_2\":1,\"nose_1\":5,\"tshirt_1\":292,\"nose_5\":0,\"blush_3\":0,\"eyebrows_6\":0,\"nose_4\":6,\"arms\":180,\"blush_1\":-1,\"shoes_1\":61,\"chain_1\":368,\"eyebrows_2\":4,\"cheeks_2\":0,\"bproof_2\":0,\"blemishes_2\":1,\"chest_2\":0,\"age_2\":10.0,\"skin_md_weight\":3,\"face_md_weight\":10,\"chain_2\":0,\"watches_1\":11,\"chest_1\":0,\"lipstick_3\":37,\"sex\":0}},{\"name\":\"Gouverneur 1\",\"grades\":{\"boss\":\"boss\",\"Vice Gouverneur\":\"Vice Gouverneur\"},\"grade\":true,\"data\":{\"complexion_2\":0,\"lipstick_4\":0,\"chin_4\":0,\"chin_3\":0,\"ears_2\":0,\"blemishes_1\":0,\"blush_2\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"moles_2\":0,\"glasses_1\":5,\"complexion_1\":0,\"bracelets_1\":-1,\"lipstick_1\":0,\"jaw_2\":0,\"nose_2\":0,\"eyebrows_5\":0,\"beard_3\":29,\"hair_1\":91,\"bodyb_3\":-1,\"mask_2\":0,\"watches_2\":0,\"dad\":24,\"chin_1\":0,\"cheeks_2\":0,\"chest_3\":0,\"makeup_4\":0,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":0,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":0,\"bags_2\":0,\"sun_1\":0,\"torso_1\":4,\"bags_1\":0,\"nose_6\":0,\"eyebrows_6\":0,\"bracelets_2\":0,\"mask_1\":0,\"makeup_2\":0,\"glasses_2\":0,\"mom\":2,\"helmet_1\":-1,\"hair_color_2\":29,\"lip_thickness\":0,\"hair_color_1\":29,\"eyebrows_2\":10,\"skin_md_weight\":50,\"eye_squint\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"nose_3\":0,\"face_md_weight\":50,\"beard_1\":10,\"bodyb_4\":0,\"beard_4\":0,\"decals_1\":0,\"bproof_1\":0,\"beard_2\":10,\"eyebrows_1\":0,\"age_1\":0,\"eye_color\":0,\"helmet_2\":0,\"jaw_1\":0,\"sun_2\":0,\"nose_1\":0,\"tshirt_1\":146,\"pants_1\":24,\"blush_3\":0,\"tshirt_2\":0,\"nose_4\":0,\"arms\":4,\"blush_1\":0,\"shoes_1\":104,\"chain_1\":333,\"eyebrows_3\":0,\"lipstick_2\":0,\"bproof_2\":0,\"blemishes_2\":0,\"chest_2\":0,\"age_2\":0,\"shoes_2\":0,\"chain_2\":0,\"nose_5\":0,\"watches_1\":-1,\"chest_1\":0,\"lipstick_3\":0,\"sex\":0}},{\"name\":\"gouverneur 2\",\"grades\":{\"boss\":\"boss\",\"Vice Gouverneur\":\"Vice Gouverneur\"},\"grade\":true,\"data\":{\"complexion_2\":0,\"lipstick_4\":0,\"chin_4\":0,\"chin_3\":0,\"ears_2\":-1,\"blemishes_1\":0,\"blush_2\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"torso_2\":4,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"moles_2\":0,\"glasses_1\":5,\"complexion_1\":0,\"bracelets_1\":-1,\"lipstick_1\":0,\"jaw_2\":0,\"nose_2\":0,\"eyebrows_5\":0,\"beard_3\":29,\"hair_1\":91,\"bodyb_3\":-1,\"mask_2\":0,\"watches_2\":0,\"dad\":24,\"chin_1\":0,\"cheeks_2\":0,\"chest_3\":0,\"makeup_4\":0,\"arms_2\":0,\"pants_2\":5,\"bodyb_1\":-1,\"moles_1\":0,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":-1,\"bags_2\":0,\"sun_1\":0,\"torso_1\":120,\"bags_1\":0,\"nose_6\":0,\"eyebrows_6\":0,\"bracelets_2\":0,\"mask_1\":0,\"makeup_2\":0,\"glasses_2\":0,\"mom\":2,\"helmet_1\":8,\"hair_color_2\":29,\"lip_thickness\":0,\"hair_color_1\":29,\"eyebrows_2\":10,\"skin_md_weight\":50,\"eye_squint\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"nose_3\":0,\"face_md_weight\":50,\"beard_1\":10,\"bodyb_4\":0,\"beard_4\":0,\"decals_1\":0,\"bproof_1\":0,\"beard_2\":10,\"eyebrows_1\":0,\"age_1\":0,\"eye_color\":0,\"helmet_2\":0,\"jaw_1\":0,\"sun_2\":0,\"nose_1\":0,\"tshirt_1\":157,\"pants_1\":24,\"blush_3\":0,\"tshirt_2\":0,\"nose_4\":0,\"arms\":1,\"blush_1\":0,\"shoes_1\":104,\"chain_1\":29,\"eyebrows_3\":0,\"lipstick_2\":0,\"bproof_2\":0,\"blemishes_2\":0,\"chest_2\":0,\"age_2\":0,\"shoes_2\":3,\"chain_2\":0,\"nose_5\":0,\"watches_1\":-1,\"chest_1\":0,\"lipstick_3\":0,\"sex\":0}},{\"name\":\"gouverneur 3\",\"grades\":{\"boss\":\"boss\",\"Vice Gouverneur\":\"Vice Gouverneur\"},\"grade\":true,\"data\":{\"complexion_2\":0,\"lipstick_4\":0,\"chin_4\":0,\"chin_3\":0,\"ears_2\":-1,\"blemishes_1\":0,\"blush_2\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"torso_2\":4,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"moles_2\":0,\"glasses_1\":5,\"complexion_1\":0,\"bracelets_1\":-1,\"lipstick_1\":0,\"jaw_2\":0,\"nose_2\":0,\"eyebrows_5\":0,\"beard_3\":29,\"hair_1\":91,\"bodyb_3\":-1,\"mask_2\":0,\"watches_2\":0,\"dad\":24,\"chin_1\":0,\"cheeks_2\":0,\"chest_3\":0,\"makeup_4\":0,\"arms_2\":0,\"pants_2\":5,\"bodyb_1\":-1,\"moles_1\":0,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":-1,\"bags_2\":0,\"sun_1\":0,\"torso_1\":120,\"bags_1\":0,\"nose_6\":0,\"eyebrows_6\":0,\"bracelets_2\":0,\"mask_1\":0,\"makeup_2\":0,\"glasses_2\":0,\"mom\":2,\"helmet_1\":8,\"hair_color_2\":29,\"lip_thickness\":0,\"hair_color_1\":29,\"eyebrows_2\":10,\"skin_md_weight\":50,\"eye_squint\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"nose_3\":0,\"face_md_weight\":50,\"beard_1\":10,\"bodyb_4\":0,\"beard_4\":0,\"decals_1\":0,\"bproof_1\":0,\"beard_2\":10,\"eyebrows_1\":0,\"age_1\":0,\"eye_color\":0,\"helmet_2\":0,\"jaw_1\":0,\"sun_2\":0,\"nose_1\":0,\"tshirt_1\":157,\"pants_1\":24,\"blush_3\":0,\"tshirt_2\":0,\"nose_4\":0,\"arms\":1,\"blush_1\":0,\"shoes_1\":104,\"chain_1\":29,\"eyebrows_3\":0,\"lipstick_2\":0,\"bproof_2\":0,\"blemishes_2\":0,\"chest_2\":0,\"age_2\":0,\"shoes_2\":3,\"chain_2\":0,\"nose_5\":0,\"watches_1\":-1,\"chest_1\":0,\"lipstick_3\":0,\"sex\":0}},{\"name\":\"Avocat\",\"grades\":{\"Avocat\":\"Avocat\"},\"grade\":true,\"data\":{\"complexion_2\":0,\"lipstick_4\":0,\"mask_2\":0,\"chin_3\":0,\"ears_2\":0,\"mom\":2,\"blush_2\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"eyebrows_3\":0,\"glasses_1\":5,\"complexion_1\":0,\"bracelets_1\":-1,\"lipstick_1\":0,\"jaw_2\":0,\"nose_2\":0,\"eyebrows_5\":0,\"beard_3\":29,\"eyebrows_2\":10,\"bodyb_3\":-1,\"hair_1\":91,\"torso_1\":295,\"watches_2\":0,\"chin_1\":0,\"cheeks_2\":0,\"chest_3\":0,\"makeup_4\":0,\"arms_2\":0,\"pants_2\":0,\"bodyb_1\":-1,\"moles_1\":0,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":0,\"bags_2\":0,\"glasses_2\":0,\"pants_1\":28,\"bags_1\":0,\"nose_6\":0,\"dad\":24,\"bracelets_2\":0,\"sun_1\":0,\"makeup_2\":0,\"mask_1\":0,\"shoes_2\":3,\"bodyb_4\":0,\"helmet_1\":-1,\"lip_thickness\":0,\"tshirt_2\":0,\"face_md_weight\":50,\"skin_md_weight\":50,\"eye_squint\":0,\"hair_color_2\":29,\"makeup_3\":0,\"nose_3\":0,\"eyebrows_4\":0,\"beard_1\":10,\"blemishes_1\":0,\"beard_4\":0,\"helmet_2\":0,\"bproof_1\":0,\"beard_2\":10,\"eyebrows_1\":0,\"age_1\":0,\"eye_color\":0,\"nose_5\":0,\"jaw_1\":0,\"sun_2\":0,\"nose_1\":0,\"tshirt_1\":35,\"decals_1\":0,\"blush_3\":0,\"eyebrows_6\":0,\"nose_4\":0,\"arms\":12,\"blush_1\":0,\"shoes_1\":104,\"chain_1\":343,\"chin_4\":0,\"lipstick_2\":0,\"bproof_2\":0,\"blemishes_2\":0,\"chest_2\":0,\"age_2\":0,\"moles_2\":0,\"hair_color_1\":29,\"chain_2\":0,\"watches_1\":-1,\"chest_1\":0,\"lipstick_3\":0,\"sex\":0}},{\"grades\":{\"chefsecu\":\"chefsecu\",\"garde\":\"garde\"},\"name\":\"sécurité\",\"grade\":true,\"data\":{\"complexion_2\":0,\"lipstick_4\":0,\"mask_2\":0,\"chin_3\":0,\"hair_1\":0,\"mom\":2,\"blush_2\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"torso_2\":0,\"hair_2\":0,\"decals_2\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"eyebrows_3\":0,\"glasses_1\":5,\"complexion_1\":0,\"bracelets_1\":-1,\"lipstick_1\":0,\"eyebrows_4\":0,\"nose_2\":0,\"eyebrows_5\":0,\"beard_3\":29,\"bproof_1\":0,\"skin_md_weight\":50,\"chain_2\":0,\"eyebrows_6\":0,\"bodyb_4\":0,\"chin_1\":0,\"bodyb_1\":-1,\"eye_color\":0,\"face_md_weight\":50,\"lipstick_2\":0,\"pants_2\":0,\"torso_1\":295,\"moles_1\":0,\"makeup_1\":0,\"chin_2\":0,\"ears_1\":0,\"bags_2\":0,\"sun_1\":0,\"eyebrows_2\":10,\"bags_1\":0,\"nose_6\":0,\"nose_5\":0,\"bracelets_2\":0,\"tshirt_1\":35,\"makeup_2\":0,\"jaw_2\":0,\"mask_1\":0,\"hair_color_2\":29,\"watches_1\":-1,\"lip_thickness\":0,\"moles_2\":0,\"helmet_1\":-1,\"glasses_2\":0,\"eye_squint\":0,\"chin_4\":0,\"makeup_3\":0,\"nose_3\":0,\"arms_2\":0,\"beard_1\":10,\"shoes_2\":3,\"beard_4\":0,\"watches_2\":0,\"makeup_4\":0,\"beard_2\":10,\"eyebrows_1\":0,\"age_1\":0,\"dad\":24,\"chest_3\":0,\"jaw_1\":0,\"sun_2\":0,\"nose_1\":0,\"pants_1\":28,\"decals_1\":0,\"blush_3\":0,\"tshirt_2\":0,\"nose_4\":0,\"arms\":12,\"blush_1\":0,\"shoes_1\":104,\"chain_1\":343,\"hair_color_1\":29,\"cheeks_2\":0,\"bproof_2\":0,\"blemishes_2\":0,\"chest_2\":0,\"age_2\":0,\"blemishes_1\":0,\"ears_2\":0,\"bodyb_3\":-1,\"helmet_2\":0,\"chest_1\":0,\"lipstick_3\":0,\"sex\":0}}]', '{\"x\":-541.8010864257813,\"y\":-192.7122039794922,\"z\":47.42303466796875}');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(35, 'le_ferailleur', 'Roger Salvage et Scrap', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"weapons_chest\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Armes du coffre\",\"grades\":{\"boss\":true}},\"remove_item_chest_society\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"grades\":{\"boss\":true}},\"unmote_player\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Descendre un employé\",\"grades\":{\"boss\":true}},\"deposit_black_money_coffre\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true}},\"deposit_money_society\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true}},\"items_chest\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":true,\"label\":\"Items du coffre\",\"grades\":{\"boss\":true}},\"manage_grades\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Gérer les grades de la société\",\"grades\":{\"boss\":true}},\"remove_item_chest\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Retirer un item dans le coffre\",\"grades\":{\"boss\":true}},\"deposit_weapon_chest\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Déposer une arme dans le coffre\",\"grades\":{\"boss\":true}},\"withdraw_money_society\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"grades\":{\"boss\":true}},\"rename_grade\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Changer le nom d\'un grade\",\"grades\":{\"boss\":true}},\"remove_weapon_chest\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Retirer une arme dans le coffre\",\"grades\":{\"boss\":true}},\"change_number_grade\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Changer le numéro d\'un grade\",\"grades\":{\"boss\":true}},\"remove_weapon_chest_society\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"grades\":{\"boss\":true}},\"deposit_cash_coffre\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Déposer de l\'argent dans le coffre\",\"grades\":{\"boss\":true}},\"dposit_item_chest_society\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Déposer un item dans le coffre de la société\",\"grades\":{\"boss\":true}},\"promote_player\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Augmenter un employé\",\"grades\":{\"boss\":true}},\"change_permissions_grade\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Changer les permissions d\'un grade\",\"grades\":{\"boss\":true}},\"open_coffre\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":true,\"label\":\"Ouvrir le coffre\",\"grades\":{\"boss\":true}},\"create_grade\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Créer un grade\",\"grades\":{\"boss\":true}},\"manage_employeds\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Gérer les employés de la société\",\"grades\":{\"boss\":true}},\"open_boss\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Ouvrir le menu boss\",\"grades\":{\"boss\":true}},\"items_chest:society\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Item(s) du coffre de la société\",\"grades\":{\"boss\":true}},\"weapons_chest_society\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Arme(s) du coffre de la société\",\"grades\":{\"boss\":true}},\"withdraw_black_money_coffre\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"grades\":{\"boss\":true}},\"deposit_weapon_chest_society\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Déposer une arme dans le coffre de la société\",\"grades\":{\"boss\":true}},\"change_salary_grade\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Changer le salaire d\'un grade\",\"grades\":{\"boss\":true}},\"delete_grade\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Supprimer un grade\",\"grades\":{\"boss\":true}},\"demote_player\":{\"Co -patron\":false,\"boss\":true,\"Ramasseur\":false,\"label\":\"Virer un employé\",\"grades\":{\"boss\":true}},\"chest\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Accéder au coffre de la société\",\"grades\":{\"boss\":true}},\"deposit_item_chest\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":true,\"label\":\"Déposer un item dans le coffre\",\"grades\":{\"boss\":true}},\"editClothes\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Gérer les tenues dans le vestiaire\",\"grades\":{\"boss\":true}},\"recruit_player\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Recruté un joueur\",\"grades\":{\"boss\":true}},\"withdraw_cash_coffre\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"grades\":{\"boss\":true}},\"rename_label_grade\":{\"Co -patron\":true,\"boss\":true,\"Ramasseur\":false,\"label\":\"Changer le label d\'un grade\",\"grades\":{\"boss\":true}}}', '{\"y\":-1617.8726806640626,\"x\":-621.104248046875,\"z\":33.01055145263672}', '{\"y\":-1623.073974609375,\"x\":-617.3504028320313,\"z\":33.01055145263672}', '{\"sprite\":67,\"color\":0,\"position\":{\"y\":-1629.8315429688,\"x\":-617.04089355469,\"z\":33.010578155518},\"active\":true}', '1', 1, '[{\"data\":{\"cheeks_1\":0,\"eyebrows_4\":0,\"tshirt_1\":-1,\"lipstick_1\":0,\"hair_color_2\":15,\"skin_md_weight\":50,\"arms\":30,\"pants_1\":321,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"ears_1\":-1,\"hair_2\":0,\"complexion_1\":0,\"bags_2\":0,\"makeup_2\":0,\"makeup_4\":0,\"sun_2\":0,\"eyebrows_2\":10,\"complexion_2\":0,\"dad\":0,\"makeup_3\":0,\"blush_3\":0,\"bodyb_4\":0,\"cheeks_3\":0,\"lipstick_3\":0,\"eye_color\":0,\"blush_2\":0,\"bodyb_3\":-1,\"nose_4\":0,\"chains_2\":0,\"beard_3\":29,\"eyebrows_6\":0,\"mask_1\":0,\"beard_2\":9,\"age_1\":0,\"eyebrows_1\":22,\"moles_1\":0,\"torso_2\":2,\"beard_4\":0,\"hair_color_1\":29,\"chin_3\":0,\"decals_2\":0,\"glasses_1\":50,\"shoes_2\":9,\"neck_thickness\":0,\"glasses_2\":0,\"chest_2\":0,\"lip_thickness\":0,\"hair_1\":11,\"bproof_1\":0,\"torso_1\":0,\"bracelets_2\":0,\"chain_2\":1,\"pants_2\":0,\"helmet_1\":175,\"eyebrows_5\":0,\"nose_6\":0,\"watches_2\":0,\"arms_2\":0,\"blemishes_1\":0,\"mom\":38,\"shoes_1\":196,\"chest_1\":0,\"blemishes_2\":0,\"decals_1\":0,\"chains_1\":0,\"blush_1\":0,\"eye_squint\":0,\"arms_1\":30,\"nose_3\":0,\"chain_1\":248,\"bags_1\":82,\"bracelets_1\":-1,\"watches_1\":30,\"jaw_1\":0,\"sex\":0,\"makeup_1\":0,\"mask_2\":0,\"chin_4\":0,\"nose_1\":0,\"ears_2\":0,\"age_2\":0,\"chest_3\":0,\"jaw_2\":0,\"sun_1\":0,\"eyebrows_3\":29,\"beard_1\":10,\"helmet_2\":0,\"chin_2\":0,\"face_md_weight\":50,\"tshirt_2\":-1,\"cheeks_2\":0,\"lipstick_4\":0,\"moles_2\":0,\"nose_2\":0,\"bodyb_1\":-1,\"bodyb_2\":0,\"chin_1\":0},\"grades\":{\"Co -patron\":\"Co -patron\"},\"grade\":true,\"name\":\"co-Patron\"},{\"data\":{\"cheeks_1\":0,\"eyebrows_4\":0,\"tshirt_1\":15,\"lipstick_1\":0,\"hair_color_2\":15,\"skin_md_weight\":50,\"arms\":1,\"pants_1\":317,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"ears_1\":-1,\"hair_2\":0,\"complexion_1\":0,\"bags_2\":2,\"makeup_2\":0,\"makeup_4\":0,\"sun_2\":0,\"eyebrows_2\":10,\"complexion_2\":0,\"dad\":0,\"makeup_3\":0,\"blush_3\":0,\"bodyb_4\":0,\"cheeks_3\":0,\"lipstick_3\":0,\"eye_color\":0,\"blush_2\":0,\"bodyb_3\":-1,\"nose_4\":0,\"chains_2\":0,\"beard_3\":29,\"eyebrows_6\":0,\"mask_1\":0,\"beard_2\":9,\"age_1\":0,\"eyebrows_1\":22,\"moles_1\":0,\"torso_2\":1,\"beard_4\":0,\"hair_color_1\":29,\"chin_3\":0,\"decals_2\":0,\"glasses_1\":0,\"shoes_2\":0,\"neck_thickness\":0,\"glasses_2\":0,\"chest_2\":0,\"lip_thickness\":0,\"hair_1\":11,\"bproof_1\":0,\"torso_1\":792,\"bracelets_2\":0,\"chain_2\":0,\"pants_2\":0,\"helmet_1\":238,\"eyebrows_5\":0,\"nose_6\":0,\"watches_2\":0,\"arms_2\":0,\"blemishes_1\":0,\"mom\":38,\"shoes_1\":259,\"chest_1\":0,\"blemishes_2\":0,\"decals_1\":190,\"chains_1\":0,\"blush_1\":0,\"eye_squint\":0,\"arms_1\":205,\"nose_3\":0,\"chain_1\":0,\"bags_1\":82,\"bracelets_1\":-1,\"watches_1\":-1,\"jaw_1\":0,\"sex\":0,\"makeup_1\":0,\"mask_2\":0,\"chin_4\":0,\"nose_1\":0,\"ears_2\":0,\"age_2\":0,\"chest_3\":0,\"jaw_2\":0,\"sun_1\":0,\"eyebrows_3\":29,\"beard_1\":10,\"helmet_2\":0,\"chin_2\":0,\"face_md_weight\":50,\"tshirt_2\":0,\"cheeks_2\":0,\"lipstick_4\":0,\"moles_2\":0,\"nose_2\":0,\"bodyb_1\":-1,\"bodyb_2\":0,\"chin_1\":0},\"grades\":[],\"grade\":false,\"name\":\"unefined\"},{\"data\":{\"cheeks_1\":0,\"eyebrows_4\":0,\"tshirt_1\":15,\"lipstick_1\":0,\"hair_color_2\":15,\"skin_md_weight\":50,\"arms\":1,\"pants_1\":317,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"ears_1\":-1,\"hair_2\":0,\"complexion_1\":0,\"bags_2\":2,\"makeup_2\":0,\"makeup_4\":0,\"sun_2\":0,\"eyebrows_2\":10,\"complexion_2\":0,\"dad\":0,\"makeup_3\":0,\"blush_3\":0,\"bodyb_4\":0,\"cheeks_3\":0,\"lipstick_3\":0,\"eye_color\":0,\"blush_2\":0,\"bodyb_3\":-1,\"nose_4\":0,\"chains_2\":0,\"beard_3\":29,\"eyebrows_6\":0,\"mask_1\":0,\"beard_2\":9,\"age_1\":0,\"eyebrows_1\":22,\"moles_1\":0,\"torso_2\":1,\"beard_4\":0,\"hair_color_1\":29,\"chin_3\":0,\"decals_2\":0,\"glasses_1\":0,\"shoes_2\":0,\"neck_thickness\":0,\"glasses_2\":0,\"chest_2\":0,\"lip_thickness\":0,\"hair_1\":11,\"bproof_1\":0,\"torso_1\":792,\"bracelets_2\":0,\"chain_2\":0,\"pants_2\":0,\"helmet_1\":238,\"eyebrows_5\":0,\"nose_6\":0,\"watches_2\":0,\"arms_2\":0,\"blemishes_1\":0,\"mom\":38,\"shoes_1\":259,\"chest_1\":0,\"blemishes_2\":0,\"decals_1\":190,\"chains_1\":0,\"blush_1\":0,\"eye_squint\":0,\"arms_1\":205,\"nose_3\":0,\"chain_1\":0,\"bags_1\":82,\"bracelets_1\":-1,\"watches_1\":-1,\"jaw_1\":0,\"sex\":0,\"makeup_1\":0,\"mask_2\":0,\"chin_4\":0,\"nose_1\":0,\"ears_2\":0,\"age_2\":0,\"chest_3\":0,\"jaw_2\":0,\"sun_1\":0,\"eyebrows_3\":29,\"beard_1\":10,\"helmet_2\":0,\"chin_2\":0,\"face_md_weight\":50,\"tshirt_2\":0,\"cheeks_2\":0,\"lipstick_4\":0,\"moles_2\":0,\"nose_2\":0,\"bodyb_1\":-1,\"bodyb_2\":0,\"chin_1\":0},\"grades\":[],\"grade\":true,\"name\":\"unefined\"}]', '{\"y\":-1618.1151123046876,\"x\":-619.4880981445313,\"z\":33.01055145263672}'),
(37, 'lscustom', 'EAST Custom', '{\"items\":[],\"weapons\":[],\"accounts\":{\"black_money\":0,\"society\":49532.218695706346,\"cash\":0},\"items_boss\":[],\"weapons_boss\":[]}', '{\"change_salary_grade\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"editClothes\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"deposit_black_money_coffre\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"deposit_weapon_chest\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"deposit_cash_coffre\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"weapons_chest\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"remove_item_chest_society\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"open_boss\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"open_coffre\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"withdraw_money_society\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"items_chest\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"remove_weapon_chest_society\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"withdraw_cash_coffre\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"promote_player\":{\"chefequipe\":true,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"recruit_player\":{\"chefequipe\":[],\"mecano\":false,\"boss\":true,\"copatron\":[]},\"weapons_chest_society\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"change_permissions_grade\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"deposit_item_chest\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"manage_grades\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"items_chest:society\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"manage_employeds\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"chest\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"unmote_player\":{\"chefequipe\":true,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"change_number_grade\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"deposit_money_society\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"create_grade\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"delete_grade\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"rename_grade\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"remove_item_chest\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"withdraw_black_money_coffre\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"dposit_item_chest_society\":{\"chefequipe\":false,\"mecano\":true,\"boss\":true,\"copatron\":[]},\"demote_player\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"remove_weapon_chest\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"rename_label_grade\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]},\"deposit_weapon_chest_society\":{\"chefequipe\":false,\"mecano\":false,\"boss\":true,\"copatron\":[]}}', '{\"x\":898.8868408203125,\"y\":-2100.017333984375,\"z\":34.88855361938476}', '{\"x\":886.4063720703125,\"y\":-2101.04541015625,\"z\":34.88858795166015}', '{\"sprite\":446,\"active\":true,\"position\":{\"y\":-147.0532379150391,\"z\":39.00970840454101,\"x\":-330.6905822753906},\"color\":47}', '3', 1, '[{\"grades\":[],\"data\":{\"hair_1\":175,\"moles_2\":10.0,\"glasses_2\":2,\"complexion_2\":0,\"eyebrows_5\":0,\"beard_2\":20,\"nose_3\":0,\"jaw_1\":-1,\"chin_1\":-1,\"moles_1\":-1,\"skin_md_weight\":0.0,\"ears_1\":-1,\"eye_color\":8,\"bodyb_3\":-1,\"cheeks_3\":0,\"cheeks_1\":0,\"chest_2\":0,\"torso_2\":11,\"eyebrows_6\":0,\"tshirt_2\":0,\"lipstick_4\":0,\"bodyb_4\":0,\"chain_1\":-1,\"arms_2\":0,\"ears_2\":-1,\"mom\":0,\"shoes_1\":25,\"decals_2\":0,\"torso_1\":505,\"jaw_2\":-1,\"age_1\":0,\"bags_1\":44,\"tshirt_1\":15,\"sun_1\":0,\"pants_2\":2,\"chest_1\":0,\"nose_2\":0,\"complexion_1\":0,\"lipstick_1\":-1,\"hair_2\":0,\"shoes_2\":0,\"dad\":14,\"bproof_2\":0,\"face_md_weight\":0.0,\"age_2\":10.0,\"bodyb_1\":-1,\"helmet_2\":0,\"eye_squint\":0,\"mask_1\":0,\"helmet_1\":8,\"neck_thickness\":-1,\"makeup_1\":-1,\"makeup_4\":3.0,\"eyebrows_2\":10,\"pants_1\":98,\"nose_1\":0,\"hair_color_2\":0,\"bracelets_1\":0,\"nose_4\":0,\"mask_2\":0,\"decals_1\":0,\"nose_5\":0,\"chain_2\":0,\"blemishes_2\":0,\"lipstick_3\":0,\"glasses_1\":0,\"watches_1\":-1,\"eyebrows_3\":0,\"blush_2\":10.0,\"cheeks_2\":0,\"bags_2\":0,\"blush_1\":-1,\"eyebrows_1\":33,\"blemishes_1\":0,\"bracelets_2\":0,\"beard_3\":61,\"sex\":0,\"chest_3\":0,\"lip_thickness\":0.0,\"bproof_1\":0,\"sun_2\":0,\"nose_6\":0,\"beard_1\":16,\"lipstick_2\":10.0,\"hair_color_1\":61,\"bodyb_2\":0,\"chin_2\":0,\"blush_3\":0,\"beard_4\":0,\"chin_3\":0,\"watches_2\":-1,\"eyebrows_4\":0,\"chin_4\":0,\"arms\":0,\"makeup_3\":0,\"makeup_2\":10.0},\"grade\":false,\"name\":\"tenue de service\"}]', '{\"x\":883.1388549804688,\"y\":-2100.80908203125,\"z\":30.45944023132324}'),
(40, 'percio', 'Bar Perico', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"demote_player\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"chest\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true}}', '{\"y\":-4942.396484375,\"z\":3.38087058067321,\"x\":4903.65283203125}', '{\"y\":-4955.5009765625,\"z\":4.93026733398437,\"x\":4892.0478515625}', '{\"position\":{\"y\":-4918.95361328125,\"z\":3.36774158477783,\"x\":4896.77685546875},\"active\":false}', '1', 0, '[]', '\"none\"'),
(41, 'taxi', 'Taxi', '{\"weapons\":[],\"items\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"cash\":0,\"black_money\":0},\"items_boss\":[]}', '{\"recruit_player\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Recruté un joueur\",\"expérimenté\":false},\"rename_label_grade\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Changer le label d\'un grade\",\"expérimenté\":false},\"deposit_black_money_coffre\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"expérimenté\":false},\"withdraw_money_society\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"expérimenté\":false},\"withdraw_black_money_coffre\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"expérimenté\":false},\"deposit_money_society\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"expérimenté\":false},\"change_salary_grade\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Changer le salaire d\'un grade\",\"expérimenté\":false},\"remove_weapon_chest\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Retirer une arme dans le coffre\",\"expérimenté\":false},\"remove_item_chest_society\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"expérimenté\":false},\"editClothes\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Gérer les tenues dans le vestiaire\",\"expérimenté\":false},\"withdraw_cash_coffre\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"expérimenté\":false},\"unmote_player\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Descendre un employé\",\"expérimenté\":false},\"open_coffre\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Ouvrir le coffre\",\"expérimenté\":false},\"items_chest:society\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Item(s) du coffre de la société\",\"expérimenté\":false},\"remove_item_chest\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Retirer un item dans le coffre\",\"expérimenté\":false},\"items_chest\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Items du coffre\",\"expérimenté\":false},\"deposit_item_chest\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Déposer un item dans le coffre\",\"expérimenté\":false},\"change_permissions_grade\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Changer les permissions d\'un grade\",\"expérimenté\":false},\"manage_employeds\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Gérer les employés de la société\",\"expérimenté\":false},\"create_grade\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Créer un grade\",\"expérimenté\":false},\"deposit_weapon_chest\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Déposer une arme dans le coffre\",\"expérimenté\":false},\"weapons_chest\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Armes du coffre\",\"expérimenté\":false},\"rename_grade\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Changer le nom d\'un grade\",\"expérimenté\":false},\"chest\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Accéder au coffre de la société\",\"expérimenté\":false},\"promote_player\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Augmenter un employé\",\"expérimenté\":false},\"deposit_weapon_chest_society\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Déposer une arme dans le coffre de la société\",\"expérimenté\":false},\"weapons_chest_society\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Arme(s) du coffre de la société\",\"expérimenté\":false},\"demote_player\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Virer un employé\",\"expérimenté\":false},\"open_boss\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Ouvrir le menu boss\",\"expérimenté\":false},\"deposit_cash_coffre\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Déposer de l\'argent dans le coffre\",\"expérimenté\":false},\"manage_grades\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Gérer les grades de la société\",\"expérimenté\":false},\"dposit_item_chest_society\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Déposer un item dans le coffre de la société\",\"expérimenté\":false},\"change_number_grade\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Changer le numéro d\'un grade\",\"expérimenté\":false},\"delete_grade\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Supprimer un grade\",\"expérimenté\":false},\"remove_weapon_chest_society\":{\"boss\":true,\"manager\":false,\"grades\":{\"boss\":true},\"chauffeur\":false,\"stagiare\":false,\"chauffeur v.i.p\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"expérimenté\":false}}', '{\"x\":900.9324340820313,\"y\":-166.5725860595703,\"z\":74.2222671508789}', '{\"x\":898.317626953125,\"y\":-165.82579040527345,\"z\":74.22233581542969}', '{\"color\":5,\"position\":{\"y\":-162.7771148681641,\"z\":78.16291809082031,\"x\":904.8250122070313},\"sprite\":56,\"active\":true}', '3', 1, '[{\"grades\":{\"apprenti\":\"apprenti\",\"manager\":\"manager\",\"stagiare\":\"stagiare\",\"debutant\":\"debutant\",\"pratiquant\":\"pratiquant\",\"chauffeur\":\"chauffeur\",\"co-boss\":\"co-boss\",\"boss\":\"boss\"},\"name\":\"tenu taxi\",\"data\":{\"bproof_2\":0,\"bags_1\":0,\"skin_md_weight\":0.0,\"jaw_1\":0,\"lipstick_1\":-1,\"blush_3\":0,\"decals_2\":6,\"torso_2\":7,\"blemishes_1\":0,\"helmet_2\":0,\"decals_1\":0,\"chest_1\":0,\"pants_1\":37,\"arms_2\":0,\"shoes_2\":1,\"lipstick_2\":10.0,\"face_md_weight\":0.0,\"pants_2\":2,\"beard_1\":3,\"eyebrows_2\":10,\"dad\":29,\"ears_1\":-1,\"blush_1\":-1,\"moles_1\":-1,\"chin_1\":-1,\"sex\":0,\"hair_2\":0,\"beard_4\":0,\"eye_squint\":0,\"bproof_1\":95,\"sun_2\":0,\"eyebrows_3\":41,\"chain_2\":0,\"torso_1\":505,\"moles_2\":10.0,\"blush_2\":10.0,\"chin_4\":0,\"chain_1\":0,\"nose_6\":0,\"eye_color\":12,\"age_1\":0,\"bodyb_4\":0,\"neck_thickness\":-1,\"bodyb_1\":-1,\"age_2\":10.0,\"watches_1\":-1,\"beard_2\":20,\"helmet_1\":8,\"watches_2\":-1,\"glasses_2\":0,\"bracelets_1\":-1,\"mom\":0,\"eyebrows_1\":30,\"chest_3\":0,\"arms\":0,\"eyebrows_4\":0,\"nose_5\":0,\"sun_1\":0,\"jaw_2\":0,\"makeup_4\":3.0,\"makeup_1\":-1,\"cheeks_1\":1,\"blemishes_2\":0,\"cheeks_3\":0,\"mask_1\":0,\"tshirt_2\":0,\"nose_1\":0,\"hair_color_1\":0,\"makeup_2\":10.0,\"complexion_1\":0,\"eyebrows_6\":0,\"tshirt_1\":15,\"cheeks_2\":0,\"lipstick_4\":0,\"ears_2\":-1,\"bodyb_3\":-1,\"nose_2\":0,\"bodyb_2\":0,\"nose_3\":0,\"complexion_2\":0,\"lipstick_3\":0,\"shoes_1\":31,\"chin_3\":0,\"glasses_1\":0,\"hair_1\":221,\"chest_2\":0,\"makeup_3\":0,\"hair_color_2\":61,\"bags_2\":0,\"beard_3\":0,\"bracelets_2\":0,\"mask_2\":0,\"eyebrows_5\":0,\"chin_2\":0,\"nose_4\":2,\"lip_thickness\":0.0},\"grade\":true},{\"grades\":{\"boss\":\"boss\",\"co-boss\":\"co-boss\"},\"name\":\"tenu patron \",\"data\":{\"bproof_2\":0,\"bags_1\":0,\"skin_md_weight\":50,\"jaw_1\":3,\"lipstick_1\":0,\"blush_3\":0,\"decals_2\":0,\"torso_2\":0,\"lip_thickness\":0,\"helmet_2\":0,\"decals_1\":0,\"chest_1\":0,\"pants_1\":24,\"arms_2\":0,\"shoes_2\":0,\"lipstick_2\":0,\"hair_color_1\":0,\"pants_2\":5,\"beard_1\":19,\"eyebrows_2\":0,\"dad\":9,\"ears_1\":-1,\"blush_1\":0,\"helmet_1\":7,\"chin_1\":3,\"sex\":0,\"hair_2\":0,\"beard_4\":0,\"eye_squint\":0,\"bproof_1\":0,\"sun_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"torso_1\":321,\"mom\":4,\"blush_2\":0,\"chin_4\":6,\"chain_1\":362,\"nose_6\":0,\"eye_color\":0,\"age_1\":0,\"bodyb_4\":0,\"neck_thickness\":0,\"bodyb_1\":-1,\"age_2\":0,\"watches_1\":-1,\"beard_2\":10,\"ears_2\":0,\"eyebrows_1\":0,\"watches_2\":0,\"glasses_2\":0,\"bracelets_1\":-1,\"arms\":22,\"lipstick_4\":0,\"chest_3\":0,\"nose_5\":1,\"blemishes_1\":0,\"face_color\":2,\"makeup_1\":0,\"jaw_2\":3,\"makeup_4\":0,\"blemishes_2\":0,\"cheeks_1\":4,\"mask_1\":0,\"shoes_1\":10,\"cheeks_3\":4,\"tshirt_2\":0,\"nose_1\":2,\"lipstick_3\":0,\"makeup_2\":0,\"complexion_1\":0,\"eyebrows_6\":0,\"tshirt_1\":15,\"cheeks_2\":0,\"eyebrows_4\":0,\"bodyb_3\":-1,\"moles_1\":0,\"nose_2\":2,\"bodyb_2\":0,\"nose_3\":5,\"complexion_2\":0,\"sun_1\":1,\"eyebrows_5\":0,\"hair_1\":8,\"glasses_1\":5,\"hair_color_2\":0,\"chest_2\":0,\"makeup_3\":0,\"bags_2\":0,\"moles_2\":0,\"beard_3\":0,\"bracelets_2\":0,\"mask_2\":0,\"chin_3\":3,\"chin_2\":3,\"nose_4\":5,\"face_md_weight\":100},\"grade\":true}]', '{\"x\":900.0584716796875,\"y\":-149.68199157714845,\"z\":75.31824493408203}'),
(46, 'weazelnews', 'Weazle News', '{\"weapons_boss\":[],\"items\":[],\"weapons\":[],\"items_boss\":[],\"accounts\":{\"society\":15000,\"cash\":0,\"black_money\":0}}', '{\"deposit_weapon_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"chest\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"demote_player\":{\"boss\":true}}', '{\"z\":23.86964,\"y\":-923.107971,\"x\":-574.282227}', '{\"z\":28.157051,\"y\":-928.580811,\"x\":-583.081238}', '{\"sprite\":184,\"color\":9,\"position\":{\"z\":28.157051,\"y\":-928.580811,\"x\":-583.081238},\"active\":true}', '1', 1, '[]', '{\"x\":-588.1155395507813,\"y\":-927.4957885742188,\"z\":23.86913871765136}'),
(47, 'petitpecheur', 'Petit Pêcheur', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"change_number_grade\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"chest\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"weapons_chest\":{\"boss\":true}}', '{\"z\":5.00024080276489,\"y\":-2778.757568359375,\"x\":-316.8606872558594}', '{\"z\":5.00024032592773,\"y\":-2783.19775390625,\"x\":-315.61761474609377}', '{\"sprite\":455,\"active\":true,\"position\":{\"z\":5.00023221969604,\"y\":-2778.19970703125,\"x\":-313.3329162597656},\"color\":3}', '1', 1, '[]', '{\"z\":5.00023794174194,\"y\":-2784.130126953125,\"x\":-312.71258544921877}'),
(49, 'vigne', 'Vigneron', '{\"items\":[],\"weapons_boss\":[],\"accounts\":{\"cash\":0,\"black_money\":0,\"society\":15175},\"weapons\":[],\"items_boss\":[]}', '{\"chest\":{\"Employer\":false,\"label\":\"Accéder au coffre de la société\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"weapons_chest\":{\"Employer\":true,\"label\":\"Armes du coffre\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"rename_label_grade\":{\"Employer\":false,\"label\":\"Changer le label d\'un grade\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"recruit_player\":{\"Employer\":false,\"label\":\"Recruté un joueur\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"deposit_weapon_chest\":{\"Employer\":true,\"label\":\"Déposer une arme dans le coffre\",\"employed\":[],\"grades\":{\"boss\":true},\"boss\":true},\"weapons_chest_society\":{\"Employer\":false,\"label\":\"Arme(s) du coffre de la société\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"create_grade\":{\"Employer\":false,\"label\":\"Créer un grade\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"open_coffre\":{\"Employer\":true,\"label\":\"Ouvrir le coffre\",\"employed\":true,\"grades\":{\"boss\":true},\"boss\":true},\"deposit_cash_coffre\":{\"Employer\":true,\"label\":\"Déposer de l\'argent dans le coffre\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"change_permissions_grade\":{\"Employer\":false,\"label\":\"Changer les permissions d\'un grade\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"manage_grades\":{\"Employer\":false,\"label\":\"Gérer les grades de la société\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"deposit_weapon_chest_society\":{\"Employer\":false,\"label\":\"Déposer une arme dans le coffre de la société\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"withdraw_money_society\":{\"Employer\":false,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"change_number_grade\":{\"Employer\":false,\"label\":\"Changer le numéro d\'un grade\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"deposit_black_money_coffre\":{\"Employer\":true,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"manage_employeds\":{\"Employer\":false,\"label\":\"Gérer les employés de la société\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"remove_weapon_chest_society\":{\"Employer\":false,\"label\":\"Retirer une arme dans la coffre de la société\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"unmote_player\":{\"Employer\":false,\"label\":\"Descendre un employé\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"remove_weapon_chest\":{\"Employer\":false,\"label\":\"Retirer une arme dans le coffre\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"items_chest:society\":{\"Employer\":false,\"label\":\"Item(s) du coffre de la société\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"dposit_item_chest_society\":{\"Employer\":false,\"label\":\"Déposer un item dans le coffre de la société\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"withdraw_cash_coffre\":{\"Employer\":false,\"label\":\"Retirer de l\'argent dans le coffre\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"deposit_money_society\":{\"Employer\":false,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"employed\":[],\"grades\":{\"boss\":true},\"boss\":true},\"deposit_item_chest\":{\"Employer\":true,\"label\":\"Déposer un item dans le coffre\",\"employed\":[],\"grades\":{\"boss\":true},\"boss\":true},\"rename_grade\":{\"Employer\":false,\"label\":\"Changer le nom d\'un grade\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"remove_item_chest_society\":{\"Employer\":false,\"label\":\"Retirer un item dans le coffre de la société\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"delete_grade\":{\"Employer\":false,\"label\":\"Supprimer un grade\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"promote_player\":{\"Employer\":false,\"label\":\"Augmenter un employé\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"open_boss\":{\"Employer\":false,\"label\":\"Ouvrir le menu boss\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"demote_player\":{\"Employer\":false,\"label\":\"Virer un employé\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"change_salary_grade\":{\"Employer\":false,\"label\":\"Changer le salaire d\'un grade\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"editClothes\":{\"Employer\":false,\"label\":\"Gérer les tenues dans le vestiaire\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"withdraw_black_money_coffre\":{\"Employer\":false,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"items_chest\":{\"Employer\":true,\"label\":\"Items du coffre\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true},\"remove_item_chest\":{\"Employer\":true,\"label\":\"Retirer un item dans le coffre\",\"employed\":false,\"grades\":{\"boss\":true},\"boss\":true}}', '{\"x\":-1866.081787109375,\"y\":2065.661865234375,\"z\":141.00042724609376}', '{\"x\":-1898.0380859375,\"y\":2067.49462890625,\"z\":141.02066040039063}', '{\"color\":8,\"sprite\":85,\"position\":{\"z\":141.46322631835938,\"y\":2058.33056640625,\"x\":-1884.1417236328128},\"active\":true}', '0', 1, '[{\"grades\":{\"boss\":\"boss\",\"sous-boss\":\"sous-boss\"},\"name\":\"co patron\",\"data\":{\"hair_1\":124,\"lipstick_2\":0,\"jaw_2\":0,\"cheeks_1\":0,\"tshirt_2\":0,\"torso_1\":349,\"eyebrows_1\":33,\"moles_2\":0,\"watches_2\":0,\"sex\":0,\"hair_2\":0,\"bodyb_4\":0,\"bracelets_2\":0,\"lipstick_4\":0,\"sun_1\":0,\"bodyb_3\":-1,\"beard_2\":10,\"torso_2\":0,\"blush_1\":0,\"hair_color_2\":1,\"lipstick_3\":0,\"mask_2\":26,\"ears_1\":3,\"bodyb_2\":0,\"chest_1\":0,\"nose_3\":0,\"lipstick_1\":0,\"dad\":24,\"nose_4\":2,\"chin_4\":0,\"chin_1\":0,\"moles_1\":0,\"makeup_4\":0,\"makeup_3\":0,\"mask_1\":111,\"bags_1\":0,\"pants_2\":0,\"makeup_2\":0,\"helmet_2\":0,\"glasses_2\":0,\"chin_2\":0,\"nose_5\":0,\"bags_2\":0,\"chest_3\":0,\"beard_4\":0,\"eyebrows_4\":0,\"bracelets_1\":-1,\"tshirt_1\":130,\"eyebrows_6\":0,\"pants_1\":23,\"arms\":178,\"mom\":25,\"hair_color_1\":0,\"complexion_1\":0,\"makeup_1\":0,\"skin_md_weight\":50,\"shoes_1\":137,\"chain_2\":0,\"face_md_weight\":50,\"watches_1\":2,\"complexion_2\":0,\"bproof_2\":0,\"chest_2\":0,\"nose_1\":0,\"glasses_1\":56,\"eyebrows_2\":10,\"eye_color\":0,\"ears_2\":0,\"bproof_1\":0,\"cheeks_3\":0,\"cheeks_2\":0,\"beard_3\":0,\"chin_3\":0,\"blemishes_2\":0,\"lip_thickness\":0,\"blemishes_1\":0,\"bodyb_1\":-1,\"eyebrows_3\":0,\"decals_1\":0,\"beard_1\":3,\"nose_2\":0,\"blush_2\":0,\"arms_2\":0,\"jaw_1\":0,\"shoes_2\":0,\"eyebrows_5\":0,\"blush_3\":0,\"age_2\":0,\"helmet_1\":190,\"sun_2\":0,\"neck_thickness\":0,\"chain_1\":0,\"decals_2\":0,\"eye_squint\":0,\"nose_6\":0,\"age_1\":0},\"grade\":true},{\"grades\":{\"boss\":\"boss\"},\"name\":\"patron\",\"data\":{\"nose_2\":0,\"lipstick_2\":0,\"jaw_2\":0,\"cheeks_1\":0,\"tshirt_2\":0,\"torso_1\":142,\"eyebrows_1\":30,\"moles_2\":0,\"watches_2\":0,\"shoes_2\":0,\"hair_2\":0,\"bodyb_4\":0,\"bracelets_2\":0,\"lipstick_4\":0,\"sun_1\":0,\"bodyb_3\":-1,\"beard_2\":10,\"torso_2\":0,\"blush_1\":0,\"hair_color_2\":0,\"lipstick_3\":0,\"mask_2\":0,\"ears_1\":-1,\"bodyb_2\":0,\"chest_1\":0,\"beard_4\":0,\"lipstick_1\":0,\"dad\":23,\"nose_4\":0,\"chin_4\":0,\"chin_1\":0,\"moles_1\":0,\"makeup_4\":0,\"makeup_3\":0,\"hair_1\":93,\"bags_1\":131,\"pants_2\":0,\"makeup_2\":0,\"helmet_2\":0,\"glasses_2\":0,\"chin_2\":0,\"nose_5\":0,\"chain_1\":20,\"chest_3\":0,\"bags_2\":0,\"nose_3\":0,\"arms\":0,\"tshirt_1\":4,\"eyebrows_6\":0,\"bracelets_1\":-1,\"eye_squint\":0,\"mom\":0,\"hair_color_1\":0,\"complexion_1\":0,\"pants_1\":10,\"skin_md_weight\":50,\"shoes_1\":10,\"chain_2\":0,\"decals_1\":0,\"watches_1\":0,\"complexion_2\":0,\"bproof_2\":0,\"chest_2\":0,\"nose_1\":0,\"glasses_1\":51,\"eyebrows_2\":10,\"eye_color\":0,\"makeup_1\":0,\"bproof_1\":0,\"cheeks_3\":0,\"mask_1\":0,\"beard_3\":0,\"chin_3\":0,\"arms_2\":0,\"lip_thickness\":0,\"blemishes_1\":0,\"bodyb_1\":-1,\"eyebrows_3\":0,\"face_md_weight\":50,\"beard_1\":3,\"jaw_1\":0,\"blush_2\":0,\"sex\":0,\"neck_thickness\":0,\"eyebrows_4\":0,\"eyebrows_5\":0,\"blush_3\":0,\"age_2\":0,\"helmet_1\":190,\"sun_2\":0,\"blemishes_2\":0,\"ears_2\":0,\"decals_2\":0,\"cheeks_2\":0,\"nose_6\":0,\"age_1\":0},\"grade\":true},{\"grades\":{\"Employer\":\"Employer\"},\"name\":\"Emploie\",\"data\":{\"nose_2\":0,\"lipstick_2\":0,\"jaw_2\":0,\"cheeks_1\":0,\"tshirt_2\":0,\"torso_1\":42,\"eyebrows_1\":30,\"moles_2\":0,\"watches_2\":0,\"sex\":0,\"hair_2\":0,\"bodyb_4\":0,\"bracelets_2\":0,\"lipstick_4\":0,\"sun_1\":0,\"bodyb_3\":-1,\"beard_2\":10,\"torso_2\":0,\"blush_1\":0,\"hair_color_2\":0,\"lipstick_3\":0,\"mask_2\":0,\"ears_1\":-1,\"bodyb_2\":0,\"chest_1\":0,\"beard_4\":0,\"lipstick_1\":0,\"dad\":23,\"nose_4\":0,\"chin_4\":0,\"chin_1\":0,\"moles_1\":0,\"makeup_4\":0,\"makeup_3\":0,\"chest_3\":0,\"bags_1\":9,\"pants_2\":1,\"makeup_2\":0,\"helmet_2\":2,\"glasses_2\":0,\"chin_2\":0,\"nose_5\":0,\"face_md_weight\":50,\"bags_2\":0,\"nose_3\":0,\"tshirt_1\":15,\"bracelets_1\":-1,\"neck_thickness\":0,\"eyebrows_6\":0,\"pants_1\":129,\"eyebrows_4\":0,\"mom\":0,\"hair_color_1\":0,\"complexion_1\":0,\"watches_1\":15,\"skin_md_weight\":50,\"shoes_1\":12,\"chain_2\":0,\"decals_1\":0,\"arms_2\":0,\"complexion_2\":0,\"bproof_2\":0,\"chest_2\":0,\"nose_1\":0,\"glasses_1\":6,\"eyebrows_2\":10,\"eye_color\":0,\"makeup_1\":0,\"bproof_1\":0,\"cheeks_3\":0,\"mask_1\":0,\"beard_3\":0,\"chin_3\":0,\"ears_2\":0,\"lip_thickness\":0,\"blemishes_1\":0,\"bodyb_1\":-1,\"eyebrows_3\":0,\"eye_squint\":0,\"beard_1\":3,\"hair_1\":93,\"blush_2\":0,\"jaw_1\":0,\"shoes_2\":6,\"arms\":11,\"eyebrows_5\":0,\"blush_3\":0,\"age_2\":0,\"helmet_1\":13,\"sun_2\":0,\"blemishes_2\":0,\"chain_1\":151,\"decals_2\":0,\"cheeks_2\":0,\"nose_6\":0,\"age_1\":0},\"grade\":true}]', '{\"x\":-1892.603271484375,\"y\":2060.3828125,\"z\":141.00575256347657}');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(50, 'tabac', 'Tabac', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"delete_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"withdraw_money_society\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"remove_weapon_chest_society\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"change_salary_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"deposit_weapon_chest\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"editClothes\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"items_chest:society\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"change_permissions_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"recruit_player\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"withdraw_cash_coffre\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"remove_item_chest_society\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"open_coffre\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"dposit_item_chest_society\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"weapons_chest_society\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"manage_grades\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"create_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"deposit_money_society\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"demote_player\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"deposit_cash_coffre\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"remove_item_chest\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"chest\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"items_chest\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"deposit_weapon_chest_society\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"remove_weapon_chest\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"weapons_chest\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"promote_player\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"change_number_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"manage_employeds\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"deposit_item_chest\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"open_boss\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"rename_label_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"rename_grade\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"deposit_black_money_coffre\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"unmote_player\":{\"boss\":true,\"sous-boss\":false,\"employed\":false},\"withdraw_black_money_coffre\":{\"boss\":true,\"sous-boss\":false,\"employed\":false}}', '{\"z\":50.30839920043945,\"x\":2889.119384765625,\"y\":4397.13134765625}', '{\"z\":50.3368911743164,\"x\":2890.314208984375,\"y\":4391.7001953125}', '{\"color\":64,\"active\":true,\"position\":{\"z\":50.3368911743164,\"x\":2890.314208984375,\"y\":4391.7001953125},\"sprite\":208}', '1', 1, '[{\"grades\":{\"employed\":\"employed\"},\"grade\":true,\"data\":{\"chain_2\":0,\"hair_color_2\":0,\"face_md_weight\":49,\"mom\":2,\"mask_2\":0,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"tshirt_1\":59,\"chin_4\":0,\"hair_1\":133,\"shoes_1\":12,\"arms\":0,\"blush_1\":0,\"chin_2\":0,\"bodyb_4\":0,\"decals_1\":0,\"helmet_2\":0,\"eye_color\":0,\"sex\":0,\"bracelets_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"eye_squint\":0,\"eyebrows_6\":0,\"bags_1\":0,\"eyebrows_2\":0,\"blemishes_2\":0,\"bracelets_1\":-1,\"chest_1\":0,\"eyebrows_1\":0,\"helmet_1\":-1,\"age_1\":0,\"jaw_2\":0,\"complexion_2\":0,\"bodyb_1\":-1,\"cheeks_2\":0,\"mask_1\":0,\"eyebrows_5\":0,\"sun_1\":0,\"eyebrows_3\":0,\"skin_md_weight\":49,\"nose_6\":0,\"torso_1\":751,\"cheeks_3\":0,\"bproof_1\":0,\"makeup_1\":0,\"lip_thickness\":0,\"nose_2\":0,\"dad\":9,\"lipstick_4\":0,\"moles_2\":0,\"nose_1\":0,\"beard_1\":10,\"hair_color_1\":55,\"makeup_3\":0,\"beard_2\":10,\"chin_1\":0,\"cheeks_1\":0,\"pants_1\":4,\"chain_1\":0,\"arms_2\":0,\"moles_1\":0,\"complexion_1\":0,\"glasses_2\":0,\"blemishes_1\":0,\"neck_thickness\":0,\"nose_4\":0,\"tshirt_2\":0,\"makeup_4\":0,\"bodyb_3\":-1,\"bags_2\":0,\"makeup_2\":0,\"blush_3\":0,\"hair_2\":0,\"glasses_1\":0,\"pants_2\":4,\"blush_2\":0,\"jaw_1\":0,\"lipstick_3\":0,\"chin_3\":0,\"chest_2\":0,\"watches_1\":0,\"age_2\":0,\"shoes_2\":6,\"nose_3\":0,\"sun_2\":0,\"torso_2\":5,\"lipstick_1\":0,\"ears_2\":0,\"beard_3\":0,\"beard_4\":0,\"watches_2\":0,\"decals_2\":0,\"chest_3\":0,\"bodyb_2\":0},\"name\":\"Stagiaire\"},{\"grades\":{\"employed\":\"employed\"},\"grade\":true,\"data\":{\"chain_2\":0,\"hair_color_2\":0,\"face_md_weight\":49,\"mom\":2,\"mask_2\":0,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"tshirt_1\":15,\"chin_4\":0,\"hair_1\":133,\"shoes_1\":12,\"arms\":0,\"blush_1\":0,\"chin_2\":0,\"bodyb_4\":0,\"decals_1\":0,\"helmet_2\":0,\"eye_color\":0,\"sex\":0,\"bracelets_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"eye_squint\":0,\"eyebrows_6\":0,\"bags_1\":0,\"eyebrows_2\":0,\"blemishes_2\":0,\"bracelets_1\":-1,\"chest_1\":0,\"eyebrows_1\":0,\"helmet_1\":-1,\"age_1\":0,\"jaw_2\":0,\"complexion_2\":0,\"bodyb_1\":-1,\"cheeks_2\":0,\"mask_1\":0,\"eyebrows_5\":0,\"sun_1\":0,\"eyebrows_3\":0,\"skin_md_weight\":49,\"nose_6\":0,\"torso_1\":751,\"cheeks_3\":0,\"bproof_1\":0,\"makeup_1\":0,\"lip_thickness\":0,\"nose_2\":0,\"dad\":9,\"lipstick_4\":0,\"moles_2\":0,\"nose_1\":0,\"beard_1\":10,\"hair_color_1\":55,\"makeup_3\":0,\"beard_2\":10,\"chin_1\":0,\"cheeks_1\":0,\"pants_1\":4,\"chain_1\":0,\"arms_2\":0,\"moles_1\":0,\"complexion_1\":0,\"glasses_2\":0,\"blemishes_1\":0,\"neck_thickness\":0,\"nose_4\":0,\"tshirt_2\":0,\"makeup_4\":0,\"bodyb_3\":-1,\"bags_2\":0,\"makeup_2\":0,\"blush_3\":0,\"hair_2\":0,\"glasses_1\":0,\"pants_2\":4,\"blush_2\":0,\"jaw_1\":0,\"lipstick_3\":0,\"chin_3\":0,\"chest_2\":0,\"watches_1\":0,\"age_2\":0,\"shoes_2\":6,\"nose_3\":0,\"sun_2\":0,\"torso_2\":5,\"lipstick_1\":0,\"ears_2\":0,\"beard_3\":0,\"beard_4\":0,\"watches_2\":0,\"decals_2\":0,\"chest_3\":0,\"bodyb_2\":0},\"name\":\"Employé(e)\"},{\"grades\":{\"sous-boss\":\"sous-boss\"},\"grade\":true,\"data\":{\"chain_2\":0,\"hair_color_2\":0,\"face_md_weight\":49,\"mom\":2,\"mask_2\":0,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"tshirt_1\":15,\"chin_4\":0,\"hair_1\":133,\"shoes_1\":10,\"arms\":11,\"blush_1\":0,\"chin_2\":0,\"bodyb_4\":0,\"decals_1\":0,\"helmet_2\":0,\"eye_color\":0,\"sex\":0,\"bracelets_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"eye_squint\":0,\"eyebrows_6\":0,\"bags_1\":0,\"eyebrows_2\":0,\"blemishes_2\":0,\"bracelets_1\":-1,\"chest_1\":0,\"eyebrows_1\":0,\"helmet_1\":-1,\"age_1\":0,\"jaw_2\":0,\"complexion_2\":0,\"bodyb_1\":-1,\"cheeks_2\":0,\"mask_1\":0,\"eyebrows_5\":0,\"sun_1\":0,\"eyebrows_3\":0,\"skin_md_weight\":49,\"nose_6\":0,\"torso_1\":26,\"cheeks_3\":0,\"bproof_1\":0,\"makeup_1\":0,\"lip_thickness\":0,\"nose_2\":0,\"dad\":9,\"lipstick_4\":0,\"moles_2\":0,\"nose_1\":0,\"beard_1\":10,\"hair_color_1\":55,\"makeup_3\":0,\"beard_2\":10,\"chin_1\":0,\"cheeks_1\":0,\"pants_1\":10,\"chain_1\":0,\"arms_2\":0,\"moles_1\":0,\"complexion_1\":0,\"glasses_2\":0,\"blemishes_1\":0,\"neck_thickness\":0,\"nose_4\":0,\"tshirt_2\":0,\"makeup_4\":0,\"bodyb_3\":-1,\"bags_2\":0,\"makeup_2\":0,\"blush_3\":0,\"hair_2\":0,\"glasses_1\":0,\"pants_2\":0,\"blush_2\":0,\"jaw_1\":0,\"lipstick_3\":0,\"chin_3\":0,\"chest_2\":0,\"watches_1\":0,\"age_2\":0,\"shoes_2\":0,\"nose_3\":0,\"sun_2\":0,\"torso_2\":1,\"lipstick_1\":0,\"ears_2\":0,\"beard_3\":0,\"beard_4\":0,\"watches_2\":0,\"decals_2\":0,\"chest_3\":0,\"bodyb_2\":0},\"name\":\"Responsable\"},{\"grades\":{\"boss\":\"boss\"},\"grade\":true,\"data\":{\"chain_2\":0,\"hair_color_2\":0,\"face_md_weight\":49,\"mom\":2,\"mask_2\":0,\"bproof_2\":0,\"nose_5\":0,\"lipstick_2\":0,\"tshirt_1\":15,\"chin_4\":0,\"hair_1\":133,\"shoes_1\":3,\"arms\":11,\"blush_1\":0,\"chin_2\":0,\"bodyb_4\":0,\"decals_1\":0,\"helmet_2\":0,\"eye_color\":0,\"sex\":0,\"bracelets_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"eye_squint\":0,\"eyebrows_6\":0,\"bags_1\":0,\"eyebrows_2\":0,\"blemishes_2\":0,\"bracelets_1\":-1,\"chest_1\":0,\"eyebrows_1\":0,\"helmet_1\":-1,\"age_1\":0,\"jaw_2\":0,\"complexion_2\":0,\"bodyb_1\":-1,\"cheeks_2\":0,\"mask_1\":0,\"eyebrows_5\":0,\"sun_1\":0,\"eyebrows_3\":0,\"skin_md_weight\":49,\"nose_6\":0,\"torso_1\":838,\"cheeks_3\":0,\"bproof_1\":0,\"makeup_1\":0,\"lip_thickness\":0,\"nose_2\":0,\"dad\":9,\"lipstick_4\":0,\"moles_2\":0,\"nose_1\":0,\"beard_1\":10,\"hair_color_1\":55,\"makeup_3\":0,\"beard_2\":10,\"chin_1\":0,\"cheeks_1\":0,\"pants_1\":24,\"chain_1\":0,\"arms_2\":0,\"moles_1\":0,\"complexion_1\":0,\"glasses_2\":0,\"blemishes_1\":0,\"neck_thickness\":0,\"nose_4\":0,\"tshirt_2\":0,\"makeup_4\":0,\"bodyb_3\":-1,\"bags_2\":0,\"makeup_2\":0,\"blush_3\":0,\"hair_2\":0,\"glasses_1\":0,\"pants_2\":5,\"blush_2\":0,\"jaw_1\":0,\"lipstick_3\":0,\"chin_3\":0,\"chest_2\":0,\"watches_1\":0,\"age_2\":0,\"shoes_2\":1,\"nose_3\":0,\"sun_2\":0,\"torso_2\":3,\"lipstick_1\":0,\"ears_2\":0,\"beard_3\":0,\"beard_4\":0,\"watches_2\":0,\"decals_2\":0,\"chest_3\":0,\"bodyb_2\":0},\"name\":\"Patron\"}]', '{\"z\":50.29619216918945,\"x\":2887.09326171875,\"y\":4400.97314453125}'),
(53, 'ltd_littleseoul', 'LTD Little Seoul', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":0,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"manage_grades\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Gérer les grades de la société\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":false},\"weapons_chest_society\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Arme(s) du coffre de la société\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"weapons_chest\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Armes du coffre\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"deposit_weapon_chest\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Déposer une arme dans le coffre\",\"Expérimenter\":true,\"sous-boss\":[],\"employed\":[]},\"manage_employeds\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Gérer les employés de la société\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"withdraw_cash_coffre\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Retirer de l\'argent dans le coffre\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"demote_player\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Virer un employé\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"editClothes\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Gérer les tenues dans le vestiaire\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"deposit_black_money_coffre\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Déposer de l\'argent sale dans le coffre\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"remove_item_chest\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Retirer un item dans le coffre\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"chest\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Accéder au coffre de la société\",\"Expérimenter\":true,\"sous-boss\":[],\"employed\":[]},\"deposit_item_chest\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Déposer un item dans le coffre\",\"Expérimenter\":true,\"sous-boss\":[],\"employed\":[]},\"rename_grade\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Changer le nom d\'un grade\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"remove_weapon_chest_society\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Retirer une arme dans la coffre de la société\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"remove_item_chest_society\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Retirer un item dans le coffre de la société\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"delete_grade\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Supprimer un grade\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"open_boss\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Ouvrir le menu boss\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"change_salary_grade\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Changer le salaire d\'un grade\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"remove_weapon_chest\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Retirer une arme dans le coffre\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"withdraw_black_money_coffre\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Retirer de l\'argent sale dans le coffre\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"dposit_item_chest_society\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Déposer un item dans le coffre de la société\",\"Expérimenter\":true,\"sous-boss\":[],\"employed\":[]},\"promote_player\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Augmenter un employé\",\"Expérimenter\":true,\"sous-boss\":[],\"employed\":[]},\"create_grade\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Créer un grade\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"items_chest\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Items du coffre\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"recruit_player\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Recruté un joueur\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"withdraw_money_society\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"deposit_weapon_chest_society\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Déposer une arme dans le coffre de la société\",\"Expérimenter\":true,\"sous-boss\":[],\"employed\":[]},\"change_permissions_grade\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Changer les permissions d\'un grade\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"change_number_grade\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Changer le numéro d\'un grade\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"rename_label_grade\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Changer le label d\'un grade\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"open_coffre\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Ouvrir le coffre\",\"Expérimenter\":true,\"sous-boss\":[],\"employed\":[]},\"items_chest:society\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Item(s) du coffre de la société\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"deposit_cash_coffre\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Déposer de l\'argent dans le coffre\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"unmote_player\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Descendre un employé\",\"Expérimenter\":false,\"sous-boss\":[],\"employed\":[]},\"deposit_money_society\":{\"grades\":{\"boss\":true},\"boss\":true,\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"Expérimenter\":true,\"sous-boss\":[],\"employed\":[]}}', '{\"x\":-705.4893188476563,\"y\":-904.4976196289064,\"z\":19.21559906005859}', '{\"x\":-709.4483032226563,\"y\":-904.7119750976564,\"z\":19.21559906005859}', '[]', '3', 1, '[{\"name\":\"LTD\",\"grade\":false,\"data\":{\"beard_2\":10,\"face_color\":0,\"bproof_1\":0,\"lipstick_4\":0,\"eyebrows_6\":0,\"nose_3\":0,\"bags_1\":0,\"face_md_weight\":0,\"mom\":2,\"shoes_1\":201,\"beard_4\":0,\"decals_2\":0,\"chain_1\":0,\"cheeks_1\":0,\"chest_2\":0,\"moles_2\":0,\"pants_2\":0,\"makeup_1\":0,\"eyebrows_2\":0,\"hair_1\":81,\"glasses_2\":0,\"jaw_1\":0,\"complexion_2\":0,\"chin_2\":0,\"bracelets_1\":-1,\"glasses_1\":68,\"chain_2\":0,\"tshirt_2\":0,\"beard_1\":3,\"nose_5\":0,\"torso_2\":0,\"complexion_1\":0,\"chin_3\":0,\"cheeks_2\":0,\"lipstick_1\":0,\"neck_thickness\":0,\"bags_2\":0,\"blush_2\":0,\"lip_thickness\":0,\"skin_md_weight\":50,\"ears_2\":0,\"bodyb_3\":-1,\"jaw_2\":0,\"bodyb_2\":0,\"watches_2\":0,\"eye_squint\":0,\"makeup_3\":0,\"sex\":0,\"ears_1\":0,\"eye_color\":0,\"chest_1\":0,\"helmet_2\":0,\"dad\":15,\"torso_1\":637,\"arms\":0,\"age_2\":0,\"nose_4\":1,\"blemishes_2\":0,\"sun_2\":0,\"chin_4\":0,\"shoes_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"bracelets_2\":0,\"sun_1\":0,\"pants_1\":237,\"chin_1\":0,\"nose_6\":0,\"blush_1\":0,\"eyebrows_4\":0,\"helmet_1\":-1,\"hair_color_2\":0,\"arms_2\":0,\"blush_3\":0,\"tshirt_1\":15,\"moles_1\":0,\"blemishes_1\":0,\"bodyb_1\":0,\"age_1\":0,\"eyebrows_1\":0,\"makeup_4\":0,\"beard_3\":0,\"chest_3\":0,\"nose_2\":1,\"nose_1\":0,\"lipstick_3\":0,\"bodyb_4\":0,\"eyebrows_5\":0,\"hair_2\":0,\"mask_2\":0,\"decals_1\":0,\"eyebrows_3\":0,\"lipstick_2\":0,\"cheeks_3\":0,\"hair_color_1\":0,\"mask_1\":0,\"watches_1\":-1},\"grades\":[]},{\"name\":\"Tenue Patron\",\"grade\":true,\"data\":{\"beard_2\":10,\"face_color\":0,\"bproof_1\":0,\"lipstick_4\":0,\"eyebrows_6\":0,\"nose_3\":0,\"bags_1\":0,\"face_md_weight\":0,\"mom\":2,\"shoes_1\":10,\"beard_4\":0,\"decals_2\":0,\"chain_1\":0,\"cheeks_1\":0,\"chest_2\":0,\"moles_2\":0,\"pants_2\":0,\"makeup_1\":0,\"eyebrows_2\":0,\"hair_1\":81,\"glasses_2\":0,\"jaw_1\":0,\"complexion_2\":0,\"chin_2\":0,\"bracelets_1\":-1,\"glasses_1\":68,\"chain_2\":0,\"tshirt_2\":0,\"ears_1\":0,\"nose_5\":0,\"torso_2\":0,\"makeup_4\":0,\"chin_3\":0,\"cheeks_2\":0,\"lipstick_1\":0,\"neck_thickness\":0,\"bproof_2\":0,\"pants_1\":13,\"lip_thickness\":0,\"skin_md_weight\":50,\"ears_2\":0,\"bodyb_3\":-1,\"jaw_2\":0,\"bodyb_2\":0,\"watches_2\":0,\"eye_squint\":0,\"makeup_3\":0,\"beard_1\":3,\"watches_1\":-1,\"tshirt_1\":31,\"chest_1\":0,\"hair_color_1\":0,\"nose_1\":0,\"torso_1\":29,\"lipstick_2\":0,\"complexion_1\":0,\"nose_4\":1,\"arms\":1,\"sun_2\":0,\"chin_4\":0,\"shoes_2\":0,\"eyebrows_5\":0,\"makeup_2\":0,\"hair_2\":0,\"sun_1\":0,\"dad\":15,\"chin_1\":0,\"nose_6\":0,\"bracelets_2\":0,\"blemishes_2\":0,\"helmet_1\":-1,\"hair_color_2\":0,\"arms_2\":0,\"blemishes_1\":0,\"bodyb_1\":0,\"sex\":0,\"eyebrows_1\":0,\"beard_3\":0,\"cheeks_3\":0,\"bags_2\":0,\"eyebrows_4\":0,\"eye_color\":0,\"chest_3\":0,\"blush_2\":0,\"helmet_2\":0,\"lipstick_3\":0,\"bodyb_4\":0,\"blush_3\":0,\"age_1\":0,\"mask_2\":0,\"decals_1\":0,\"eyebrows_3\":0,\"moles_1\":0,\"mask_1\":0,\"age_2\":0,\"blush_1\":0,\"nose_2\":1},\"grades\":{\"boss\":\"boss\"}},{\"name\":\"Tenue Co Patron\",\"grade\":true,\"data\":{\"beard_2\":10,\"face_color\":0,\"bproof_1\":0,\"lipstick_4\":0,\"eyebrows_6\":0,\"nose_3\":0,\"bags_1\":0,\"face_md_weight\":0,\"mom\":2,\"shoes_1\":201,\"beard_4\":0,\"decals_2\":0,\"chain_1\":0,\"cheeks_1\":0,\"chest_2\":0,\"moles_2\":0,\"pants_2\":0,\"makeup_1\":0,\"eyebrows_2\":0,\"hair_1\":81,\"glasses_2\":0,\"jaw_1\":0,\"complexion_2\":0,\"chin_2\":0,\"bracelets_1\":-1,\"glasses_1\":68,\"chain_2\":0,\"tshirt_2\":0,\"ears_1\":0,\"nose_5\":0,\"torso_2\":1,\"makeup_4\":0,\"chin_3\":0,\"cheeks_2\":0,\"lipstick_1\":0,\"neck_thickness\":0,\"bproof_2\":0,\"pants_1\":13,\"lip_thickness\":0,\"skin_md_weight\":50,\"ears_2\":0,\"bodyb_3\":-1,\"jaw_2\":0,\"bodyb_2\":0,\"watches_2\":0,\"eye_squint\":0,\"makeup_3\":0,\"beard_1\":3,\"watches_1\":-1,\"tshirt_1\":15,\"chest_1\":0,\"hair_color_1\":0,\"nose_1\":0,\"torso_1\":825,\"lipstick_2\":0,\"complexion_1\":0,\"nose_4\":1,\"arms\":0,\"sun_2\":0,\"chin_4\":0,\"shoes_2\":0,\"eyebrows_5\":0,\"makeup_2\":0,\"hair_2\":0,\"sun_1\":0,\"dad\":15,\"chin_1\":0,\"nose_6\":0,\"bracelets_2\":0,\"blemishes_2\":0,\"helmet_1\":-1,\"hair_color_2\":0,\"arms_2\":0,\"blemishes_1\":0,\"bodyb_1\":0,\"sex\":0,\"eyebrows_1\":0,\"beard_3\":0,\"cheeks_3\":0,\"bags_2\":0,\"eyebrows_4\":0,\"eye_color\":0,\"chest_3\":0,\"blush_2\":0,\"helmet_2\":0,\"lipstick_3\":0,\"bodyb_4\":0,\"blush_3\":0,\"age_1\":0,\"mask_2\":0,\"decals_1\":0,\"eyebrows_3\":0,\"moles_1\":0,\"mask_1\":0,\"age_2\":0,\"blush_1\":0,\"nose_2\":1},\"grades\":{\"sous-boss\":\"sous-boss\"}}]', '{\"x\":-705.880859375,\"y\":-915.3992309570313,\"z\":19.21560859680175}'),
(54, 'ltd_paletobay', 'LTD Paleto Bay', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"remove_weapon_chest_society\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"chest\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true}}', '{\"x\":165.99844360351563,\"y\":6646.62939453125,\"z\":31.69889640808105}', '{\"x\":170.10911560058595,\"y\":6642.8076171875,\"z\":31.69890022277832}', '[]', '0', 1, '[]', '{\"x\":159.59376525878907,\"y\":6640.53759765625,\"z\":31.70477867126465}'),
(55, 'ltd_f4l', 'LTD Forum Drive', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"manage_employeds\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"manage_grades\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"rename_grade\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"editClothes\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"unmote_player\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"open_coffre\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"withdraw_money_society\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"change_permissions_grade\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"deposit_weapon_chest_society\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"deposit_cash_coffre\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"change_number_grade\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"deposit_black_money_coffre\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"remove_item_chest\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"deposit_item_chest\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"remove_weapon_chest\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"weapons_chest_society\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"remove_item_chest_society\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"items_chest\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"create_grade\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"open_boss\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"chest\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"recruit_player\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"change_salary_grade\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"items_chest:society\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"dposit_item_chest_society\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"promote_player\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"withdraw_cash_coffre\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"deposit_money_society\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"deposit_weapon_chest\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"demote_player\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"withdraw_black_money_coffre\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"rename_label_grade\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"remove_weapon_chest_society\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"delete_grade\":{\"employer\":[],\"sous-boss\":[],\"boss\":true},\"weapons_chest\":{\"employer\":[],\"sous-boss\":[],\"boss\":true}}', '{\"x\":24.46809959411621,\"z\":29.49752426147461,\"y\":-1339.8079833984376}', '{\"x\":30.35602378845215,\"z\":29.49696731567382,\"y\":-1339.4979248046876}', '[]', '0', 1, '[{\"data\":{\"chin_3\":0,\"age_2\":0,\"face_color\":0,\"shoes_2\":0,\"ears_2\":0,\"helmet_1\":202,\"eyebrows_2\":10,\"eyebrows_1\":0,\"hair_2\":0,\"bracelets_2\":3,\"bproof_2\":0,\"mask_2\":1,\"bodyb_4\":0,\"hair_1\":15,\"makeup_2\":0,\"makeup_1\":0,\"glasses_2\":0,\"lipstick_4\":0,\"sex\":0,\"cheeks_1\":0,\"bodyb_3\":-1,\"glasses_1\":0,\"watches_2\":0,\"pants_2\":6,\"arms_2\":0,\"beard_4\":0,\"beard_1\":2,\"skin_md_weight\":50,\"moles_1\":0,\"shoes_1\":10,\"moles_2\":0,\"blemishes_1\":0,\"eyebrows_5\":0,\"chain_1\":0,\"sun_2\":0,\"nose_6\":0,\"blemishes_2\":0,\"sun_1\":0,\"eye_squint\":0,\"nose_5\":0,\"bags_1\":84,\"jaw_1\":0,\"beard_2\":10,\"chin_4\":0,\"eyebrows_3\":0,\"hair_color_2\":0,\"tshirt_1\":15,\"mom\":31,\"bags_2\":0,\"bodyb_2\":0,\"cheeks_3\":0,\"pants_1\":292,\"mask_1\":0,\"complexion_1\":0,\"arms\":200,\"makeup_3\":0,\"decals_1\":0,\"beard_3\":0,\"chin_1\":0,\"bracelets_1\":12,\"chain_2\":0,\"hair_color_1\":0,\"complexion_2\":0,\"chin_2\":0,\"chest_3\":0,\"nose_1\":0,\"nose_4\":0,\"bodyb_1\":-1,\"tshirt_2\":0,\"ears_1\":-1,\"lipstick_1\":0,\"torso_1\":26,\"lip_thickness\":0,\"jaw_2\":0,\"torso_2\":0,\"eyebrows_6\":0,\"lipstick_3\":0,\"lipstick_2\":0,\"blush_2\":0,\"face_md_weight\":0,\"eye_color\":0,\"nose_3\":0,\"bproof_1\":14,\"eyebrows_4\":0,\"dad\":37,\"watches_1\":3,\"decals_2\":0,\"neck_thickness\":0,\"makeup_4\":0,\"cheeks_2\":0,\"nose_2\":0,\"age_1\":0,\"helmet_2\":0,\"blush_3\":0,\"blush_1\":0,\"chest_2\":0,\"chest_1\":0},\"grade\":true,\"name\":\"Epicier\",\"grades\":{\"employee\":\"employee\"}},{\"data\":{\"chin_3\":0,\"age_2\":0,\"face_color\":0,\"shoes_2\":0,\"ears_2\":0,\"helmet_1\":202,\"eyebrows_2\":10,\"eyebrows_1\":0,\"hair_2\":0,\"bracelets_2\":3,\"bproof_2\":8,\"mask_2\":1,\"bodyb_4\":0,\"hair_1\":15,\"makeup_2\":0,\"makeup_1\":0,\"glasses_2\":0,\"lipstick_4\":0,\"sex\":0,\"cheeks_1\":0,\"bodyb_3\":-1,\"glasses_1\":0,\"watches_2\":0,\"pants_2\":0,\"arms_2\":0,\"beard_4\":0,\"beard_1\":2,\"skin_md_weight\":50,\"moles_1\":0,\"shoes_1\":15,\"moles_2\":0,\"blemishes_1\":0,\"eyebrows_5\":0,\"chain_1\":0,\"sun_2\":0,\"nose_6\":0,\"blemishes_2\":0,\"sun_1\":0,\"eye_squint\":0,\"nose_5\":0,\"bags_1\":84,\"jaw_1\":0,\"beard_2\":10,\"chin_4\":0,\"eyebrows_3\":0,\"hair_color_2\":0,\"tshirt_1\":15,\"mom\":31,\"bags_2\":0,\"bodyb_2\":0,\"cheeks_3\":0,\"pants_1\":296,\"mask_1\":0,\"complexion_1\":0,\"arms\":200,\"makeup_3\":0,\"decals_1\":0,\"beard_3\":0,\"chin_1\":0,\"bracelets_1\":12,\"chain_2\":0,\"hair_color_1\":0,\"complexion_2\":0,\"chin_2\":0,\"chest_3\":0,\"nose_1\":0,\"nose_4\":0,\"bodyb_1\":-1,\"tshirt_2\":0,\"ears_1\":-1,\"lipstick_1\":0,\"torso_1\":42,\"lip_thickness\":0,\"jaw_2\":0,\"torso_2\":0,\"eyebrows_6\":0,\"lipstick_3\":0,\"lipstick_2\":0,\"blush_2\":0,\"face_md_weight\":0,\"eye_color\":0,\"nose_3\":0,\"bproof_1\":0,\"eyebrows_4\":0,\"dad\":37,\"watches_1\":3,\"decals_2\":0,\"neck_thickness\":0,\"makeup_4\":0,\"cheeks_2\":0,\"nose_2\":0,\"age_1\":0,\"helmet_2\":0,\"blush_3\":0,\"blush_1\":0,\"chest_2\":0,\"chest_1\":0},\"grade\":true,\"name\":\"vendeur\",\"grades\":{\"employer\":\"employer\"}}]', '{\"x\":24.53115844726562,\"z\":29.49773597717285,\"y\":-1348.7269287109376}'),
(56, 'ltd_ballas', 'LTD Grove Street', '{\"items_boss\":[],\"accounts\":{\"cash\":0,\"society\":15000,\"black_money\":0},\"weapons_boss\":[],\"weapons\":[],\"items\":[]}', '{\"editClothes\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"chest\":{\"boss\":true}}', '{\"x\":-40.55442428588867,\"y\":-1751.7152099609376,\"z\":29.42101097106933}', '{\"x\":-43.83893585205078,\"y\":-1749.273193359375,\"z\":29.42101669311523}', '[]', '0', 1, '[]', '{\"x\":-47.82780075073242,\"y\":-1759.3521728515626,\"z\":29.42099571228027}'),
(57, 'ambulancesandy', 'Ambulance Sandy', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"manage_grades\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"chest\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true}}', '{\"x\":1768.4810791015626,\"y\":3643.358154296875,\"z\":34.85253524780273}', '{\"x\":1784.179931640625,\"y\":3658.7099609375,\"z\":34.8525276184082}', '{\"sprite\":61,\"color\":2,\"active\":true,\"position\":{\"x\":1768.0482177734376,\"y\":3637.49853515625,\"z\":34.85257339477539}}', '0', 1, '[]', '{\"x\":1784.9034423828126,\"y\":3652.426513671875,\"z\":34.85258102416992}'),
(58, 'bcsosandy', 'BCSO Sandy', '{\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"black_money\":0,\"cash\":0},\"items\":[],\"weapons\":[]}', '{\"change_number_grade\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"chest\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"delete_grade\":{\"boss\":true}}', '{\"z\":34.32614517211914,\"x\":1857.0775146484376,\"y\":3679.5693359375}', '{\"z\":38.92930603027344,\"x\":1843.9237060546876,\"y\":3683.56689453125}', '{\"active\":true,\"sprite\":60,\"position\":{\"z\":43.61238098144531,\"x\":1845.546630859375,\"y\":3682.36279296875},\"color\":47}', '0', 1, '[]', '{\"z\":39.07129287719726,\"x\":1838.7381591796876,\"y\":3679.25830078125}'),
(60, 'ambulance', 'SAMS', '{\"weapons\":[],\"accounts\":{\"society\":21000,\"black_money\":0,\"cash\":0},\"items_boss\":[],\"items\":[],\"weapons_boss\":[]}', '{\"withdraw_cash_coffre\":{\"label\":\"Retirer de l\'argent dans le coffre\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"create_grade\":{\"label\":\"Créer un grade\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"remove_weapon_chest\":{\"label\":\"Retirer une arme dans le coffre\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"weapons_chest\":{\"label\":\"Armes du coffre\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"deposit_item_chest\":{\"label\":\"Déposer un item dans le coffre\",\"Aide Soignant\":true,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"change_permissions_grade\":{\"label\":\"Changer les permissions d\'un grade\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"deposit_weapon_chest_society\":{\"label\":\"Déposer une arme dans le coffre de la société\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"rename_grade\":{\"label\":\"Changer le nom d\'un grade\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"open_boss\":{\"label\":\"Ouvrir le menu boss\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"deposit_cash_coffre\":{\"label\":\"Déposer de l\'argent dans le coffre\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"dposit_item_chest_society\":{\"label\":\"Déposer un item dans le coffre de la société\",\"Aide Soignant\":true,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"change_number_grade\":{\"label\":\"Changer le numéro d\'un grade\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"recruit_player\":{\"label\":\"Recruté un joueur\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"deposit_black_money_coffre\":{\"label\":\"Déposer de l\'argent sale dans le coffre\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"manage_grades\":{\"label\":\"Gérer les grades de la société\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"editClothes\":{\"label\":\"Gérer les tenues dans le vestiaire\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"remove_item_chest\":{\"label\":\"Retirer un item dans le coffre\",\"Aide Soignant\":true,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"remove_item_chest_society\":{\"label\":\"Retirer un item dans le coffre de la société\",\"Aide Soignant\":true,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"demote_player\":{\"label\":\"Virer un employé\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"items_chest\":{\"label\":\"Items du coffre\",\"Aide Soignant\":true,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"promote_player\":{\"label\":\"Augmenter un employé\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"items_chest:society\":{\"label\":\"Item(s) du coffre de la société\",\"Aide Soignant\":true,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"rename_label_grade\":{\"label\":\"Changer le label d\'un grade\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"change_salary_grade\":{\"label\":\"Changer le salaire d\'un grade\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"deposit_money_society\":{\"label\":\"Déposer de l\'argent dans le coffre de la société\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"remove_weapon_chest_society\":{\"label\":\"Retirer une arme dans la coffre de la société\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"weapons_chest_society\":{\"label\":\"Arme(s) du coffre de la société\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"chest\":{\"label\":\"Accéder au coffre de la société\",\"Aide Soignant\":true,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"delete_grade\":{\"label\":\"Supprimer un grade\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"deposit_weapon_chest\":{\"label\":\"Déposer une arme dans le coffre\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"withdraw_money_society\":{\"label\":\"Retirer de l\'argent dans le coffre de la société\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"manage_employeds\":{\"label\":\"Gérer les employés de la société\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"open_coffre\":{\"label\":\"Ouvrir le coffre\",\"Aide Soignant\":true,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"withdraw_black_money_coffre\":{\"label\":\"Retirer de l\'argent sale dans le coffre\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true},\"unmote_player\":{\"label\":\"Descendre un employé\",\"Aide Soignant\":false,\"grades\":{\"boss\":true},\"boss\":true,\"president\":true}}', '{\"x\":301.56732177734377,\"y\":-593.9436645507813,\"z\":43.26986312866211}', '{\"x\":310.3377380371094,\"y\":-568.0125122070313,\"z\":43.2698860168457}', '{\"position\":{\"x\":296.847809,\"y\":-582.804871,\"z\":83.136551},\"sprite\":61,\"active\":true,\"color\":43}', '0', 1, '[]', '{\"x\":312.8126220703125,\"y\":-589.134521484375,\"z\":38.33096313476562}'),
(61, 'burgershot', 'Burgershot', '{\"weapons\":[],\"items_boss\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"cash\":0,\"black_money\":0},\"items\":[]}', '{\"recruit_player\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"chest\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"weapons_chest\":{\"boss\":true}}', '{\"x\":-1196.67724609375,\"y\":-901.8864135742188,\"z\":13.88615703582763}', '{\"x\":-1199.2901611328126,\"y\":-890.3444213867188,\"z\":13.8861665725708}', '{\"color\":1,\"position\":{\"y\":-889.5091552734375,\"z\":13.79837894439697,\"x\":-1191.08642578125},\"sprite\":106,\"active\":true}', '0', 1, '[]', '{\"x\":-1203.3184814453126,\"y\":-893.9554443359375,\"z\":13.8861608505249}'),
(62, 'mecano', 'Benny\'s', '{\"weapons\":[],\"accounts\":{\"society\":10109035.0,\"black_money\":0,\"cash\":0},\"items_boss\":[],\"items\":[],\"weapons_boss\":[]}', '{\"withdraw_cash_coffre\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"chest\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"unmote_player\":{\"boss\":true}}', '{\"x\":-198.89129638671876,\"y\":-1317.08544921875,\"z\":31.30103492736816}', '{\"x\":-194.6155242919922,\"y\":-1315.200927734375,\"z\":31.30047798156738}', '{\"position\":{\"x\":-211.63577270507813,\"y\":-1326.982666015625,\"z\":31.30048370361328},\"sprite\":446,\"active\":true,\"color\":1}', '0', 1, '[]', '{\"x\":-194.10446166992188,\"y\":-1336.392578125,\"z\":31.30048561096191}'),
(63, 'unicorn', 'Unicorn', '{\"items\":[],\"weapons_boss\":[],\"accounts\":{\"society\":15000,\"cash\":0,\"black_money\":0},\"weapons\":[],\"items_boss\":[]}', '{\"deposit_item_chest\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"chest\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"weapons_chest\":{\"boss\":true}}', '{\"z\":29.25549697875976,\"y\":-1283.1328125,\"x\":134.56488037109376}', '{\"z\":29.25549507141113,\"y\":-1304.06298828125,\"x\":97.84385681152344}', '{\"color\":7,\"active\":true,\"sprite\":121,\"position\":{\"z\":29.25549507141113,\"y\":-1295.0428466796876,\"x\":125.80050659179688}}', '0', 1, '[]', '{\"z\":29.25551033020019,\"y\":-1305.447998046875,\"x\":109.80492401123049}'),
(64, 'vangelico', 'Vangelico', '{\"accounts\":{\"black_money\":0,\"cash\":0,\"society\":0},\"items_boss\":[],\"items\":[],\"weapons_boss\":[],\"weapons\":[]}', '{\"change_salary_grade\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"items_chest:society\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"chest\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true}}', '{\"y\":-229.51231384277345,\"z\":38.05705642700195,\"x\":-630.5894165039063}', '{\"y\":-228.1563720703125,\"z\":38.05705642700195,\"x\":-629.0260009765625}', '{\"active\":true,\"position\":{\"y\":-232.24172973632813,\"z\":38.05701446533203,\"x\":-624.469482421875},\"color\":0,\"sprite\":285}', '0', 0, '[]', '\"none\"'),
(65, 'pops', 'Pop\'s Diner', NULL, '{\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"chest\":{\"boss\":true}}', '{\"x\":1590.5518798828126,\"y\":6457.84765625,\"z\":26.01401901245117}', '{\"x\":1595.6212158203126,\"y\":6454.04931640625,\"z\":26.01402854919433}', '{\"active\":true,\"position\":{\"x\":1589.105712890625,\"y\":6456.9365234375,\"z\":26.01401138305664},\"color\":1,\"sprite\":267}', '0', 0, '[]', '\"none\"');
INSERT INTO `society_data` (`id`, `name`, `label`, `coffre`, `permissions`, `posCoffre`, `posBoss`, `blips`, `tax`, `cloakroom`, `clothes`, `cloakpos`) VALUES
(66, 'hornys', 'Horny\'s', '{\"weapons\":[],\"items_boss\":[],\"accounts\":{\"society\":0,\"black_money\":0,\"cash\":0},\"weapons_boss\":[],\"items\":[]}', '{\"items_chest:society\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"chest\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true}}', '{\"z\":69.08213806152344,\"y\":-353.0389099121094,\"x\":1248.7083740234376}', '{\"z\":69.08210754394531,\"y\":-349.3173522949219,\"x\":1237.951904296875}', '{\"color\":5,\"position\":{\"z\":69.07721710205078,\"y\":-359.7519836425781,\"x\":1242.85009765625},\"sprite\":674,\"active\":true}', '0', 1, '[]', '{\"z\":69.08206176757813,\"y\":-354.617919921875,\"x\":1245.251708984375}'),
(67, 'pearls', 'Pearls', NULL, '{\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"chest\":{\"boss\":true}}', '{\"x\":-1840.6685791015626,\"y\":-1192.775634765625,\"z\":14.31556510925293}', '{\"x\":-1840.3065185546876,\"y\":-1182.55078125,\"z\":14.30923843383789}', '{\"active\":true,\"position\":{\"x\":-1815.684814453125,\"y\":-1192.265625,\"z\":14.30337715148925},\"color\":3,\"sprite\":729}', '0', 1, '[]', '{\"x\":-1838.3603515625,\"y\":-1187.2734375,\"z\":14.30922794342041}'),
(68, 'wiwang', 'Wiwang', NULL, '{\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"chest\":{\"boss\":true}}', '{\"x\":-815.381103515625,\"y\":-687.7308959960938,\"z\":123.41831970214844}', '{\"x\":-820.621826171875,\"y\":-691.3907470703125,\"z\":127.38679504394531}', '{\"active\":true,\"position\":{\"x\":-817.693603515625,\"y\":-686.4660034179688,\"z\":123.41832733154297},\"color\":7,\"sprite\":93}', '0', 1, '[]', '{\"x\":-820.3956298828125,\"y\":-683.3983764648438,\"z\":123.4223403930664}'),
(69, 'pacific', 'Pacific Bluffs', NULL, '{\"items_chest:society\":{\"boss\":true},\"remove_item_chest\":{\"boss\":true},\"remove_weapon_chest\":{\"boss\":true},\"deposit_item_chest\":{\"boss\":true},\"open_coffre\":{\"boss\":true},\"unmote_player\":{\"boss\":true},\"rename_grade\":{\"boss\":true},\"withdraw_money_society\":{\"boss\":true},\"deposit_cash_coffre\":{\"boss\":true},\"remove_weapon_chest_society\":{\"boss\":true},\"create_grade\":{\"boss\":true},\"deposit_black_money_coffre\":{\"boss\":true},\"deposit_money_society\":{\"boss\":true},\"recruit_player\":{\"boss\":true},\"weapons_chest_society\":{\"boss\":true},\"open_boss\":{\"boss\":true},\"editClothes\":{\"boss\":true},\"dposit_item_chest_society\":{\"boss\":true},\"withdraw_black_money_coffre\":{\"boss\":true},\"change_permissions_grade\":{\"boss\":true},\"deposit_weapon_chest_society\":{\"boss\":true},\"delete_grade\":{\"boss\":true},\"deposit_weapon_chest\":{\"boss\":true},\"change_salary_grade\":{\"boss\":true},\"manage_grades\":{\"boss\":true},\"rename_label_grade\":{\"boss\":true},\"change_number_grade\":{\"boss\":true},\"demote_player\":{\"boss\":true},\"weapons_chest\":{\"boss\":true},\"withdraw_cash_coffre\":{\"boss\":true},\"promote_player\":{\"boss\":true},\"manage_employeds\":{\"boss\":true},\"items_chest\":{\"boss\":true},\"remove_item_chest_society\":{\"boss\":true},\"chest\":{\"boss\":true}}', '{\"x\":-3022.68603515625,\"y\":36.9053955078125,\"z\":10.14832782745361}', '{\"x\":-3053.260986328125,\"y\":100.24765014648438,\"z\":12.82001209259033}', '{\"active\":true,\"position\":{\"x\":-3018.800048828125,\"y\":86.63282775878906,\"z\":11.5861759185791},\"color\":7,\"sprite\":93}', '0', 1, '[]', '{\"x\":-3028.209228515625,\"y\":83.89933013916016,\"z\":12.35983371734619}');

-- --------------------------------------------------------

--
-- Structure de la table `tinder_accounts`
--

CREATE TABLE `tinder_accounts` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `gender` varchar(50) NOT NULL,
  `targetGender` varchar(50) NOT NULL DEFAULT '0',
  `hobbies` varchar(50) NOT NULL DEFAULT '0',
  `age` varchar(50) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tinder_likes`
--

CREATE TABLE `tinder_likes` (
  `id` int(11) NOT NULL,
  `phone` varchar(1024) NOT NULL,
  `likeds` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tinder_messages`
--

CREATE TABLE `tinder_messages` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `messages` varchar(1024) DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_account`
--

CREATE TABLE `twitter_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_hashtags`
--

CREATE TABLE `twitter_hashtags` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `created` varchar(50) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_mentions`
--

CREATE TABLE `twitter_mentions` (
  `id` int(11) NOT NULL,
  `id_tweet` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mentioned` text NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(5) NOT NULL,
  `username` varchar(80) NOT NULL,
  `message` longtext NOT NULL,
  `hashtags` varchar(50) NOT NULL,
  `mentions` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `likes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `UniqueID` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `playerName` longtext DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(255) DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT 0,
  `loadout` longtext NOT NULL DEFAULT '[]',
  `inventory` longtext NOT NULL DEFAULT '[]',
  `accounts` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `permission_group` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `dateofbirth` varchar(25) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `height` varchar(5) DEFAULT '',
  `status` longtext DEFAULT NULL,
  `clothes` longtext DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `ip` longtext DEFAULT NULL,
  `life` longtext DEFAULT NULL,
  `connected` tinyint(1) DEFAULT 0,
  `kayscorecoins` int(11) NOT NULL DEFAULT 0,
  `totalCoins` text NOT NULL DEFAULT '0',
  `warns` longtext NOT NULL DEFAULT '[]',
  `boutiquereward` tinyint(4) DEFAULT 0,
  `apps` text DEFAULT NULL,
  `widget` text DEFAULT NULL,
  `bt` text DEFAULT NULL,
  `charinfo` text DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL,
  `cryptocurrency` longtext DEFAULT NULL,
  `cryptocurrencytransfers` text DEFAULT NULL,
  `phonePos` text DEFAULT NULL,
  `spotify` text DEFAULT NULL,
  `ringtone` text DEFAULT NULL,
  `first_screen_showed` int(11) DEFAULT NULL,
  `xp` int(11) DEFAULT 1,
  `vie` int(55) NOT NULL DEFAULT 200,
  `report` longtext DEFAULT NULL CHECK (json_valid(`report`)),
  `reports_taken` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`UniqueID`, `identifier`, `money`, `playerName`, `skin`, `job`, `job_grade`, `job2`, `job2_grade`, `loadout`, `inventory`, `accounts`, `position`, `bank`, `permission_level`, `permission_group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `status`, `clothes`, `tattoos`, `phone_number`, `is_dead`, `last_property`, `rank`, `ip`, `life`, `connected`, `kayscorecoins`, `totalCoins`, `warns`, `boutiquereward`, `apps`, `widget`, `bt`, `charinfo`, `metadata`, `cryptocurrency`, `cryptocurrencytransfers`, `phonePos`, `spotify`, `ringtone`, `first_screen_showed`, `xp`, `vie`, `report`, `reports_taken`) VALUES
(1, 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', NULL, 'Kay', '{\"torso_1\":771,\"beard_1\":3,\"chest_3\":0,\"chest_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"hair_color_2\":0,\"chin_1\":0,\"arms_2\":0,\"age_2\":0,\"blush_1\":0,\"eyebrows_5\":0,\"makeup_3\":0,\"mask_2\":0,\"glasses_1\":82,\"nose_6\":0,\"bracelets_2\":0,\"chain_1\":262,\"neck_thickness\":0,\"lipstick_3\":0,\"bproof_2\":0,\"eyebrows_1\":2,\"cheeks_2\":0,\"mask_1\":0,\"chin_2\":0,\"dad\":8,\"sun_1\":0,\"tshirt_1\":15,\"glasses_2\":0,\"decals_2\":0,\"eye_squint\":0,\"makeup_2\":0,\"chin_3\":0,\"skin_md_weight\":49,\"bodyb_4\":0,\"ears_1\":-1,\"ears_2\":0,\"sex\":0,\"bracelets_1\":-1,\"cheeks_3\":0,\"lipstick_1\":0,\"arms\":0,\"bproof_1\":69,\"bags_2\":0,\"watches_1\":-1,\"helmet_2\":0,\"makeup_1\":0,\"blemishes_1\":0,\"eye_color\":0,\"cheeks_1\":0,\"nose_4\":0,\"jaw_1\":0,\"helmet_1\":-1,\"complexion_2\":0,\"blush_3\":0,\"hair_1\":331,\"eyebrows_4\":0,\"beard_3\":0,\"pants_1\":336,\"bodyb_2\":0,\"lipstick_4\":0,\"chest_2\":0,\"jaw_2\":0,\"beard_2\":10,\"chain_2\":0,\"blemishes_2\":0,\"moles_2\":0,\"tshirt_2\":0,\"makeup_4\":0,\"moles_1\":0,\"hair_color_1\":0,\"age_1\":0,\"shoes_1\":293,\"face_md_weight\":50,\"eyebrows_3\":0,\"nose_1\":0,\"bodyb_3\":-1,\"bodyb_1\":-1,\"chin_4\":0,\"eyebrows_2\":10,\"bags_1\":0,\"beard_4\":0,\"hair_2\":0,\"blush_2\":0,\"decals_1\":0,\"nose_2\":0,\"torso_2\":1,\"watches_2\":0,\"pants_2\":0,\"sun_2\":0,\"nose_5\":0,\"eyebrows_6\":0,\"nose_3\":0,\"lip_thickness\":0,\"mom\":19,\"complexion_1\":0}', 'lscustom', 1, 'unemployed2', 0, '[]', '[]', '[{\"money\":3000,\"name\":\"cash\"},{\"money\":0,\"name\":\"black_money\"},{\"money\":6500,\"name\":\"bank\"},{\"money\":0,\"name\":\"chip\"},{\"money\":500,\"name\":\"pesos\"}]', '{\"x\":893.2999877929688,\"y\":-2115.300048828125,\"z\":30.5}', NULL, 0, 'fondateur', 'Angel', 'Holl', '2000-01-06', '0', '176', '[{\"val\":676000,\"percent\":67.60000000000001,\"name\":\"hunger\"},{\"val\":773200,\"percent\":77.32,\"name\":\"thirst\"}]', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, '0', '[]', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1051, 200, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
(1, 'fishing_ocean', 'license:968abcbb2dced60f0e6caeea28c431b744430742'),
(2, 'fishing_mer', 'license:968abcbb2dced60f0e6caeea28c431b744430742'),
(3, 'dmv', 'license:968abcbb2dced60f0e6caeea28c431b744430742'),
(4, 'drive', 'license:968abcbb2dced60f0e6caeea28c431b744430742'),
(5, 'drive_bike', 'license:968abcbb2dced60f0e6caeea28c431b744430742'),
(6, 'drive_truck', 'license:968abcbb2dced60f0e6caeea28c431b744430742'),
(7, 'dmv', 'license:7a293177d8a85a2e64817f3e16dfa8aff94acf00'),
(8, 'dmv', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7'),
(9, 'dmv', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7'),
(10, 'drive', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7'),
(11, 'drive_bike', 'license:f46de84fadcd290c98bf6de06fb2f8c7587343a7'),
(12, 'drive', 'license:f7fd33a05a8f21cc38bc44ff3816e01b794bb9a7'),
(13, 'dmv', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e'),
(14, 'drive', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e'),
(15, 'drive_bike', 'license:4b0dd07b5e670e661a94febf8783c07af9e6026e'),
(16, 'dmv', 'license:c2cb2d5b547242283b0ecf3ac9db8286ae2f45d6'),
(17, 'drive', 'license:c2cb2d5b547242283b0ecf3ac9db8286ae2f45d6'),
(18, 'dmv', 'license:9c6b7781157b6d228ad93235d97ae796f6537f18');

-- --------------------------------------------------------

--
-- Structure de la table `vcoffre`
--

CREATE TABLE `vcoffre` (
  `id` int(11) NOT NULL,
  `coffre` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles_boutique`
--

CREATE TABLE `vehicles_boutique` (
  `name` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `type` longtext NOT NULL DEFAULT 'car'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicles_boutique`
--

INSERT INTO `vehicles_boutique` (`name`, `label`, `price`, `type`) VALUES
('sultanrs', 'Sultanrs', 1000, 'car');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_catalogue`
--

CREATE TABLE `vehicle_catalogue` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicle_catalogue`
--

INSERT INTO `vehicle_catalogue` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupes'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupes'),
('ENTREPRISE', 'Entreprise'),
('Imports', 'Imports'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

CREATE TABLE `vehicules` (
  `id` int(12) NOT NULL,
  `job` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `price` int(12) NOT NULL,
  `category` varchar(255) NOT NULL,
  `ytd` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicules`
--

INSERT INTO `vehicules` (`id`, `job`, `name`, `model`, `price`, `category`, `ytd`, `image`) VALUES
(3, 'cardealer', 'Alpha', 'alpha', 60000, 'sports', NULL, NULL),
(4, 'cardealer', 'asbo', 'asbo', 8000, 'compacts', NULL, NULL),
(5, 'cardealer', 'Asea', 'asea', 5500, 'sedans', NULL, NULL),
(6, 'cardealer', 'asterope', 'asterope', 45000, 'sedans', NULL, NULL),
(8, 'motodealer', 'Avarus', 'avarus', 25000, 'motorcycles', NULL, NULL),
(9, 'motodealer', 'Bagger', 'bagger', 20000, 'motorcycles', NULL, NULL),
(12, 'cardealer', 'Baller Sport', 'baller4', 60000, 'suvs', NULL, NULL),
(13, 'cardealer', 'Banshee', 'banshee', 70000, 'sports', NULL, NULL),
(14, 'cardealer', 'Banshee 900R', 'banshee2', 47000, 'super', NULL, NULL),
(15, 'motodealer', 'Bati 801', 'bati', 20000, 'motorcycles', NULL, NULL),
(16, 'motodealer', 'Bati 801RR', 'bati2', 40000, 'motorcycles', NULL, NULL),
(17, 'cardealer', 'Bestia GTS', 'bestiagts', 95000, 'sports', NULL, NULL),
(18, 'motodealer', 'BF400', 'bf400', 25000, 'motorcycles', NULL, NULL),
(19, 'cardealer', 'Bf Injection', 'bfinjection', 16000, 'offroad', NULL, NULL),
(20, 'cardealer', 'Bifta', 'bifta', 12000, 'offroad', NULL, NULL),
(21, 'cardealer', 'Bison', 'bison', 45000, 'vans', NULL, NULL),
(22, 'cardealer', 'bison2', 'bison2', 20000, 'vans', NULL, NULL),
(23, 'cardealer', 'bjxl', 'bjxl', 45000, 'suvs', NULL, NULL),
(24, 'cardealer', 'Blade', 'blade', 15000, 'muscle', NULL, NULL),
(25, 'cardealer', 'Blazer', 'blazer', 6500, 'offroad', NULL, NULL),
(26, 'cardealer', 'Blazer Sport', 'blazer4', 8500, 'offroad', NULL, NULL),
(27, 'cardealer', 'Blista', 'blista', 8000, 'compacts', NULL, NULL),
(28, 'cardealer', 'blista2', 'blista2', 45000, 'sports', NULL, NULL),
(29, 'cardealer', 'blista3', 'blista3', 45000, 'sports', NULL, NULL),
(30, 'cardealer', 'BMX', 'bmx', 160, 'motorcycles', NULL, NULL),
(31, 'cardealer', 'Bobcat XL', 'bobcatxl', 32000, 'vans', NULL, NULL),
(32, 'cardealer', 'bodhi2', 'bodhi2', 45000, 'offroad', NULL, NULL),
(33, 'cardealer', 'Brawler', 'brawler', 45000, 'offroad', NULL, NULL),
(34, 'cardealer', 'Brioso R/A', 'brioso', 18000, 'compacts', NULL, NULL),
(35, 'cardealer', 'brioso2', 'brioso2', 8000, 'compacts', NULL, NULL),
(36, 'cardealer', 'Btype', 'btype', 62000, 'sportsclassics', NULL, NULL),
(37, 'cardealer', 'Btype Hotroad', 'btype2', 155000, 'sportsclassics', NULL, NULL),
(38, 'cardealer', 'Btype Luxe', 'btype3', 85000, 'sportsclassics', NULL, NULL),
(39, 'cardealer', 'Buccaneer', 'buccaneer', 18000, 'muscle', NULL, NULL),
(40, 'cardealer', 'Buccaneer Rider', 'buccaneer2', 24000, 'muscle', NULL, NULL),
(41, 'cardealer', 'Buffalo', 'buffalo', 22000, 'sports', NULL, NULL),
(42, 'cardealer', 'Buffalo S', 'buffalo2', 26000, 'sports', NULL, NULL),
(44, 'cardealer', 'Bullet', 'bullet', 90000, 'super', NULL, NULL),
(45, 'cardealer', 'burrito2', 'burrito2', 20000, 'vans', NULL, NULL),
(46, 'cardealer', 'Burrito', 'burrito3', 49000, 'vans', NULL, NULL),
(47, 'cardealer', 'burrito4', 'burrito4', 20000, 'vans', NULL, NULL),
(49, 'cardealer', 'Carbonizzare', 'carbonizzare', 75000, 'sports', NULL, NULL),
(50, 'motodealer', 'Carbon RS', 'carbonrs', 38000, 'motorcycles', NULL, NULL),
(51, 'cardealer', 'Casco', 'casco', 55000, 'sportsclassics', NULL, NULL),
(52, 'cardealer', 'cavalcade', 'cavalcade', 45000, 'suvs', NULL, NULL),
(53, 'cardealer', 'Cavalcade', 'cavalcade2', 55000, 'suvs', NULL, NULL),
(54, 'cardealer', 'Cheburek', 'cheburek', 20000, 'sedans', NULL, NULL),
(57, 'cardealer', 'Chimera', 'chimera', 25000, 'motorcycles', NULL, NULL),
(58, 'cardealer', 'Chino', 'chino', 15000, 'muscle', NULL, NULL),
(59, 'cardealer', 'Chino Luxe', 'chino2', 19000, 'muscle', NULL, NULL),
(60, 'motodealer', 'Cliffhanger', 'cliffhanger', 20000, 'motorcycles', NULL, NULL),
(61, 'cardealer', 'clique', 'clique', 45000, 'muscle', NULL, NULL),
(62, 'cardealer', 'club', 'club', 8000, 'compacts', NULL, NULL),
(63, 'cardealer', 'cog55', 'cog55', 45000, 'sedans', NULL, NULL),
(64, 'cardealer', 'Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes', NULL, NULL),
(65, 'cardealer', 'Cognoscenti', 'cognoscenti', 55000, 'sedans', NULL, NULL),
(66, 'cardealer', 'Comet', 'comet2', 72000, 'sports', NULL, NULL),
(67, 'cardealer', 'Comet 5', 'comet5', 145000, 'sports', NULL, NULL),
(68, 'cardealer', 'Contender', 'contender', 180000, 'suvs', NULL, NULL),
(69, 'cardealer', 'Coquette', 'coquette', 65000, 'sports', NULL, NULL),
(70, 'cardealer', 'Coquette Classic', 'coquette2', 40000, 'sportsclassics', NULL, NULL),
(71, 'cardealer', 'Coquette BlackFin', 'coquette3', 55000, 'muscle', NULL, NULL),
(72, 'cardealer', 'Cruiser', 'cruiser', 510, 'motorcycles', NULL, NULL),
(73, 'cardealer', 'Cyclone', 'cyclone', 189000, 'super', NULL, NULL),
(74, 'motodealer', 'Daemon', 'daemon', 20000, 'motorcycles', NULL, NULL),
(75, 'motodealer', 'Daemon High', 'daemon2', 30000, 'motorcycles', NULL, NULL),
(76, 'motodealer', 'Defiler', 'defiler', 30000, 'motorcycles', NULL, NULL),
(78, 'cardealer', 'deviant', 'deviant', 45000, 'muscle', NULL, NULL),
(79, 'motodealer', 'diablous', 'diablous', 45000, 'motorcycles', NULL, NULL),
(80, 'motodealer', 'diablous2', 'diablous2', 45000, 'motorcycles', NULL, NULL),
(81, 'cardealer', 'dilettante', 'dilettante', 8000, 'compacts', NULL, NULL),
(82, 'cardealer', 'dloader', 'dloader', 45000, 'offroad', NULL, NULL),
(83, 'cardealer', 'Dominator', 'dominator', 35000, 'muscle', NULL, NULL),
(84, 'cardealer', 'dominator2', 'dominator2', 45000, 'muscle', NULL, NULL),
(85, 'cardealer', 'dominator3', 'dominator3', 45000, 'muscle', NULL, NULL),
(86, 'motodealer', 'Double T', 'double', 28000, 'motorcycles', NULL, NULL),
(87, 'cardealer', 'drafter', 'drafter', 90000, 'sports', NULL, NULL),
(88, 'cardealer', 'Dubsta', 'dubsta', 45000, 'suvs', NULL, NULL),
(89, 'cardealer', 'Dubsta Luxuary', 'dubsta2', 90000, 'suvs', NULL, NULL),
(90, 'cardealer', 'Bubsta 6x6', 'dubsta3', 120000, 'offroad', NULL, NULL),
(91, 'cardealer', 'Dukes', 'dukes', 28000, 'muscle', NULL, NULL),
(92, 'cardealer', 'dukes3', 'dukes3', 45000, 'muscle', NULL, NULL),
(93, 'cardealer', 'Dune Buggy', 'dune', 8000, 'offroad', NULL, NULL),
(94, 'cardealer', 'dynasty', 'dynasty', 20000, 'sports', NULL, NULL),
(95, 'cardealer', 'Elegy', 'elegy', 90000, 'sports', NULL, NULL),
(96, 'cardealer', 'Elegy sport', 'elegy2', 95000, 'sports', NULL, NULL),
(97, 'cardealer', 'ellie', 'ellie', 45000, 'muscle', NULL, NULL),
(99, 'cardealer', 'Emperor', 'emperor', 8500, 'sedans', NULL, NULL),
(100, 'cardealer', 'emperor2', 'emperor2', 45000, 'sedans', NULL, NULL),
(101, 'motodealer', 'Enduro', 'enduro', 5500, 'motorcycles', NULL, NULL),
(104, 'motodealer', 'Esskey', 'esskey', 4200, 'motorcycles', NULL, NULL),
(105, 'cardealer', 'everon', 'everon', 45000, 'offroad', NULL, NULL),
(106, 'cardealer', 'Exemplar', 'exemplar', 56000, 'coupes', NULL, NULL),
(107, 'cardealer', 'F620', 'f620', 40000, 'coupes', NULL, NULL),
(108, 'cardealer', 'Faction', 'faction', 20000, 'muscle', NULL, NULL),
(109, 'cardealer', 'Faction Rider', 'faction2', 30000, 'muscle', NULL, NULL),
(110, 'cardealer', 'fagaloa', 'fagaloa', 20000, 'sports', NULL, NULL),
(112, 'motodealer', 'Faggio', 'faggio', 1900, 'motorcycles', NULL, NULL),
(113, 'motodealer', 'Vespa', 'faggio2', 2800, 'motorcycles', NULL, NULL),
(114, 'motodealer', 'faggio3', 'faggio3', 7000, 'motorcycles', NULL, NULL),
(115, 'motodealer', 'fcr', 'fcr', 45000, 'motorcycles', NULL, NULL),
(116, 'motodealer', 'fcr2', 'fcr2', 45000, 'motorcycles', NULL, NULL),
(117, 'cardealer', 'Felon', 'felon', 42000, 'coupes', NULL, NULL),
(118, 'cardealer', 'Felon GT', 'felon2', 55000, 'coupes', NULL, NULL),
(119, 'cardealer', 'Feltzer', 'feltzer2', 55000, 'sports', NULL, NULL),
(120, 'cardealer', 'Stirling GT', 'feltzer3', 65000, 'sportsclassics', NULL, NULL),
(121, 'cardealer', 'Fixter', 'fixter', 225, 'motorcycles', NULL, NULL),
(122, 'cardealer', 'flashgt', 'flashgt', 55000, 'sports', NULL, NULL),
(124, 'cardealer', 'Fhantom', 'fq2', 17000, 'suvs', NULL, NULL),
(125, 'cardealer', 'freecrawler', 'freecrawler', 45000, 'offroad', NULL, NULL),
(126, 'cardealer', 'Fugitive', 'fugitive', 12000, 'sedans', NULL, NULL),
(128, 'cardealer', 'Furore GT', 'furoregt', 45000, 'sports', NULL, NULL),
(129, 'cardealer', 'Fusilade', 'fusilade', 40000, 'sports', NULL, NULL),
(130, 'cardealer', 'futo', 'futo', 31000, 'sports', NULL, NULL),
(131, 'motodealer', 'Gargoyle', 'gargoyle', 16500, 'motorcycles', NULL, NULL),
(132, 'cardealer', 'Gauntlet', 'gauntlet', 30000, 'muscle', NULL, NULL),
(133, 'cardealer', 'gauntlet2', 'gauntlet2', 45000, 'muscle', NULL, NULL),
(134, 'cardealer', 'gauntlet3', 'gauntlet3', 45000, 'muscle', NULL, NULL),
(135, 'cardealer', 'gauntlet4', 'gauntlet4', 45000, 'muscle', NULL, NULL),
(136, 'cardealer', 'gauntlet5', 'gauntlet5', 45000, 'muscle', NULL, NULL),
(137, 'cardealer', 'gb200', 'gb200', 45000, 'sports', NULL, NULL),
(138, 'cardealer', 'Gang Burrito', 'gburrito', 45000, 'vans', NULL, NULL),
(139, 'cardealer', 'Burrito', 'gburrito2', 29000, 'vans', NULL, NULL),
(140, 'cardealer', 'Glendale', 'glendale', 16500, 'sedans', NULL, NULL),
(141, 'cardealer', 'glendale2', 'glendale2', 45000, 'sedans', NULL, NULL),
(142, 'cardealer', 'gp1', 'gp1', 112000, 'super', NULL, NULL),
(143, 'cardealer', 'Grabger', 'granger', 50000, 'suvs', NULL, NULL),
(144, 'cardealer', 'Gresley', 'gresley', 47500, 'suvs', NULL, NULL),
(145, 'cardealer', 'GT 500', 'gt500', 78500, 'sportsclassics', NULL, NULL),
(146, 'cardealer', 'Guardian', 'guardian', 235000, 'offroad', NULL, NULL),
(147, 'cardealer', 'habanero', 'habanero', 45000, 'suvs', NULL, NULL),
(148, 'motodealer', 'Hakuchou', 'hakuchou', 75000, 'motorcycles', NULL, NULL),
(149, 'motodealer', 'Hakuchou Sport', 'hakuchou2', 150000, 'motorcycles', NULL, NULL),
(150, 'cardealer', 'hellion', 'hellion', 45000, 'offroad', NULL, NULL),
(151, 'cardealer', 'Hermes', 'hermes', 255000, 'muscle', NULL, NULL),
(152, 'motodealer', 'Hexer', 'hexer', 12000, 'motorcycles', NULL, NULL),
(153, 'cardealer', 'Hotknife', 'hotknife', 125000, 'muscle', NULL, NULL),
(154, 'cardealer', 'hotring', 'hotring', 42000, 'sports', NULL, NULL),
(155, 'cardealer', 'Huntley S', 'huntley', 40000, 'suvs', NULL, NULL),
(156, 'cardealer', 'Hustler', 'hustler', 290000, 'muscle', NULL, NULL),
(157, 'cardealer', 'imorgon', 'imorgon', 70000, 'sports', NULL, NULL),
(158, 'cardealer', 'impaler', 'impaler', 45000, 'muscle', NULL, NULL),
(159, 'cardealer', 'Infernus', 'infernus', 180000, 'super', NULL, NULL),
(160, 'cardealer', 'infernus2', 'infernus2', 142000, 'sports', NULL, NULL),
(161, 'cardealer', 'ingot', 'ingot', 45000, 'sedans', NULL, NULL),
(162, 'motodealer', 'Innovation', 'innovation', 23500, 'motorcycles', NULL, NULL),
(163, 'cardealer', 'Intruder', 'intruder', 7500, 'sedans', NULL, NULL),
(164, 'cardealer', 'Issi', 'issi2', 10000, 'compacts', NULL, NULL),
(165, 'cardealer', 'issi3', 'issi3', 8000, 'compacts', NULL, NULL),
(166, 'cardealer', 'issi7', 'issi7', 80000, 'sports', NULL, NULL),
(167, 'cardealer', 'italigtb', 'italigtb', 129000, 'super', NULL, NULL),
(168, 'cardealer', 'italigtb2', 'italigtb2', 120000, 'super', NULL, NULL),
(169, 'cardealer', 'italigto', 'italigto', 110000, 'sports', NULL, NULL),
(171, 'cardealer', 'Jackal', 'jackal', 38000, 'coupes', NULL, NULL),
(172, 'cardealer', 'Jester', 'jester', 65000, 'sports', NULL, NULL),
(174, 'cardealer', 'jester3', 'jester3', 42000, 'sports', NULL, NULL),
(175, 'cardealer', 'Journey', 'journey', 6500, 'vans', NULL, NULL),
(176, 'cardealer', 'jugular', 'jugular', 165000, 'sports', NULL, NULL),
(177, 'cardealer', 'kalahari', 'kalahari', 45000, 'offroad', NULL, NULL),
(178, 'cardealer', 'Kamacho', 'kamacho', 170000, 'offroad', NULL, NULL),
(179, 'cardealer', 'kanjo', 'kanjo', 8000, 'compacts', NULL, NULL),
(180, 'cardealer', 'Khamelion', 'khamelion', 83000, 'sports', NULL, NULL),
(181, 'cardealer', 'komoda', 'komoda', 95000, 'sports', NULL, NULL),
(183, 'cardealer', 'Kuruma', 'kuruma', 100000, 'sports', NULL, NULL),
(184, 'cardealer', 'Landstalker', 'landstalker', 35000, 'suvs', NULL, NULL),
(185, 'cardealer', 'landstalker2', 'landstalker2', 45000, 'suvs', NULL, NULL),
(187, 'cardealer', 'locust', 'locust', 70000, 'sports', NULL, NULL),
(188, 'cardealer', 'Lynx', 'lynx', 50000, 'sports', NULL, NULL),
(189, 'cardealer', 'Mamba', 'mamba', 70000, 'sports', NULL, NULL),
(192, 'motodealer', 'Manchez', 'manchez', 5300, 'motorcycles', NULL, NULL),
(193, 'motodealer', 'Manchez2', 'manchez2', 14000, 'motorcycles', NULL, NULL),
(194, 'cardealer', 'Massacro', 'massacro', 65000, 'sports', NULL, NULL),
(196, 'cardealer', 'Mesa', 'mesa', 16000, 'suvs', NULL, NULL),
(197, 'cardealer', 'Mesa Trail', 'mesa3', 40000, 'suvs', NULL, NULL),
(198, 'cardealer', 'michelli', 'michelli', 31000, 'sports', NULL, NULL),
(199, 'cardealer', 'Minivan', 'minivan', 13000, 'vans', NULL, NULL),
(200, 'cardealer', 'minivan2', 'minivan2', 20000, 'vans', NULL, NULL),
(201, 'cardealer', 'Monroe', 'monroe', 55000, 'sportsclassics', NULL, NULL),
(202, 'cardealer', 'Moonbeam', 'moonbeam', 18000, 'vans', NULL, NULL),
(203, 'cardealer', 'Moonbeam Rider', 'moonbeam2', 35000, 'vans', NULL, NULL),
(204, 'cardealer', 'nebula', 'nebula', 31000, 'sports', NULL, NULL),
(205, 'motodealer', 'Nemesis', 'nemesis', 25000, 'motorcycles', NULL, NULL),
(206, 'cardealer', 'Neon', 'neon', 150000, 'sports', NULL, NULL),
(209, 'motodealer', 'Nightblade', 'nightblade', 65000, 'motorcycles', NULL, NULL),
(210, 'cardealer', 'Nightshade', 'nightshade', 65000, 'muscle', NULL, NULL),
(211, 'cardealer', '9F', 'ninef', 85000, 'sports', NULL, NULL),
(212, 'cardealer', '9F Cabrio', 'ninef2', 95000, 'sports', NULL, NULL),
(213, 'cardealer', 'novak', 'novak', 45000, 'suvs', NULL, NULL),
(214, 'cardealer', 'Omnis', 'omnis', 45000, 'sports', NULL, NULL),
(216, 'cardealer', 'oracle', 'oracle', 45000, 'coupes', NULL, NULL),
(217, 'cardealer', 'Oracle XS', 'oracle2', 35000, 'coupes', NULL, NULL),
(219, 'cardealer', 'outlaw', 'outlaw', 45000, 'offroad', NULL, NULL),
(220, 'cardealer', 'Panto', 'panto', 5000, 'compacts', NULL, NULL),
(222, 'cardealer', 'paragon', 'paragon', 115000, 'sports', NULL, NULL),
(223, 'cardealer', 'Pariah', 'pariah', 142000, 'sports', NULL, NULL),
(224, 'cardealer', 'Patriot', 'patriot', 55000, 'suvs', NULL, NULL),
(225, 'cardealer', 'patriot2', 'patriot2', 125000, 'suvs', NULL, NULL),
(226, 'motodealer', 'PCJ-600', 'pcj', 10800, 'motorcycles', NULL, NULL),
(227, 'cardealer', 'penetrator', 'penetrator', 142000, 'super', NULL, NULL),
(228, 'cardealer', 'Penumbra', 'penumbra', 28000, 'sports', NULL, NULL),
(229, 'cardealer', 'penumbra2', 'penumbra2', 32500, 'sports', NULL, NULL),
(230, 'cardealer', 'peyote', 'peyote', 20000, 'sports', NULL, NULL),
(231, 'cardealer', 'peyote2', 'peyote2', 45000, 'muscle', NULL, NULL),
(234, 'cardealer', 'Phoenix', 'phoenix', 12500, 'muscle', NULL, NULL),
(235, 'cardealer', 'Picador', 'picador', 18000, 'muscle', NULL, NULL),
(236, 'cardealer', 'Pigalle', 'pigalle', 20000, 'sportsclassics', NULL, NULL),
(239, 'cardealer', 'Prairie', 'prairie', 12000, 'compacts', NULL, NULL),
(240, 'cardealer', 'Premier', 'premier', 18000, 'sedans', NULL, NULL),
(241, 'cardealer', 'primo', 'primo', 35000, 'sedans', NULL, NULL),
(242, 'cardealer', 'Primo Custom', 'primo2', 45000, 'sedans', NULL, NULL),
(244, 'cardealer', 'Radius', 'radi', 29000, 'suvs', NULL, NULL),
(245, 'cardealer', 'raiden', 'raiden', 137500, 'sports', NULL, NULL),
(246, 'cardealer', 'rancherxl', 'rancherxl', 45000, 'offroad', NULL, NULL),
(247, 'cardealer', 'Rapid GT', 'rapidgt', 87000, 'sports', NULL, NULL),
(251, 'motodealer', 'ratbike', 'ratbike', 45000, 'motorcycles', NULL, NULL),
(252, 'cardealer', 'ratloader', 'ratloader', 45000, 'muscle', NULL, NULL),
(253, 'cardealer', 'ratloader2', 'ratloader2', 45000, 'muscle', NULL, NULL),
(254, 'cardealer', 'Reaper', 'reaper', 150000, 'super', NULL, NULL),
(255, 'cardealer', 'rebel', 'rebel', 45000, 'offroad', NULL, NULL),
(256, 'cardealer', 'Rebel', 'rebel2', 35000, 'offroad', NULL, NULL),
(257, 'cardealer', 'rebla', 'rebla', 45000, 'suvs', NULL, NULL),
(258, 'cardealer', 'Regina', 'regina', 5000, 'sedans', NULL, NULL),
(261, 'cardealer', 'Revolter', 'revolter', 161000, 'sports', NULL, NULL),
(262, 'cardealer', 'rhapsody', 'rhapsody', 8000, 'compacts', NULL, NULL),
(263, 'cardealer', 'riata', 'riata', 165000, 'offroad', NULL, NULL),
(264, 'cardealer', 'Rocoto', 'rocoto', 45000, 'suvs', NULL, NULL),
(265, 'motodealer', 'Ruffian', 'ruffian', 13900, 'motorcycles', NULL, NULL),
(266, 'cardealer', 'ruiner', 'ruiner', 45000, 'muscle', NULL, NULL),
(268, 'cardealer', 'Rumpo', 'rumpo', 15000, 'vans', NULL, NULL),
(270, 'cardealer', 'ruston', 'ruston', 55000, 'sports', NULL, NULL),
(272, 'cardealer', 'Sabre Turbo', 'sabregt', 20000, 'muscle', NULL, NULL),
(273, 'cardealer', 'Sabre GT', 'sabregt2', 25000, 'muscle', NULL, NULL),
(274, 'motodealer', 'Sanchez', 'sanchez', 9000, 'motorcycles', NULL, NULL),
(275, 'motodealer', 'Sanchez Sport', 'sanchez2', 10000, 'motorcycles', NULL, NULL),
(276, 'motodealer', 'Sanctus', 'sanctus', 50000, 'motorcycles', NULL, NULL),
(277, 'cardealer', 'Sandking', 'sandking', 55000, 'offroad', NULL, NULL),
(278, 'cardealer', 'sandking2', 'sandking2', 45000, 'offroad', NULL, NULL),
(280, 'cardealer', 'SC1', 'sc1', 160300, 'super', NULL, NULL),
(281, 'cardealer', 'Schafter', 'schafter2', 25000, 'sedans', NULL, NULL),
(282, 'cardealer', 'Schafter V12', 'schafter3', 50000, 'sports', NULL, NULL),
(283, 'cardealer', 'schafter4', 'schafter4', 55000, 'sports', NULL, NULL),
(284, 'cardealer', 'schlagen', 'schlagen', 82000, 'sports', NULL, NULL),
(286, 'cardealer', 'Scorcher', 'scorcher', 280, 'motorcycles', NULL, NULL),
(287, 'cardealer', 'Seminole', 'seminole', 25000, 'suvs', NULL, NULL),
(288, 'cardealer', 'seminole2', 'seminole2', 45000, 'suvs', NULL, NULL),
(289, 'cardealer', 'Sentinel', 'sentinel', 32000, 'coupes', NULL, NULL),
(290, 'cardealer', 'Sentinel XS', 'sentinel2', 40000, 'coupes', NULL, NULL),
(292, 'cardealer', 'serrano', 'serrano', 45000, 'suvs', NULL, NULL),
(293, 'cardealer', 'Seven 70', 'seven70', 69000, 'sports', NULL, NULL),
(294, 'cardealer', 'ETR1', 'sheava', 220000, 'super', NULL, NULL),
(295, 'cardealer', 'Slam Van', 'slamvan3', 21000, 'muscle', NULL, NULL),
(296, 'motodealer', 'Sovereign', 'sovereign', 35000, 'motorcycles', NULL, NULL),
(297, 'cardealer', 'specter', 'specter', 45000, 'sports', NULL, NULL),
(299, 'cardealer', 'speedo', 'speedo', 20000, 'vans', NULL, NULL),
(300, 'cardealer', 'speedo2', 'speedo2', 20000, 'vans', NULL, NULL),
(302, 'cardealer', 'squaddie', 'squaddie', 45000, 'suvs', NULL, NULL),
(303, 'cardealer', 'stafford', 'stafford', 45000, 'sedans', NULL, NULL),
(304, 'cardealer', 'stalion', 'stalion', 45000, 'muscle', NULL, NULL),
(305, 'cardealer', 'Stalion2', 'stalion2', 45000, 'muscle', NULL, NULL),
(306, 'cardealer', 'stanier', 'stanier', 45000, 'sedans', NULL, NULL),
(307, 'cardealer', 'Stinger', 'stinger', 80000, 'sportsclassics', NULL, NULL),
(308, 'cardealer', 'Stinger GT', 'stingergt', 75000, 'sportsclassics', NULL, NULL),
(309, 'cardealer', 'stratum', 'stratum', 45000, 'sedans', NULL, NULL),
(310, 'cardealer', 'Streiter', 'streiter', 125000, 'sports', NULL, NULL),
(311, 'cardealer', 'Stretch', 'stretch', 125000, 'sedans', NULL, NULL),
(312, 'motodealer', 'stryder', 'stryder', 55000, 'motorcycles', NULL, NULL),
(313, 'cardealer', 'sugoi', 'sugoi', 29000, 'sports', NULL, NULL),
(314, 'cardealer', 'Sultan', 'sultan', 61000, 'sports', NULL, NULL),
(315, 'cardealer', 'sultan2', 'sultan2', 20000, 'sports', NULL, NULL),
(316, 'cardealer', 'Sultan RS', 'sultanrs', 85000, 'sports', NULL, NULL),
(317, 'cardealer', 'Super Diamond', 'superd', 130000, 'sedans', NULL, NULL),
(318, 'cardealer', 'Surano', 'surano', 50000, 'sports', NULL, NULL),
(319, 'cardealer', 'Surfer', 'surfer', 12000, 'vans', NULL, NULL),
(321, 'cardealer', 'surge', 'surge', 45000, 'sedans', NULL, NULL),
(322, 'cardealer', 'swinger', 'swinger', 37000, 'sports', NULL, NULL),
(325, 'cardealer', 'Tailgater', 'tailgater', 30000, 'sedans', NULL, NULL),
(327, 'cardealer', 'Tampa', 'tampa', 16000, 'muscle', NULL, NULL),
(328, 'cardealer', 'Drift Tampa', 'tampa2', 80000, 'sports', NULL, NULL),
(329, 'cardealer', 'tempesta', 'tempesta', 185000, 'super', NULL, NULL),
(332, 'motodealer', 'Thrust', 'thrust', 24000, 'motorcycles', NULL, NULL),
(334, 'cardealer', 'torero', 'torero', 98000, 'sports', NULL, NULL),
(335, 'cardealer', 'tornado', 'tornado', 20000, 'sports', NULL, NULL),
(340, 'cardealer', 'tornado6', 'tornado6', 45000, 'sports', NULL, NULL),
(341, 'cardealer', 'toros', 'toros', 91000, 'suvs', NULL, NULL),
(342, 'cardealer', 'Tri bike', 'tribike', 520, 'motorcycles', NULL, NULL),
(343, 'cardealer', 'Tri bike', 'tribike2', 520, 'motorcycles', NULL, NULL),
(344, 'cardealer', 'Tri bike', 'tribike3', 520, 'motorcycles', NULL, NULL),
(345, 'cardealer', 'Trophy Truck', 'trophytruck', 60000, 'offroad', NULL, NULL),
(346, 'cardealer', 'Trophy Truck Limited', 'trophytruck2', 80000, 'offroad', NULL, NULL),
(347, 'cardealer', 'Tropos', 'tropos', 40000, 'sports', NULL, NULL),
(348, 'cardealer', 'tulip', 'tulip', 45000, 'muscle', NULL, NULL),
(349, 'cardealer', 'turismo2', 'turismo2', 122000, 'sports', NULL, NULL),
(354, 'motodealer', 'Vader', 'vader', 12200, 'motorcycles', NULL, NULL),
(356, 'cardealer', 'vagrant', 'vagrant', 45000, 'offroad', NULL, NULL),
(357, 'cardealer', 'vamos', 'vamos', 45000, 'muscle', NULL, NULL),
(358, 'cardealer', 'Verlierer', 'verlierer2', 70000, 'sports', NULL, NULL),
(359, 'cardealer', 'verus', 'verus', 45000, 'offroad', NULL, NULL),
(360, 'cardealer', 'Vigero', 'vigero', 12500, 'muscle', NULL, NULL),
(361, 'motodealer', 'vindicator', 'vindicator', 45000, 'motorcycles', NULL, NULL),
(362, 'cardealer', 'Virgo', 'virgo', 14000, 'muscle', NULL, NULL),
(363, 'cardealer', 'virgo2', 'virgo2', 45000, 'muscle', NULL, NULL),
(364, 'cardealer', 'virgo3', 'virgo3', 45000, 'muscle', NULL, NULL),
(365, 'cardealer', 'Viseris', 'viseris', 87500, 'sportsclassics', NULL, NULL),
(367, 'cardealer', 'Voltic', 'voltic', 90000, 'super', NULL, NULL),
(368, 'cardealer', 'Voodoo', 'voodoo', 22000, 'muscle', NULL, NULL),
(370, 'motodealer', 'Vortex', 'vortex', 9800, 'motorcycles', NULL, NULL),
(371, 'cardealer', 'vstr', 'vstr', 115000, 'sports', NULL, NULL),
(372, 'cardealer', 'Warrener', 'warrener', 4000, 'sedans', NULL, NULL),
(373, 'cardealer', 'Washington', 'washington', 9000, 'sedans', NULL, NULL),
(374, 'cardealer', 'weevil', 'weevil', 8000, 'compacts', NULL, NULL),
(375, 'cardealer', 'Windsor', 'windsor', 95000, 'coupes', NULL, NULL),
(376, 'cardealer', 'Windsor Drop', 'windsor2', 125000, 'coupes', NULL, NULL),
(377, 'cardealer', 'winky', 'winky', 45000, 'offroad', NULL, NULL),
(378, 'motodealer', 'Woflsbane', 'wolfsbane', 9000, 'motorcycles', NULL, NULL),
(379, 'cardealer', 'xa21', 'xa21', 70000, 'super', NULL, NULL),
(380, 'cardealer', 'XLS', 'xls', 32000, 'suvs', NULL, NULL),
(381, 'cardealer', 'Yosemite', 'yosemite', 101000, 'muscle', NULL, NULL),
(382, 'cardealer', 'yosemite2', 'yosemite2', 45000, 'muscle', NULL, NULL),
(383, 'cardealer', 'yosemite3', 'yosemite3', 45000, 'muscle', NULL, NULL),
(384, 'cardealer', 'Youga', 'youga', 10800, 'vans', NULL, NULL),
(385, 'cardealer', 'Youga Luxuary', 'youga2', 14500, 'vans', NULL, NULL),
(386, 'cardealer', 'youga3', 'youga3', 20000, 'vans', NULL, NULL),
(387, 'cardealer', 'Z190', 'z190', 90000, 'sportsclassics', NULL, NULL),
(389, 'cardealer', 'Zion', 'zion', 36000, 'coupes', NULL, NULL),
(390, 'cardealer', 'Zion Cabrio', 'zion2', 45000, 'coupes', NULL, NULL),
(391, 'cardealer', 'zion3', 'zion3', 90000, 'sports', NULL, NULL),
(392, 'motodealer', 'Zombie', 'zombiea', 9500, 'motorcycles', NULL, NULL),
(393, 'motodealer', 'Zombie Luxuary', 'zombieb', 12000, 'motorcycles', NULL, NULL),
(394, 'cardealer', 'zorrusso', 'zorrusso', 109000, 'super', NULL, NULL),
(395, 'cardealer', 'caracara2', 'caracara2', 55000, 'offroad', NULL, NULL),
(396, 'cardealer', 'Z-Type', 'ztype', 220000, 'sportsclassics', NULL, NULL),
(397, 'cardealer', 'comet6', 'comet6', 182000, 'sports', NULL, NULL),
(398, 'cardealer', 'dominator7', 'dominator7', 72000, 'sports', NULL, NULL),
(399, 'cardealer', 'dominator8', 'dominator8', 67000, 'sports', NULL, NULL),
(400, 'cardealer', 'euros', 'euros', 28000, 'sports', NULL, NULL),
(401, 'cardealer', 'futo2', 'futo2', 21000, 'compact', NULL, NULL),
(402, 'cardealer', 'rt3000', 'rt3000', 2000, 'sports', NULL, NULL),
(403, 'cardealer', 'sultan3', 'sultan3', 60000, 'sports', NULL, NULL),
(404, 'cardealer', 'tailgater2', 'tailgater2', 100000, 'sports', NULL, NULL),
(406, 'cardealer', 'vectre', 'vectre', 42000, 'sports', NULL, NULL),
(407, 'cardealer', 'remus', 'remus', 30000, 'sports', NULL, NULL),
(408, 'cardealer', 'calico', 'calico', 38000, 'sports', NULL, NULL),
(409, 'cardealer', 'cypher', 'cypher', 90000, 'sports', NULL, NULL),
(410, 'cardealer', 'jester4', 'jester4', 49000, 'sports', NULL, NULL),
(411, 'cardealer', 'zr350', 'zr350', 43000, 'sports', NULL, NULL),
(414, 'cardealer', 'Pfister Astron', 'astron', 103000, 'SUVs', NULL, NULL),
(415, 'cardealer', 'Gallivanter Baller ST', 'baller7', 55000, 'SUVs', NULL, NULL),
(416, 'cardealer', 'Bravado Buffalo STX', 'buffalo4', 42000, 'Muscle', NULL, NULL),
(418, 'cardealer', 'Lampadati Cinquemila', 'cinquemila', 65000, 'Sedans', NULL, NULL),
(419, 'cardealer', 'Pfister Comet S2 Cabrio', 'comet7', 137000, 'Sports', NULL, NULL),
(420, 'cardealer', 'Enus Deity', 'deity', 69000, 'Sedans', NULL, NULL),
(421, 'cardealer', 'Declasse Granger 3600LX', 'granger2', 65000, 'SUVs', NULL, NULL),
(423, 'cardealer', 'Obey IWagen', 'iwagen', 66000, 'SUVs', NULL, NULL),
(424, 'cardealer', 'Enus Jubilee', 'jubilee', 67000, 'SUVs', NULL, NULL),
(425, 'cardealer', 'Maibatsu Mule', 'mule5', 20000, 'Commercial', NULL, NULL),
(427, 'motodealer', 'Western Reever', 'reever', 20000, 'Motorcycles', NULL, NULL),
(428, 'motodealer', 'Nagasaki Shinobi', 'shinobi', 29000, 'Motorcycles', NULL, NULL),
(429, 'cardealer', 'Vapid Youga Custom', 'youga4', 20000, 'Vans', NULL, NULL),
(526, 'boatdealer', 'Toro', 'Toro2', 500000, 'boat', NULL, NULL),
(527, 'boatdealer', 'Speeder', 'speeder', 325000, 'boat', NULL, NULL),
(528, 'boatdealer', 'SeaShark V2', 'seashark2', 125000, 'boat', NULL, NULL),
(529, 'boatdealer', 'Marquis Voilier', 'marquis', 250000, 'boat', NULL, NULL),
(530, 'boatdealer', 'JetMax', 'jetmax', 300000, 'boat', NULL, NULL),
(532, 'boatdealer', 'Dinghy Super', 'dinghy4', 250000, 'boat', NULL, NULL),
(539, 'airdealer', 'Frogger', 'frogger', 610000, 'aircraft', NULL, NULL),
(540, 'airdealer', 'Frogger 2', 'frogger2', 800000, 'aircraft', NULL, NULL),
(541, 'airdealer', 'Havok', 'havok', 210000, 'aircraft', NULL, NULL),
(542, 'airdealer', 'Maverick', 'maverick', 750000, 'aircraft', NULL, NULL),
(545, 'airdealer', 'Supervolito 2', 'supervolito2', 1000000, 'aircraft', NULL, NULL),
(546, 'airdealer', 'Swift', 'swift', 1200000, 'aircraft', NULL, NULL),
(547, 'airdealer', 'Volatus', 'volatus', 2000000, 'aircraft', NULL, NULL),
(548, 'airdealer', 'Delta plane', 'microlight', 400000, 'aircraft', NULL, NULL),
(549, 'airdealer', 'AlphaZ1', 'alphaz1', 500000, 'aircraft', NULL, NULL),
(550, 'airdealer', 'Cuban 800', 'cuban800', 450000, 'aircraft', NULL, NULL),
(551, 'airdealer', 'Dodo', 'dodo', 550000, 'aircraft', NULL, NULL),
(552, 'airdealer', 'Duster', 'duster', 190000, 'aircraft', NULL, NULL),
(556, 'airdealer', 'Mammatus', 'mammatus', 400000, 'aircraft', NULL, NULL),
(563, 'airdealer', 'Velum sport', 'velum2', 700000, 'aircraft', NULL, NULL),
(564, 'airdealer', 'Vestra', 'vestra', 1000000, 'aircraft', NULL, NULL),
(565, 'airdealer', 'Swift 2', 'swift2', 1500000, 'aircraft', NULL, NULL),
(569, 'boatdealer', 'Yatch Semi-Luxe', 'sr650fly', 4000000, 'boat', NULL, NULL),
(638, 'cardealer', 'tyrus', 'tyrus', 340000, 'super', NULL, NULL),
(639, 'cardealer', 'tyrant', 'tyrant', 275000, 'super', NULL, NULL),
(640, 'cardealer', 'growler', 'growler', 100000, 'sports', NULL, NULL),
(641, 'cardealer', 'coquette4', 'coquette4', 410000, 'super', NULL, NULL),
(651, 'boatdealer', 'Suntrap', 'suntrap', 250000, 'boat', NULL, NULL),
(652, 'boatdealer', 'Longfin', 'longfin', 700000, 'boat', NULL, NULL),
(653, 'boatdealer', 'SeaShark V1', 'seashark', 100000, 'boat', NULL, NULL),
(656, 'cardealer', 'Buffalo H', 'buffaloh', 96000, 'Imports', NULL, NULL),
(657, 'cardealer', 'Cypher CT', 'cypherct', 85000, 'Imports', NULL, NULL),
(658, 'cardealer', 'Audace', 'audace', 268000, 'Imports', NULL, NULL),
(659, 'cardealer', 'Astero ', 'asteropers', 145000, 'Imports', NULL, NULL),
(660, 'cardealer', 'Argento', 'argento', 366000, 'Imports', NULL, NULL),
(661, 'cardealer', 'Gresley H', 'gresleyh', 125000, 'Imports', NULL, NULL),
(662, 'cardealer', 'GTorino', 'gtorino76', 55000, 'Imports', NULL, NULL),
(663, 'cardealer', 'Burrito 6', 'burrito6', 86000, 'Imports', NULL, NULL),
(664, 'cardealer', 'New Speedo', 'nspeedo', 85000, 'ENTREPRISE', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vehicules_categories`
--

CREATE TABLE `vehicules_categories` (
  `job` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicules_categories`
--

INSERT INTO `vehicules_categories` (`job`, `name`, `label`) VALUES
('cardealer', 'compacts', 'Compacts'),
('cardealer', 'coupes', 'Coupés'),
('boutique', 'imports', 'Boutique'),
('motodealer', 'motorcycles', 'Moto'),
('cardealer', 'muscle', 'Muscle'),
('cardealer', 'offroad', 'Off Road'),
('cardealer', 'sedans', 'Sedans'),
('cardealer', 'sports', 'Sports'),
('cardealer', 'sportsclassics', 'Sports Classics'),
('cardealer', 'super', 'Super'),
('cardealer', 'suvs', 'SUVs'),
('cardealer', 'vans', 'Vans');

-- --------------------------------------------------------

--
-- Structure de la table `vente_leboncoin`
--

CREATE TABLE `vente_leboncoin` (
  `price` longtext DEFAULT NULL,
  `id` longtext DEFAULT NULL,
  `identifier` int(11) NOT NULL,
  `UniqueID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vips`
--

CREATE TABLE `vips` (
  `UniqueID` int(11) NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  `money` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vips`
--

INSERT INTO `vips` (`UniqueID`, `time`, `money`) VALUES
(1, 680, 1),
(5, 19576, 1),
(6, 819, 1),
(56, 99626, 0),
(57, 99626, 1),
(61, 727, 0),
(62, 733, 0),
(65, 708, 0),
(66, 999756, 0);

-- --------------------------------------------------------

--
-- Structure de la table `weapon_confiscate`
--

CREATE TABLE `weapon_confiscate` (
  `id` int(255) NOT NULL,
  `uniqueid` varchar(255) NOT NULL,
  `weapon_name` varchar(255) NOT NULL,
  `time` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_accounts`
--

CREATE TABLE `whatsapp_accounts` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_chats`
--

CREATE TABLE `whatsapp_chats` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `messages` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_groups`
--

CREATE TABLE `whatsapp_groups` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_groups_messages`
--

CREATE TABLE `whatsapp_groups_messages` (
  `id` int(11) NOT NULL,
  `id_group` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `read` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_groups_users`
--

CREATE TABLE `whatsapp_groups_users` (
  `number_group` varchar(50) NOT NULL,
  `admin` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_stories`
--

CREATE TABLE `whatsapp_stories` (
  `phone` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `world_props`
--

CREATE TABLE `world_props` (
  `id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `owner` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `iid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `yellowpages_posts`
--

CREATE TABLE `yellowpages_posts` (
  `id` int(11) NOT NULL,
  `owner` text NOT NULL,
  `mesaj` text NOT NULL,
  `isim` text NOT NULL,
  `telno` text NOT NULL,
  `resim` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `zban`
--

CREATE TABLE `zban` (
  `uniqueid` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `perm` tinyint(1) DEFAULT 0,
  `reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `zban`
--

INSERT INTO `zban` (`uniqueid`, `identifier`, `time`, `perm`, `reason`) VALUES
(81, 'license:00d9600f850d8173f68600a73d87c78b3c61ddbd', 0, 1, 'Cheat'),
(88, 'license:94d14b305f5b3a63308e74380850be8d0da35584', 0, 1, 'Pas bien de voulour utiliser les Triggers :)'),
(106, 'license:853671c844ddc2899aed7c6bfb049e21b60dd6b1', 0, 1, 'Pas bien de voulour utiliser les Triggers :)');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin_jails`
--
ALTER TABLE `admin_jails`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `appel_jobs`
--
ALTER TABLE `appel_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bcso_plainte`
--
ALTER TABLE `bcso_plainte`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `blanchiment`
--
ALTER TABLE `blanchiment`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `boat_categories`
--
ALTER TABLE `boat_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `boutique`
--
ALTER TABLE `boutique`
  ADD PRIMARY KEY (`citizenID`),
  ADD UNIQUE KEY `boutique_code` (`boutique_code`);

--
-- Index pour la table `chasse`
--
ALTER TABLE `chasse`
  ADD UNIQUE KEY `uniqueid` (`uniqueid`);

--
-- Index pour la table `clothes_inventory`
--
ALTER TABLE `clothes_inventory`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `darkchat_messages`
--
ALTER TABLE `darkchat_messages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Index pour la table `drugs_sell`
--
ALTER TABLE `drugs_sell`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `elevators`
--
ALTER TABLE `elevators`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `elevator_floors`
--
ALTER TABLE `elevator_floors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elevator_id` (`elevator_id`);

--
-- Index pour la table `exodia_clothes`
--
ALTER TABLE `exodia_clothes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `exodia_trunk`
--
ALTER TABLE `exodia_trunk`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gangs_new`
--
ALTER TABLE `gangs_new`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `garages`
--
ALTER TABLE `garages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `illegal_drugs_sell`
--
ALTER TABLE `illegal_drugs_sell`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `illegal_laboratory`
--
ALTER TABLE `illegal_laboratory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `instagram_posts`
--
ALTER TABLE `instagram_posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `instagram_stories`
--
ALTER TABLE `instagram_stories`
  ADD PRIMARY KEY (`owner`) USING BTREE;

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `kayscore_clothes`
--
ALTER TABLE `kayscore_clothes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `kayscore_trunk`
--
ALTER TABLE `kayscore_trunk`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Index pour la table `maintenant`
--
ALTER TABLE `maintenant`
  ADD PRIMARY KEY (`active`);

--
-- Index pour la table `moto_categories`
--
ALTER TABLE `moto_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `open_car`
--
ALTER TABLE `open_car`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `ox_doorlock`
--
ALTER TABLE `ox_doorlock`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_alertjobs`
--
ALTER TABLE `phone_alertjobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job` (`job`);

--
-- Index pour la table `phone_chatrooms`
--
ALTER TABLE `phone_chatrooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_code` (`room_code`);

--
-- Index pour la table `phone_chatroom_messages`
--
ALTER TABLE `phone_chatroom_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_notifies`
--
ALTER TABLE `phone_notifies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_phones`
--
ALTER TABLE `phone_phones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Index pour la table `players_props`
--
ALTER TABLE `players_props`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `players_territories`
--
ALTER TABLE `players_territories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `player_clothes`
--
ALTER TABLE `player_clothes`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier` (`identifier`) USING BTREE;

--
-- Index pour la table `player_entreprise`
--
ALTER TABLE `player_entreprise`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `player_gallery`
--
ALTER TABLE `player_gallery`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `player_inventory_clothes`
--
ALTER TABLE `player_inventory_clothes`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `player_jails`
--
ALTER TABLE `player_jails`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `player_leboncoin`
--
ALTER TABLE `player_leboncoin`
  ADD UNIQUE KEY `identifier` (`identifier`) USING HASH;

--
-- Index pour la table `player_livraisons`
--
ALTER TABLE `player_livraisons`
  ADD PRIMARY KEY (`uniqueid`);

--
-- Index pour la table `player_ltdsales`
--
ALTER TABLE `player_ltdsales`
  ADD PRIMARY KEY (`uid`);

--
-- Index pour la table `player_mails`
--
ALTER TABLE `player_mails`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier` (`identifier`) USING BTREE;

--
-- Index pour la table `player_notes`
--
ALTER TABLE `player_notes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `police_plainte`
--
ALTER TABLE `police_plainte`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`propertiesID`),
  ADD UNIQUE KEY `propertiesID` (`propertiesID`);

--
-- Index pour la table `properties_list`
--
ALTER TABLE `properties_list`
  ADD PRIMARY KEY (`id_property`);

--
-- Index pour la table `properties_news`
--
ALTER TABLE `properties_news`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `property_created`
--
ALTER TABLE `property_created`
  ADD PRIMARY KEY (`propertyID`);

--
-- Index pour la table `race_tracks`
--
ALTER TABLE `race_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `slots_inventory`
--
ALTER TABLE `slots_inventory`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `society_data`
--
ALTER TABLE `society_data`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tinder_accounts`
--
ALTER TABLE `tinder_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tinder_likes`
--
ALTER TABLE `tinder_likes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tinder_messages`
--
ALTER TABLE `tinder_messages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `twitter_hashtags`
--
ALTER TABLE `twitter_hashtags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `twitter_mentions`
--
ALTER TABLE `twitter_mentions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UniqueID`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Index pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vcoffre`
--
ALTER TABLE `vcoffre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicle_catalogue`
--
ALTER TABLE `vehicle_catalogue`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `vehicules_categories`
--
ALTER TABLE `vehicules_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `vente_leboncoin`
--
ALTER TABLE `vente_leboncoin`
  ADD UNIQUE KEY `id` (`id`) USING HASH;

--
-- Index pour la table `vips`
--
ALTER TABLE `vips`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `weapon_confiscate`
--
ALTER TABLE `weapon_confiscate`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `whatsapp_chats`
--
ALTER TABLE `whatsapp_chats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `whatsapp_groups`
--
ALTER TABLE `whatsapp_groups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `whatsapp_groups_messages`
--
ALTER TABLE `whatsapp_groups_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `world_props`
--
ALTER TABLE `world_props`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `zban`
--
ALTER TABLE `zban`
  ADD PRIMARY KEY (`uniqueid`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `appel_jobs`
--
ALTER TABLE `appel_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `bcso_plainte`
--
ALTER TABLE `bcso_plainte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `blanchiment`
--
ALTER TABLE `blanchiment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `darkchat_messages`
--
ALTER TABLE `darkchat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `drugs_sell`
--
ALTER TABLE `drugs_sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `elevators`
--
ALTER TABLE `elevators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `elevator_floors`
--
ALTER TABLE `elevator_floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `exodia_clothes`
--
ALTER TABLE `exodia_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `gangs_new`
--
ALTER TABLE `gangs_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `garages`
--
ALTER TABLE `garages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT pour la table `illegal_drugs_sell`
--
ALTER TABLE `illegal_drugs_sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `illegal_laboratory`
--
ALTER TABLE `illegal_laboratory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `instagram_posts`
--
ALTER TABLE `instagram_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3132;

--
-- AUTO_INCREMENT pour la table `kayscore_clothes`
--
ALTER TABLE `kayscore_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT pour la table `open_car`
--
ALTER TABLE `open_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434;

--
-- AUTO_INCREMENT pour la table `ox_doorlock`
--
ALTER TABLE `ox_doorlock`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;

--
-- AUTO_INCREMENT pour la table `phone_alertjobs`
--
ALTER TABLE `phone_alertjobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_chatrooms`
--
ALTER TABLE `phone_chatrooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `phone_chatroom_messages`
--
ALTER TABLE `phone_chatroom_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `phone_notifies`
--
ALTER TABLE `phone_notifies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pour la table `players_props`
--
ALTER TABLE `players_props`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `players_territories`
--
ALTER TABLE `players_territories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `player_gallery`
--
ALTER TABLE `player_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `player_ltdsales`
--
ALTER TABLE `player_ltdsales`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1430;

--
-- AUTO_INCREMENT pour la table `player_mails`
--
ALTER TABLE `player_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `player_notes`
--
ALTER TABLE `player_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `police_plainte`
--
ALTER TABLE `police_plainte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `properties`
--
ALTER TABLE `properties`
  MODIFY `propertiesID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `properties_list`
--
ALTER TABLE `properties_list`
  MODIFY `id_property` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `properties_news`
--
ALTER TABLE `properties_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `property_created`
--
ALTER TABLE `property_created`
  MODIFY `propertyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `race_tracks`
--
ALTER TABLE `race_tracks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `society_data`
--
ALTER TABLE `society_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `tinder_accounts`
--
ALTER TABLE `tinder_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `tinder_likes`
--
ALTER TABLE `tinder_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tinder_messages`
--
ALTER TABLE `tinder_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `twitter_hashtags`
--
ALTER TABLE `twitter_hashtags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `twitter_mentions`
--
ALTER TABLE `twitter_mentions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `UniqueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `vcoffre`
--
ALTER TABLE `vcoffre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=665;

--
-- AUTO_INCREMENT pour la table `weapon_confiscate`
--
ALTER TABLE `weapon_confiscate`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `whatsapp_chats`
--
ALTER TABLE `whatsapp_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `whatsapp_groups`
--
ALTER TABLE `whatsapp_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `whatsapp_groups_messages`
--
ALTER TABLE `whatsapp_groups_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `world_props`
--
ALTER TABLE `world_props`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `elevator_floors`
--
ALTER TABLE `elevator_floors`
  ADD CONSTRAINT `elevator_floors_ibfk_1` FOREIGN KEY (`elevator_id`) REFERENCES `elevators` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

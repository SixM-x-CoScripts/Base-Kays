--
-- Structure de la table `boutique`
--

CREATE TABLE `boutique` (
  `citizenID` varchar(255) NOT NULL,
  `boutique_code` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `boutique`
--
ALTER TABLE `boutique`
  ADD PRIMARY KEY (`citizenID`),
  ADD UNIQUE KEY `boutique_code` (`boutique_code`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `boutique`
--
ALTER TABLE `boutique`
  MODIFY `boutique_code` int(11) NOT NULL AUTO_INCREMENT;
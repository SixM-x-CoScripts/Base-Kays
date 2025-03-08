CREATE TABLE `exodia_clothes` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `identifier` varchar(60) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `exodia_trunk` (
  `info` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `exodia_clothes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `exodia_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

ALTER TABLE `exodia_trunk`
  ADD UNIQUE KEY `id` (`id`);
COMMIT;



CREATE TABLE `vCoffre` (
  `id` int(11) NOT NULL,
  `coffre` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `vCoffre`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `vCoffre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
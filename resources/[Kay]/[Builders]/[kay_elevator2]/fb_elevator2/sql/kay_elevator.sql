CREATE TABLE `elevators` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `elevator_floors` (
  `id` int(11) NOT NULL,
  `elevator_id` int(11) NOT NULL,
  `floor_name` varchar(255) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `elevators`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `elevator_floors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elevator_id` (`elevator_id`);

ALTER TABLE `elevators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `elevator_floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

ALTER TABLE `elevator_floors`
  ADD CONSTRAINT `elevator_floors_ibfk_1` FOREIGN KEY (`elevator_id`) REFERENCES `elevators` (`id`) ON DELETE CASCADE;
COMMIT;
CREATE TABLE `bets` (
  `id` int(11) AUTO_INCREMENT,
  `bet_date` datetime NOT NULL,
  `bet_price` decimal(10,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL,
  PRIMARY KEY(`id`)
);
CREATE TABLE `categories` (
  `id` int(11) AUTO_INCREMENT,
  `title` varchar(45),
  `allas` varchar(15),
  PRIMARY KEY(`id`,`title`,`allas`)
);
CREATE TABLE `lots` (
  `id` int(11) AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_create` datetime NOT NULL,
  `start_price` decimal(10,0) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `end_date` datetime NOT NULL,
  `bet_step` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `winner_id` int(11),
  `bet_price` int(11),
   PRIMARY KEY(`id`)
);

CREATE TABLE `users` (
  `id` int(11) AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `reg_date` datetime NOT NULL,
  `contacts` varchar(15) NOT NULL,
  PRIMARY KEY(`id`,`username`,`email`)
);

ALTER TABLE `bets`
  ADD KEY `bet_price` (`bet_price`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `lot_id` (`lot_id`);
ALTER TABLE `lots`
  ADD KEY `start_price` (`start_price`),
  ADD KEY `bet_step` (`bet_step`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `bet_price` (`bet_price`),
  ADD KEY `user_id` (`user_id`,`winner_id`),
  ADD KEY `winner_id` (`winner_id`);
TER TABLE `bets`
  ADD CONSTRAINT `������_��_���` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `lots`
  ADD CONSTRAINT `���������_����` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `��������_����` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `����������_����` FOREIGN KEY (`winner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

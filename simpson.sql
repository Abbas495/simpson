-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Erstellungszeit: 25. Jan 2022 um 22:01
-- Server-Version: 10.4.22-MariaDB
-- PHP-Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `simpson`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `familie`
--

CREATE TABLE `familie` (
  `f_id` int(11) NOT NULL,
  `f_firstName` varchar(50) NOT NULL,
  `f_lastName` varchar(50) NOT NULL,
  `f_gender` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `familie`
--

INSERT INTO `familie` (`f_id`, `f_firstName`, `f_lastName`, `f_gender`) VALUES
(1, 'Homer', 'Simpson', 'Masculine'),
(2, 'Marge', 'Simpson', 'Femenine'),
(3, 'Lisa', 'Simpson', 'Femenine'),
(4, 'Bart', 'Simpson', 'Masculine'),
(5, 'Maggie', 'Simpson', 'Femenine');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `familie_hobbies`
--

CREATE TABLE `familie_hobbies` (
  `fh_id` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `familie_hobbies`
--

INSERT INTO `familie_hobbies` (`fh_id`, `f_id`, `h_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 4, 2),
(4, 1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hobbies`
--

CREATE TABLE `hobbies` (
  `h_id` int(11) NOT NULL,
  `h_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `hobbies`
--

INSERT INTO `hobbies` (`h_id`, `h_name`) VALUES
(1, 'football'),
(2, 'Basketball'),
(3, 'Cooking'),
(4, 'Reading');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `job`
--

CREATE TABLE `job` (
  `j_id` int(11) NOT NULL,
  `j_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `familie`
--
ALTER TABLE `familie`
  ADD PRIMARY KEY (`f_id`);

--
-- Indizes für die Tabelle `familie_hobbies`
--
ALTER TABLE `familie_hobbies`
  ADD PRIMARY KEY (`fh_id`),
  ADD KEY `h_id` (`h_id`),
  ADD KEY `f_id` (`f_id`),
  ADD KEY `f_id_2` (`f_id`);

--
-- Indizes für die Tabelle `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`h_id`);

--
-- Indizes für die Tabelle `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`j_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `familie`
--
ALTER TABLE `familie`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `familie_hobbies`
--
ALTER TABLE `familie_hobbies`
  MODIFY `fh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `familie_hobbies`
--
ALTER TABLE `familie_hobbies`
  ADD CONSTRAINT `familie_hobbies_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `familie` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `familie_hobbies_ibfk_2` FOREIGN KEY (`h_id`) REFERENCES `hobbies` (`h_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

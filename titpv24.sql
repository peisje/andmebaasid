-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 23, 2026 kell 10:35 EL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `titpv24`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `opetaja`
--

CREATE TABLE `opetaja` (
  `opetajaID` int(11) NOT NULL,
  `nimi` varchar(35) DEFAULT NULL,
  `epost` varchar(20) DEFAULT NULL,
  `ruum` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `opetaja`
--

INSERT INTO `opetaja` (`opetajaID`, `nimi`, `epost`, `ruum`) VALUES
(1, 'lehta', 'lehta@gmail.com', '119');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `opetamine`
--

CREATE TABLE `opetamine` (
  `opetamineId` int(11) NOT NULL,
  `kuupaev` date DEFAULT NULL,
  `oppeaine` varchar(30) DEFAULT NULL,
  `opilaeID` int(11) DEFAULT NULL,
  `hinne` int(11) DEFAULT NULL CHECK (`hinne` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `opetamine`
--

INSERT INTO `opetamine` (`opetamineId`, `kuupaev`, `oppeaine`, `opilaeID`, `hinne`) VALUES
(1, '2026-04-08', 'jghnjh', 2, 5);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `opilane`
--

CREATE TABLE `opilane` (
  `opilaeID` int(11) NOT NULL,
  `eesnimi` varchar(25) DEFAULT NULL,
  `perenimi` varchar(30) NOT NULL,
  `synniaeg` date DEFAULT NULL,
  `stip` bit(1) DEFAULT NULL,
  `mobiil` varchar(13) DEFAULT NULL,
  `aadresa` text DEFAULT NULL,
  `keskmineHinne` decimal(2,1) DEFAULT NULL,
  `ryhmID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `opilane`
--

INSERT INTO `opilane` (`opilaeID`, `eesnimi`, `perenimi`, `synniaeg`, `stip`, `mobiil`, `aadresa`, `keskmineHinne`, `ryhmID`) VALUES
(1, 'Lev', 'valge', '2006-04-11', b'0', '39329033', 'Tallinn, jarveotsa tee 28', 4.0, NULL),
(2, 'ivan', 'sereda', NULL, NULL, NULL, NULL, 4.2, NULL),
(3, 'ivan', 'holovanov', NULL, NULL, NULL, NULL, 4.2, NULL),
(4, 'marko', 'suvorov', NULL, NULL, NULL, NULL, 5.0, NULL),
(5, 'nastya', 'jusik', '2007-04-11', b'0', '982377345', 'tallinn', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `ryhm`
--

CREATE TABLE `ryhm` (
  `ryhmId` int(11) NOT NULL,
  `ryhmNimi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `ryhm`
--

INSERT INTO `ryhm` (`ryhmId`, `ryhmNimi`) VALUES
(2, 'LOGITpv24'),
(1, 'TITpv24');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tund`
--

CREATE TABLE `tund` (
  `tundID` int(11) NOT NULL,
  `kuupaev` date DEFAULT NULL,
  `tundNimi` varchar(20) DEFAULT NULL,
  `opetajaID` int(11) DEFAULT NULL,
  `opetamineID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `opetaja`
--
ALTER TABLE `opetaja`
  ADD PRIMARY KEY (`opetajaID`);

--
-- Indeksid tabelile `opetamine`
--
ALTER TABLE `opetamine`
  ADD PRIMARY KEY (`opetamineId`),
  ADD KEY `opilaeID` (`opilaeID`);

--
-- Indeksid tabelile `opilane`
--
ALTER TABLE `opilane`
  ADD PRIMARY KEY (`opilaeID`),
  ADD KEY `fk_ryhm` (`ryhmID`);

--
-- Indeksid tabelile `ryhm`
--
ALTER TABLE `ryhm`
  ADD PRIMARY KEY (`ryhmId`),
  ADD UNIQUE KEY `ryhmNimi` (`ryhmNimi`);

--
-- Indeksid tabelile `tund`
--
ALTER TABLE `tund`
  ADD PRIMARY KEY (`tundID`),
  ADD KEY `opetajaID` (`opetajaID`),
  ADD KEY `opetamineID` (`opetamineID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `opetaja`
--
ALTER TABLE `opetaja`
  MODIFY `opetajaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `opetamine`
--
ALTER TABLE `opetamine`
  MODIFY `opetamineId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `opilane`
--
ALTER TABLE `opilane`
  MODIFY `opilaeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `ryhm`
--
ALTER TABLE `ryhm`
  MODIFY `ryhmId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `tund`
--
ALTER TABLE `tund`
  MODIFY `tundID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `opetamine`
--
ALTER TABLE `opetamine`
  ADD CONSTRAINT `opetamine_ibfk_1` FOREIGN KEY (`opilaeID`) REFERENCES `opilane` (`opilaeID`);

--
-- Piirangud tabelile `opilane`
--
ALTER TABLE `opilane`
  ADD CONSTRAINT `fk_ryhm` FOREIGN KEY (`ryhmID`) REFERENCES `ryhm` (`ryhmId`);

--
-- Piirangud tabelile `tund`
--
ALTER TABLE `tund`
  ADD CONSTRAINT `tund_ibfk_1` FOREIGN KEY (`opetajaID`) REFERENCES `opetaja` (`opetajaID`),
  ADD CONSTRAINT `tund_ibfk_2` FOREIGN KEY (`opetamineID`) REFERENCES `opetamine` (`opetamineId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

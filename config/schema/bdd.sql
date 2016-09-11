-- Le script pour inialiser la BDD
-- Pourra être susceptible d'être modifié, voir les patchs dans /config/schema/patch

-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2016 at 03:07 PM
-- Server version: 5.6.15-log
-- PHP Version: 5.6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sharastar`
--

-- --------------------------------------------------------

--
-- Table structure for table `ball`
--

CREATE TABLE IF NOT EXISTS `ball` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `pos` varchar(25) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `methode`
--

CREATE TABLE IF NOT EXISTS `methode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `couleur` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `methode_type`
--

CREATE TABLE IF NOT EXISTS `methode_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `proba` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `methode_type_correspondance`
--

CREATE TABLE IF NOT EXISTS `methode_type_correspondance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_methode_type` int(10) unsigned NOT NULL,
  `id_methode` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_methode_type` (`id_methode_type`),
  KEY `id_methode` (`id_methode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nature`
--

CREATE TABLE IF NOT EXISTS `nature` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pokedex`
--

CREATE TABLE IF NOT EXISTS `pokedex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero` int(10) unsigned NOT NULL,
  `generation` tinyint(3) unsigned NOT NULL,
  `nom` varchar(50) NOT NULL,
  `position` varchar(20) NOT NULL,
  `sprite` varchar(250) NOT NULL,
  `ordre` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recherche`
--

CREATE TABLE IF NOT EXISTS `recherche` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_route` int(10) unsigned NOT NULL,
  `chiffre` int(10) unsigned NOT NULL,
  `cible` text,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_route` (`id_route`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE IF NOT EXISTS `route` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_version` tinyint(3) unsigned NOT NULL,
  `nom` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_version` (`id_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `route_categorie`
--

CREATE TABLE IF NOT EXISTS `route_categorie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `route_categorie_correspondance`
--

CREATE TABLE IF NOT EXISTS `route_categorie_correspondance` (
  `id` int(10) unsigned NOT NULL,
  `id_categorie` int(10) unsigned NOT NULL,
  `id_route` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categorie` (`id_categorie`,`id_route`),
  KEY `id_route` (`id_route`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `route_pokemon`
--

CREATE TABLE IF NOT EXISTS `route_pokemon` (
  `id_pokemon` int(10) unsigned NOT NULL,
  `id_methode` int(10) unsigned NOT NULL,
  `id_route` int(10) unsigned NOT NULL,
  KEY `id_pokemon` (`id_pokemon`,`id_methode`,`id_route`),
  KEY `id_methode` (`id_methode`),
  KEY `id_route` (`id_route`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shcard`
--

CREATE TABLE IF NOT EXISTS `shcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `data` text NOT NULL,
  `nom` varchar(50) NOT NULL DEFAULT 'Sans nom',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shiny`
--

CREATE TABLE IF NOT EXISTS `shiny` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_version` tinyint(3) unsigned NOT NULL,
  `id_ball` int(10) unsigned NOT NULL,
  `id_pokemon` int(10) unsigned NOT NULL,
  `id_nature` int(10) unsigned NOT NULL,
  `nom` varchar(50) CHARACTER SET utf16 NOT NULL,
  `chiffre` int(10) unsigned DEFAULT NULL,
  `recit` text,
  `sexe` tinyint(4) NOT NULL,
  `date_capture` datetime DEFAULT NULL,
  `heure_capture` varchar(20) DEFAULT NULL,
  `date_declaration` datetime NOT NULL,
  `id_methode` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_methode` (`id_methode`),
  KEY `id_user` (`id_user`,`id_version`,`id_ball`,`id_pokemon`,`id_nature`),
  KEY `id_user_2` (`id_user`),
  KEY `id_version` (`id_version`),
  KEY `id_ball` (`id_ball`),
  KEY `id_pokemon` (`id_pokemon`),
  KEY `id_nature` (`id_nature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nombre_shiny` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` text,
  `couleur` varchar(20) NOT NULL DEFAULT '#000000',
  `sexe` tinyint(1) unsigned DEFAULT NULL,
  `defaut` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `droit` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `date_inscription` datetime NOT NULL,
  `date_derniere_visite` datetime DEFAULT NULL,
  `date_naissance` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE IF NOT EXISTS `version` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `generation_max` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `methode_type_correspondance`
--
ALTER TABLE `methode_type_correspondance`
  ADD CONSTRAINT `fk_methode` FOREIGN KEY (`id_methode`) REFERENCES `methode` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_methode_type` FOREIGN KEY (`id_methode_type`) REFERENCES `methode_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recherche`
--
ALTER TABLE `recherche`
  ADD CONSTRAINT `fk_recherche_route` FOREIGN KEY (`id_route`) REFERENCES `route` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_recherche_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `fk_route_version` FOREIGN KEY (`id_version`) REFERENCES `version` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `route_categorie_correspondance`
--
ALTER TABLE `route_categorie_correspondance`
  ADD CONSTRAINT `fk_cate_route2` FOREIGN KEY (`id_route`) REFERENCES `route` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cate_route` FOREIGN KEY (`id_categorie`) REFERENCES `route_categorie` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `route_pokemon`
--
ALTER TABLE `route_pokemon`
  ADD CONSTRAINT `fk_pokeroute_route` FOREIGN KEY (`id_route`) REFERENCES `route` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pokeroute_methode` FOREIGN KEY (`id_methode`) REFERENCES `methode_type_correspondance` (`id`),
  ADD CONSTRAINT `fk_poke_route_pokedex` FOREIGN KEY (`id_pokemon`) REFERENCES `pokedex` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shcard`
--
ALTER TABLE `shcard`
  ADD CONSTRAINT `fk_user_shcard` FOREIGN KEY (`id_user`) REFERENCES `shcard` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shiny`
--
ALTER TABLE `shiny`
  ADD CONSTRAINT `fk_shiny_version` FOREIGN KEY (`id_version`) REFERENCES `version` (`id`),
  ADD CONSTRAINT `fk_shiny_ball` FOREIGN KEY (`id_ball`) REFERENCES `ball` (`id`),
  ADD CONSTRAINT `fk_shiny_methode` FOREIGN KEY (`id_methode`) REFERENCES `methode_type_correspondance` (`id`),
  ADD CONSTRAINT `fk_shiny_nature` FOREIGN KEY (`id_nature`) REFERENCES `nature` (`id`),
  ADD CONSTRAINT `fk_shiny_pokemon` FOREIGN KEY (`id_pokemon`) REFERENCES `pokedex` (`id`),
  ADD CONSTRAINT `fk_user_shiny` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

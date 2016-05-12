-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 29 Septembre 2015 à 11:20
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gsbv2`
--

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE IF NOT EXISTS `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('RB', 'Remboursée'),
('VA', 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

CREATE TABLE IF NOT EXISTS `fichefrais` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) DEFAULT 'CR',
  PRIMARY KEY (`idVisiteur`,`mois`),
  KEY `idEtat` (`idEtat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idVisiteur`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`) VALUES
('a17', '201509', 0, '0.00', '2015-09-08', 'VA'),
('a55', '201509', 0, '0.00', '2015-09-15', 'RB'),
('b13', '201509', 0, '1056.20', '2015-09-15', 'VA'),
('b19', '201509', 0, '5947.48', '2015-09-15', 'RB'),
('b34', '201509', 0, '5013.10', '2015-09-15', 'VA'),
('f4', '201509', 1, '33466.08', '2015-09-14', 'RB');

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE IF NOT EXISTS `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Frais Kilométrique', '0.62'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

CREATE TABLE IF NOT EXISTS `lignefraisforfait` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idFraisForfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVisiteur`,`mois`,`idFraisForfait`),
  KEY `idFraisForfait` (`idFraisForfait`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idVisiteur`, `mois`, `idFraisForfait`, `quantite`) VALUES
('a17', '201509', 'ETP', 0),
('a17', '201509', 'KM', 0),
('a17', '201509', 'NUI', 0),
('a17', '201509', 'REP', 0),
('a55', '201509', 'ETP', 10),
('a55', '201509', 'KM', 150),
('a55', '201509', 'NUI', 7),
('a55', '201509', 'REP', 3),
('b13', '201509', 'ETP', 5),
('b13', '201509', 'KM', 10),
('b13', '201509', 'NUI', 5),
('b13', '201509', 'REP', 4),
('b19', '201509', 'ETP', 50),
('b19', '201509', 'KM', 4),
('b19', '201509', 'NUI', 4),
('b19', '201509', 'REP', 5),
('b34', '201509', 'ETP', 4),
('b34', '201509', 'KM', 5),
('b34', '201509', 'NUI', 35),
('b34', '201509', 'REP', 70),
('f4', '201509', 'ETP', 100),
('f4', '201509', 'KM', 56),
('f4', '201509', 'NUI', 3),
('f4', '201509', 'REP', 2);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

CREATE TABLE IF NOT EXISTS `lignefraishorsforfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idVisiteur` (`idVisiteur`,`mois`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idVisiteur`, `mois`, `libelle`, `date`, `montant`) VALUES
(1, 'f4', '201509', 'Buger & Co', '2015-09-10', '5.00'),
(6, 'b34', '201509', 'Mc Do', '2015-09-05', '20.00');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE IF NOT EXISTS `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(255) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`, `type`) VALUES
('a131', 'comptable', 'Louis', 'comptable', '00d70c561892a94980befd12a400e26aeb4b8599', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21', 'comptable'),
('a17', 'Andre', 'David', 'dandre', '00d70c561892a94980befd12a400e26aeb4b8599', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23', 'comptable'),
('a55', 'Bedos', 'Christian', 'cbedos', '00d70c561892a94980befd12a400e26aeb4b8599', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12', 'visiteur'),
('a93', 'Tusseau', 'Louis', 'ltusseau', '00d70c561892a94980befd12a400e26aeb4b8599', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01', 'visiteur'),
('b13', 'Bentot', 'Pascal', 'pbentot', '00d70c561892a94980befd12a400e26aeb4b8599', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09', 'visiteur'),
('b16', 'Bioret', 'Luc', 'lbioret', '00d70c561892a94980befd12a400e26aeb4b8599', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11', 'visiteur'),
('b19', 'Bunisset', 'Francis', 'fbunisset', '00d70c561892a94980befd12a400e26aeb4b8599', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21', 'visiteur'),
('b25', 'Bunisset', 'Denise', 'dbunisset', '00d70c561892a94980befd12a400e26aeb4b8599', '23 rue Manin', '75019', 'paris', '2010-12-05', 'visiteur'),
('b28', 'Cacheux', 'Bernard', 'bcacheux', '00d70c561892a94980befd12a400e26aeb4b8599', '114 rue Blanche', '75017', 'Paris', '2009-11-12', 'visiteur'),
('b34', 'Cadic', 'Eric', 'ecadic', '00d70c561892a94980befd12a400e26aeb4b8599', '123 avenue de la République', '75011', 'Paris', '2008-09-23', 'visiteur'),
('b4', 'Charoze', 'Catherine', 'ccharoze', '00d70c561892a94980befd12a400e26aeb4b8599', '100 rue Petit', '75019', 'Paris', '2005-11-12', 'visiteur'),
('b50', 'Clepkens', 'Christophe', 'cclepkens', '00d70c561892a94980befd12a400e26aeb4b8599', '12 allée des Anges', '93230', 'Romainville', '2003-08-11', 'visiteur'),
('b59', 'Cottin', 'Vincenne', 'vcottin', '00d70c561892a94980befd12a400e26aeb4b8599', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18', 'visiteur'),
('c14', 'Daburon', 'François', 'fdaburon', '00d70c561892a94980befd12a400e26aeb4b8599', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11', 'visiteur'),
('c3', 'De', 'Philippe', 'pde', '00d70c561892a94980befd12a400e26aeb4b8599', '13 rue Barthes', '94000', 'Créteil', '2010-12-14', 'visiteur'),
('c54', 'Debelle', 'Michel', 'mdebelle', '00d70c561892a94980befd12a400e26aeb4b8599', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23', 'visiteur'),
('d13', 'Debelle', 'Jeanne', 'jdebelle', '00d70c561892a94980befd12a400e26aeb4b8599', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11', 'visiteur'),
('d51', 'Debroise', 'Michel', 'mdebroise', '00d70c561892a94980befd12a400e26aeb4b8599', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', 'visiteur'),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', '00d70c561892a94980befd12a400e26aeb4b8599', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', 'visiteur'),
('e24', 'Desnost', 'Pierre', 'pdesnost', '00d70c561892a94980befd12a400e26aeb4b8599', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', 'visiteur'),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '00d70c561892a94980befd12a400e26aeb4b8599', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', 'visiteur'),
('e49', 'Duncombe', 'Claude', 'cduncombe', '00d70c561892a94980befd12a400e26aeb4b8599', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', 'visiteur'),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', '00d70c561892a94980befd12a400e26aeb4b8599', '25 place de la gare', '23200', 'Gueret', '1995-09-01', 'visiteur'),
('e52', 'Eynde', 'Valérie', 'veynde', '00d70c561892a94980befd12a400e26aeb4b8599', '3 Grand Place', '13015', 'Marseille', '1999-11-01', 'visiteur'),
('f21', 'Finck', 'Jacques', 'jfinck', '00d70c561892a94980befd12a400e26aeb4b8599', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', 'visiteur'),
('f39', 'Frémont', 'Fernande', 'ffremont', '00d70c561892a94980befd12a400e26aeb4b8599', '4 route de la mer', '13012', 'Allauh', '1998-10-01', 'visiteur'),
('f4', 'TOTO', 'TOTO', 'romain', '00d70c561892a94980befd12a400e26aeb4b8599', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', 'visiteur');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idVisiteur`, `mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

--
-- Contraintes pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idVisiteur`, `mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

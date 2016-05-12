-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 02 Mai 2016 à 15:55
-- Version du serveur :  10.1.10-MariaDB
-- Version de PHP :  5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gsbv2`
--

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('RB', 'Remboursée'),
('VA', 'Validée');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) DEFAULT 'CR'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idVisiteur`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`) VALUES
('a17', '201509', 0, '0.00', '2015-09-08', 'CR'),
('a17', '201605', 0, '0.00', '2016-05-02', 'CR'),
('a55', '201509', 0, '1828.00', '2016-05-02', 'VA'),
('b13', '201509', 0, '1056.20', '2016-05-02', 'CR'),
('b13', '201605', 0, '0.00', '2016-05-02', 'CR'),
('b13', '20166', 0, '0.00', '2016-05-02', 'CR'),
('b13', '20167', 0, '25.00', '2016-05-02', 'CR'),
('b19', '201509', 0, '5947.48', '2016-05-02', 'RB'),
('b34', '201509', 0, '5013.10', '2016-05-02', 'RB'),
('f4', '201509', 1, '33466.08', '2015-09-14', 'CR'),
('f4', '201604', 0, '0.00', '2016-05-01', 'CR'),
('f4', '201605', 0, '215.62', '2016-05-02', 'CR');

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL
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

CREATE TABLE `lignefraisforfait` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idFraisForfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idVisiteur`, `mois`, `idFraisForfait`, `quantite`) VALUES
('a17', '201509', 'ETP', 0),
('a17', '201509', 'KM', 0),
('a17', '201509', 'NUI', 0),
('a17', '201509', 'REP', 0),
('a17', '201605', 'ETP', 0),
('a17', '201605', 'KM', 0),
('a17', '201605', 'NUI', 0),
('a17', '201605', 'REP', 0),
('a55', '201509', 'ETP', 10),
('a55', '201509', 'KM', 150),
('a55', '201509', 'NUI', 7),
('a55', '201509', 'REP', 3),
('b13', '201509', 'ETP', 5),
('b13', '201509', 'KM', 10),
('b13', '201509', 'NUI', 5),
('b13', '201509', 'REP', 4),
('b13', '201605', 'ETP', 3),
('b13', '201605', 'KM', 1),
('b13', '201605', 'NUI', 2),
('b13', '201605', 'REP', 2),
('b13', '20166', 'ETP', 0),
('b13', '20166', 'KM', 0),
('b13', '20166', 'NUI', 0),
('b13', '20166', 'REP', 0),
('b13', '20167', 'ETP', 0),
('b13', '20167', 'KM', 0),
('b13', '20167', 'NUI', 0),
('b13', '20167', 'REP', 0),
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
('f4', '201509', 'REP', 2),
('f4', '201604', 'ETP', 0),
('f4', '201604', 'KM', 0),
('f4', '201604', 'NUI', 0),
('f4', '201604', 'REP', 0),
('f4', '201605', 'ETP', 1),
('f4', '201605', 'KM', 1),
('f4', '201605', 'NUI', 1),
('f4', '201605', 'REP', 1);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

CREATE TABLE `lignefraishorsforfait` (
  `id` int(11) NOT NULL,
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idVisiteur`, `mois`, `libelle`, `date`, `montant`) VALUES
(1, 'f4', '201509', 'Buger & Co', '2015-09-10', '5.00'),
(6, 'b34', '201509', 'Mc Do', '2015-09-05', '20.00'),
(8, 'b13', '20167', 'Mcdo', '2016-04-24', '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `type`) VALUES
('a131', 'comptable', 'Louis', 'comptable', '00d70c561892a94980befd12a400e26aeb4b8599', 'comptable'),
('a17', 'Andre', 'David', 'dandre', '00d70c561892a94980befd12a400e26aeb4b8599', 'comptable'),
('a55', 'Bedos', 'Christian', 'cbedos', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('a93', 'Tusseau', 'Louis', 'ltusseau', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('b13', 'Bentot', 'Pascal', 'pbentot', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('b16', 'Bioret', 'Luc', 'lbioret', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('b19', 'Bunisset', 'Francis', 'fbunisset', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('b25', 'Bunisset', 'Denise', 'dbunisset', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('b28', 'Cacheux', 'Bernard', 'bcacheux', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('b34', 'Cadic', 'Eric', 'ecadic', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('b4', 'Charoze', 'Catherine', 'ccharoze', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('b50', 'Clepkens', 'Christophe', 'cclepkens', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('b59', 'Cottin', 'Vincenne', 'vcottin', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('c14', 'Daburon', 'François', 'fdaburon', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('c3', 'De', 'Philippe', 'pde', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('c54', 'Debelle', 'Michel', 'mdebelle', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('d13', 'Debelle', 'Jeanne', 'jdebelle', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('d51', 'Debroise', 'Michel', 'mdebroise', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('e24', 'Desnost', 'Pierre', 'pdesnost', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('e49', 'Duncombe', 'Claude', 'cduncombe', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('e52', 'Eynde', 'Valérie', 'veynde', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('f21', 'Finck', 'Jacques', 'jfinck', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('f39', 'Frémont', 'Fernande', 'ffremont', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur'),
('f4', 'Romain', 'Billon', 'romain', '00d70c561892a94980befd12a400e26aeb4b8599', 'visiteur');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`idVisiteur`,`mois`),
  ADD KEY `idEtat` (`idEtat`);

--
-- Index pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD PRIMARY KEY (`idVisiteur`,`mois`,`idFraisForfait`),
  ADD KEY `idFraisForfait` (`idFraisForfait`);

--
-- Index pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVisiteur` (`idVisiteur`,`mois`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

--
-- Contraintes pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

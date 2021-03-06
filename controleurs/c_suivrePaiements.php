﻿<?php
/**
 * Contrôleur de traitement de consultation des frais pour le comptable


 * @package default
 */

//Affichage du sommaire spécifique au comptable
include("vues/v_sommaire_comptable.php");
$action = $_REQUEST['action'];

switch($action){
	case 'voirFichesValidees':{
		//Récupération des données choisies par le comptable et déclaration de ces données en variables de session
		$leVisiteur = 'vide';
		if (isset($_POST['lstVisiteurs'])){
			$leVisiteur = $_POST['lstVisiteurs'];
			$_SESSION['lstVisiteurs']=$leVisiteur;
		}
		//Récupére les visiteurs ayant des fiches en attente de remboursement
		$lesVisiteurs=$pdo->getLesVisiteursARembourser();
		$leMois = 'vide';
		if (isset($_POST['lstMois'])){
			$leMois = $_POST['lstMois'];
			$_SESSION['lstMois']=$leMois;
		}
		//Récupére les mois en attente de remboursement
		$lesMois=$pdo->getLesMoisDisponiblesARembourser($leVisiteur);
		$visiteurASelectionner = $leVisiteur;
		$moisASelectionner = $leMois;
		
		//Affichage de la vue permettant le choix du visiteur et du mois
		include("vues/v_listeSuivi.php");
		
		//récupération des données correspondantes à la fiche choisie
		$lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($leVisiteur,$leMois);
		$lesFraisForfait= $pdo->getLesFraisForfait($leVisiteur,$leMois);
		$lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($leVisiteur,$leMois);
		$numAnnee =substr( $leMois,0,4);
		$_SESSION['numAnnee']=$numAnnee;
		$numMois =substr( $leMois,4,2);
		$_SESSION['numMois']=$numMois;
		$idEtat = $lesInfosFicheFrais['idEtat'];
		$libEtat = $lesInfosFicheFrais['libEtat'];
		$montantValide = $lesInfosFicheFrais['montantValide'];
		$nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
		$dateModif =  $lesInfosFicheFrais['dateModif'];
		$dateModif =  dateAnglaisVersFrancais($dateModif);
		
		//Affichage de la vue permettant la consultation des données
		if (isset($_POST['lstMois'])){
			$leMois = $_POST['lstMois'];
			$_SESSION['lstMois']=$leMois;
			include("vues/v_etatFraisComptable.php"); }
		
		if ($idEtat=='VA') {
			include("vues/v_inviteRembourserFrais.php");//Affichage du lien de remboursement
		}
		
		break;
		
	}
	case 'mettreEtatRembourse':{
		//Récupération des variables de session
		$sommeTotale=0;
			$leVisiteur ='vide';
			if (isset($_SESSION['lstVisiteurs'])){
				$leVisiteur = $_SESSION['lstVisiteurs'];
			}
			$leMois ='vide';
			if (isset($_SESSION['lstMois'])){
				$leMois = $_SESSION['lstMois'];
			}
			//Mise à jour de la fiche en remboursement
			$pdo->majEtatFicheFrais($leVisiteur,$leMois,"RB");
			echo '<div class="col-md-6"><input class="form-control" type="text" placeholder="La fiche de frais a bien été remboursée, la fiche est désormatis clôturée" disabled></div>;';
			break;
	}
	
}
?>
﻿<?php

include("vues/v_sommaire_comptable.php");
$action = $_REQUEST['action'];

switch($action){
	case 'voirEtatFrais':{
		//Récupération des données choisies par le comptable et déclaration de ces données en variables de session
		$leVisiteur = 'vide';
		if (isset($_POST['lstVisiteurs'])){
			$leVisiteur = $_POST['lstVisiteurs'];
			$_SESSION['lstVisiteurs']=$leVisiteur;
		}
		$lesVisiteurs=$pdo->getLesVisiteurs();
		$leMois = 'vide';
		if (isset($_POST['lstMois'])){
			$leMois = $_POST['lstMois'];
			$_SESSION['lstMois']=$leMois;
		}
		//Récupére les fiches existantes pour le visiteur choisi
		$lesMois=$pdo->getLesMoisDisponibles($leVisiteur);
		$visiteurASelectionner = $leVisiteur;
		$moisASelectionner = $leMois;
		//Affichage de la vue permettant le choix du visiteur et du mois
		include("vues/v_listeVisiteurs.php");
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
			include("vues/v_etatFraisComptable.php");
		}
		
		//Affichage de l'état de la fiche
		if ($idEtat=='VA'){
			echo '</br></br></br></br><h3> Fiche déjà validée </h3>';
		}
		else if ($idEtat=='RB'){
			echo '</br></br></br></br><h3> Fiche déjà remboursée </h3>';
			
		}
		else if ($idEtat=='CR'){
			echo '</br></br></br></br><h3> Fiche en attente de validation </h3>';
				include("vues/v_optionsValidation.php");
				
		}
		// else {
		// //Si la fiche est cloturée, affichage du menu de validation
			// include("vues/v_optionsValidation.php");
		// }
		break;
	}
	case 'modifierFiche':{
		//Récupération des variables de session
		$leVisiteur ='vide';
		if (isset($_SESSION['lstVisiteurs'])){
			$leVisiteur = $_SESSION['lstVisiteurs'];
		}
		$leMois ='vide';
		if (isset($_SESSION['lstMois'])){
			$leMois = $_SESSION['lstMois'];
		}
		//Récupération des données de la fiche correspondante
		$lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($leVisiteur,$leMois);
		$lesFraisForfait= $pdo->getLesFraisForfait($leVisiteur,$leMois);
		$lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($leVisiteur,$leMois);
		$idEtat = $lesInfosFicheFrais['idEtat'];
		$libEtat = $lesInfosFicheFrais['libEtat'];
		$montantValide = $lesInfosFicheFrais['montantValide'];
		$nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
		$dateModif =  $lesInfosFicheFrais['dateModif'];
		$dateModif =  dateAnglaisVersFrancais($dateModif);
		//Affichage de la vue de modification de la fiche
		include("vues/v_modifListeFrais.php");
		break;
	}
		case 'modifierFrais':{
			//Récupération des variables de session
			$leVisiteur ='vide';
			if (isset($_SESSION['lstVisiteurs'])){
				$leVisiteur = $_SESSION['lstVisiteurs'];
			}
			$leMois ='vide';
			if (isset($_SESSION['lstMois'])){
				$leMois = $_SESSION['lstMois'];
			}
			//Modification de la fiche de frais forfait
			$lesFrais =array ('vide'=>'vide');
			if (isset($lesFrais)){
				$lesFrais = $_REQUEST['lesFrais'];
				if(lesQteFraisValides($lesFrais)){
					$pdo->majFraisForfait($leVisiteur,$leMois,$lesFrais);
					include("vues/v_majFraisForfait.php");
				}
				else{
					ajouterErreur("Les valeurs des frais doivent être numériques");
					include("vues/v_erreurs.php");
				}
			break;
			}
		}
		case 'modifierNbJustificatifs':{
			//Récupération des variables de session
				$leVisiteur ='vide';
				if (isset($_SESSION['lstVisiteurs'])){
					$leVisiteur = $_SESSION['lstVisiteurs'];
				}
				$leMois ='vide';
				if (isset($_SESSION['lstMois'])){
					$leMois = $_SESSION['lstMois'];
				}
				//Modification du nombre de justificatifs
				$lesJustificatifs=0;
				if (isset($lesJustificatifs)){
					$lesJustificatifs = $_POST['lesJustificatifs'];
					if(lesQteFraisValides($lesJustificatifs)){
						$pdo->majNbJustificatifs($leVisiteur, $leMois, $lesJustificatifs);
						include("vues/v_majJustificatifs.php");
					}
					else{
						ajouterErreur("Les valeurs des frais doivent êtres numériques");
						include("vues/v_erreurs.php");
					}
				}
			break;
			}
		case 'supprimerFrais':{
			//Récupération des variables de session
			$leVisiteur ='vide';
			if (isset($_SESSION['lstVisiteurs'])){
				$leVisiteur = $_SESSION['lstVisiteurs'];
			}
			$leMois ='vide';
			if (isset($_SESSION['lstMois'])){
				$leMois = $_SESSION['lstMois'];
			}
			//Suppression des lignes hors forfait
			$idFrais=0;
			if(isset($idFrais) && isset($_REQUEST['idFrais'])){
				$idFrais = $_REQUEST['idFrais'];
				$pdo->supprimerFraisHorsForfait($idFrais);
			}
			include("vues/v_majSupFrais.php");
			break;
			}
	
		case 'reporterFiche':{
			//Récupération des variables de session
			$leVisiteur ='vide';
			if (isset($_SESSION['lstVisiteurs'])){
				$leVisiteur = $_SESSION['lstVisiteurs'];
			}
			$leMois ='vide';
			if (isset($_SESSION['lstMois'])){
				$leMois = $_SESSION['lstMois'];
			}
			$idFrais=0;
			//Report de la fiche de frais
			if(isset($idFrais) && isset($_REQUEST['idFrais'])){
				$idFrais = $_REQUEST['idFrais'];
				$pdo->reporterFraisHorsForfait($idFrais,$leVisiteur,$leMois);
			}
			include("vues/v_reportFraisHorsForfait.php");
			break;
		}
		case 'validerFiche':{
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
			//Mise à jour de l'état de la fiche
			$pdo->majEtatFicheFrais($leVisiteur,$leMois,"VA");
			//Calcul du montant total à rembourser
			$lesMontants = $pdo->getLesMontants();
			$lesFraisForfait = $pdo->getLeNombreFraisForfait($leVisiteur,$leMois);
			for($i=0;$i<=3;$i++){
				$sommeTotale+=($lesMontants[$i][0]*$lesFraisForfait[$i][0]);
			}
			$lesFraisNonForfait = $pdo->getSommeFraisNonForfait($leVisiteur,$leMois);
			$sommeTotale+=$lesFraisNonForfait[0];
			//Mise à jour du montant de la fiche
			$pdo->majMontantValide($leVisiteur,$leMois,$sommeTotale);
			echo '<div class="col-md-6"><input class="form-control" type="text" placeholder="La fiche de frais a été validée" disabled></div>;';
			break;
			}
	}
?>
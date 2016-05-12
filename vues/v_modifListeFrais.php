<div class="col-md-6">
	<div class="content-box-large">
		<div class="panel-heading">
			<h2>Modifier la fiche de frais </h2>
        </div>
	<div class="panel-body">
      <form class="form-horizontal" method="POST"  action="index.php?uc=validerFrais&action=modifierFrais">
			<div class="form-group">
                 Modification des frais forfaitisés
            <legend>Eléments forfaitisés</legend>
			<?php
			if (isset($lesFraisForfait)){
				foreach ($lesFraisForfait as $unFrais)
				{
					$idFrais = $unFrais['idfrais'];
					$libelle = $unFrais['libelle'];
					$quantite = $unFrais['quantite'];
			?>
					<p>
						<label for="idFrais"><?php echo $libelle ?></label>
						<input class="form-control" type="text" id="idFrais" name="lesFrais[<?php echo $idFrais?>]" size="10" maxlength="5" value="<?php echo $quantite ?>" >
					</p>
			
			<?php
				}
			}
			?>

			</div>
			<div class="form-group">
				<input class="btn btn-info btn-lg" id="ok" type="submit" value="Valider" />
				<input class="btn btn-info btn-lg" id="annuler" type="reset" value="Effacer" />
			</div>
		</div>
	</div>
</div>

<div class="col-md-6">
	<div class="content-box-large">
		<div class="panel-heading">
			<h2>Modification du nombre de justificatifs</h2>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" method="POST"  action="index.php?uc=validerFrais&action=modifierNbJustificatifs">
				<div class="form-group">
					<legend>Nombre de justificatifs reçus</legend>
						<input class="form-control" type="text" name="lesJustificatifs" value="<?php if (isset($nbJustificatifs)){ echo $nbJustificatifs;} ?>" >
				</div>
				<div class="form-group">
					<input class="btn btn-info btn-lg" id="ok" type="submit" value="Valider" />
					<input class="btn btn-info btn-lg" id="annuler" type="reset" value="Effacer" />
				</div>
			 </form>
		</div>
    </div>
</div>
        
     
<div class="col-md-6">
	<div class="content-box-large">
		<div class="panel-heading">
			<legend>Report ou Suppression des éléments hors-forfait</legend>
		</div>
		<div class="panel-body">
			<table class="table">
			  <thead>
				<tr>
					<th class="date">Date</th>
					<th class="libelle">Libellé</th>  
					<th class="montant">Montant</th>  
					<th class="action">&nbsp;</th>              
				 </tr>
				 <?php    

					foreach( $lesFraisHorsForfait as $unFraisHorsForfait) 
					{
						$libelle = $unFraisHorsForfait['libelle'];
						$date = $unFraisHorsForfait['date'];
						$montant=$unFraisHorsForfait['montant'];
						$id = $unFraisHorsForfait['id']
						
				?>		
						<tr>
							<td> <?php echo $date ?></td>
							<td><?php echo $libelle ?></td>
							<td><?php echo $montant ?></td>
							<td><a href="index.php?uc=validerFrais&action=supprimerFrais&idFrais=<?php echo $id ?>" 
							onclick="return confirm('Voulez-vous vraiment supprimer ce frais?');">Supprimer ce frais</a></td>
							<td><a href="index.php?uc=validerFrais&action=reporterFiche&idFrais=<?php echo $id ?>" 
							onclick="return confirm('Voulez-vous vraiment reporter ce frais?');">Reporter ce frais</a></td>
						 </tr>
							
						<?php		 }  ?>	  
			 </table>
		</div> 
	</div>
</div>

    
			
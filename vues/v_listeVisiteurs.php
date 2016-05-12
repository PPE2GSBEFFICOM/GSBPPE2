<div class="col-md-6">
	<div class="content-box-large">
		<div class="panel-heading">
			<h2>Validation des fiches de frais</h2>
			<h3>Visiteur médical : </h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" role="form" action="index.php?uc=validerFrais&action=voirEtatFrais" method="post">
				<div class="form-group">
					<select class="form-control" id="lstVisiteurs" name="lstVisiteurs">
           <?php
 			foreach ($lesVisiteurs as $unVisiteur){
 				$id = $unVisiteur['id'];
				$nom =  $unVisiteur['nom'];
				$_SESSION['nom']=$nom;
				$prenom =  $unVisiteur['prenom'];
				$_SESSION['prenom']=$prenom;
				if(isset($id) && $id == $visiteurASelectionner){
				?>
				<option selected value="<?php echo $id ?>"><?php echo  $nom." ".$prenom ?> </option>
				<?php 
				}
				else{ ?>
				<option value="<?php echo $id ?>"><?php echo  $nom." ".$prenom ?> </option>
				<?php 
				}
			}
			 ?>
			 </select> 

      	</div>
      	</br>
		
			<div class="form-group">
				<input class="btn btn-info btn-lg" id="ok" type="submit" value="Valider" size="20" />

			</div>

			<h2>Mois :</h2>
		</div>
		<div class="panel-body">
			<select class="form-control" id="lstMois" name="lstMois">
            <?php
			foreach ($lesMois as $unMois)
			{
			    $mois = $unMois['mois'];
				$numAnnee =  $unMois['numAnnee'];
				$numMois =  $unMois['numMois'];
				if(isset($mois) && $mois == $moisASelectionner){
				?>
				<option selected value="<?php echo $mois ?>"><?php echo  $numMois."/".$numAnnee ?> </option>
				<?php 
				}
				else{ ?>
				<option value="<?php echo $mois ?>"><?php echo  $numMois."/".$numAnnee ?> </option>
				<?php 
				}
			
			}
           
		   ?>    
            
			</select>
       
        </div>
			<input class="btn btn-info btn-lg" id="ok" type="submit" value="Valider" size="20" />
		</div>
      </form> 
</div> 




      	
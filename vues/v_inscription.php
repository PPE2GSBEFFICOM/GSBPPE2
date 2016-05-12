<!DOCTYPE html>
<html>
<head>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
    <title>Gestion de frais GSB</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/profilcss/profil.css" rel="stylesheet">
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body background="assets/img/laboratoire.jpg">
	<div class="page-content container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-wrapper">
			        <div class="box">
			            <div class="content-wrap">
			                <h6>Créer un compte</h6>
							<form method="POST" action="index.php?uc=connexion&action=ajouterVisiteur">
								<input class="form-control" type="text" name="nom" placeholder="Nom">
								<input class="form-control" type="text" name="prenom" placeholder="Prenom">
								<input class="form-control" type="text" name="login" placeholder="Login">
								<input class="form-control" type="password" name="mdp" placeholder="Mot de passe">
								<input class="form-control" type="text" name="type" value="visiteur" style="display:none">
			                <div class="action">
			                    <input type="submit" class="btn btn-primary signup">
			                </div>                
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>
	
<?php session_destroy(); ?>


	</body>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
  </body>
</html>
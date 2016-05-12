<?php
    $content = " 

	<body>

		<img src=\"../assets/img/petitgsb.png\" />

<h1> Récapitulatif remboursement des fiches de frais </h1>

<h3> Montant des frais forfaitisés </h3>

<br />

		
	</body>
	
	
	
	<style>
	
	body {
		text-align: center;
	}
	
	h3 {
	text-align: center;
	}
	
	
	p {
	
	text-align: center;
	}
	h1 {
	text-align: center;
	}
	
	table {
	border-collapse: collapse;
	margin: auto;
	width: ;
	}
	
	td, tr, th { 
	border: solid grey 1px;
	text-align: center;
	width: 150px;
	}
	
	</style>";

    require_once(dirname(__FILE__).'/html2pdf/html2pdf.class.php');
	$tab = $_GET['a'];
	$montant = $_GET['b'];
    $html2pdf = new HTML2PDF('P','A4','fr');
    $html2pdf->WriteHTML($content);
	$html2pdf->writeHTML($tab);
	$html2pdf->writeHTML('<br /><br /><br /><h1>Le montant des frais remboursés est de : '.$montant.'€</h1> <br />');
	
    $html2pdf->Output('recap.pdf');
?>
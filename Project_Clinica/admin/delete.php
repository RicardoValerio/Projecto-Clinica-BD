<?php 

require 'verificaSessions.php';
include '../MODEL/databaseConnection.php';

// armazena a query certa 
	 $sql = ($_GET['t'] === "utentes") ?
				 "DELETE FROM " . $_GET['t'] . " WHERE email='" . $_GET['pk'] ."'"
			:
				 "DELETE FROM " . $_GET['t'] . " WHERE id=" . $_GET['pk'] ;

// executa a query acima armazenada e retorna o numero rows eliminadas. Caso seja superior a zero, a condição é avaliada como verdadeira, então:
	if($delete_count = $connection->exec($sql)){
		// redirecciona o administrador para o index da pasta admin
	    header("Location: index.php");
	}else{
		// caso contrário redirecciona para a página "erro.php"
	    header("Location: erro.php");
	}


 ?>
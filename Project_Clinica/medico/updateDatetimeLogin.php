<?php 

$sql = "UPDATE medicos_administracao_de_consultas 
		SET datetime_ultimo_login = NOW() 
		WHERE username='" . $_SESSION['username'] . "'" ;

$update_count = $connection->exec($sql);

 ?>
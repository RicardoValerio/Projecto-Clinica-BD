<?php 

$sql = "UPDATE administradores 
		SET datetime_ultimo_login = NOW() 
		WHERE username='" . $_SESSION['username'] . "'" ;

$update_count = $connection->exec($sql);

 ?>
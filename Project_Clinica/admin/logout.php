<?php require 'verificaSessions.php'; ?>

<?php

// sequência de comandos que destrói a sessão existente
	session_start();
	session_unset(); 
	session_destroy();

// redirecciona para o index da pagina root 
	header("Location: ../index.php");
	exit();
?>
<?php
	session_start();
	// avalia se não está definida uma sessão com username e password contidos na variável global $_SESSION. 
	// Caso isso seja verdade então, por segurança, redirecciona a pessoa curiosa para o index da pasta root (index do site).
	if(!isset($_SESSION["username"]) || !isset($_SESSION["password"])) {
		header("Location: ../index.php");
	}
?>
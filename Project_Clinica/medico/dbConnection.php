<?php

$host = "localhost:8080";
$user = "projecto";
$pass = "pass";
$banco = "projecto_clinica";
$conexao = mysql_connect($host, $user, $pass) or die (mysql_error());
mysql_select_db($banco) or die (mysql_error());

?>
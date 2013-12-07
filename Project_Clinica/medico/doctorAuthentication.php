<?php require 'dbConnection.php'; ?>
<?php
// atribui a duas variáveis os valores que estão dentro da variável global $_POST
$username=$_POST['username'];
$password=$_POST['password'];

// armazena o resultado da execução da query passada como argumento
$sql = mysql_query("SELECT * FROM medicos_administracao_de_consultas WHERE username = '$username' AND password = '$password'") or die (mysql_error()) ; 

// atribui à variável $row, o número de rows que foram retornadas na execução do comando anterior
$row = mysql_num_rows ($sql);

// verifica se o nº de rows é maior que zero.
// caso seja então:
if($row > 0) {
	
	// inicia uma session - consists of a way to preserve certain data across subsequent accesses.
	session_start();
	
	// atribui à variável global $_SESSION os valores vindo de $_POST de forma a serem conservados durante a sessão
	$_SESSION['username']=$_POST['username'];
	$_SESSION['password']=$_POST['password'];
	
	// redirecciona o médico para o index da pasta "medico"
	header("Location: index.php");
} else {
	
	// redirecciona a pessoa que tentou passar-se por médico, ou o médico que se enganou nas suas credenciais para o index da pasta root, ou seja, o index do site
	header("Location: ../index.php");
}

?>

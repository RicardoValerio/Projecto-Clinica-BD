<?php 


// banco de dados, host e base de dados a usar.
$dsn = 'mysql:host=localhost;dbname=projecto_clinica';

$username = 'projecto';
$passwd = 'pass';

/////////////////////////////////////////////////
//                PHP DATA OBJECTS
//    PODE SER USADA COM VARIAS BASES DE DADOS
/////////////////////////////////////////////////

// cria a conecção à base de dados
try {

    $connection = new PDO($dsn, $username, $passwd);
    // echo "Conecção bem sucedida <br /><br />";

} catch (PDOException $e) {
    $error_message = $e->getMessage();
    // echo '<strong>Houve um erro ao tentar conectar! </strong>' . $error_message;
	// die();
}



 ?>

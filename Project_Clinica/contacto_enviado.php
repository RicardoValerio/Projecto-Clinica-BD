<?php 

require 'MODEL/databaseConnection.php';
  
// variavel booleana inicializada a false para que, se no caso de não tiver sido submetido o formulário na página, seja disposto o mesmo.
// esta variável vai funcionar essencialmente como um switch onde irá permitir dispor o conteúdo correcto na página em função do conteúdo dentro da variável global $_POST
$insert_bool = false;

// verifica se o array global que armazena os valores passados por POST não está vazio.
// Se não está vazio, nesse caso:
  if (!empty($_POST)) {
       
       // armazena a query a executar
      $sql = "INSERT INTO questoes_online (nome, email, mensagem, datetime_questao) 
              VALUES ('". $_POST['nome'] ."', '". $_POST['email'] ."', '". $_POST['questao'] ."', NOW() ) ";

        // executa a query e verifica o valor booleano retornado da sua execução.
              // se for executado com sucesso então:
        if($connection->exec($sql)){
          // altera a variável criada no topo do ficheiro para o estado booleano oposto, ou seja, true
          $insert_bool = true;
        }
  }


 ?>

<!DOCTYPE html>

<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8" />

  <!-- Set the viewport width to device width for mobile -->
  <meta name="viewport" content="width=device-width" />

  <title>Pseudo Clínica - Clínica de Saúde e Bem-Estar</title>

  <!-- Included CSS Files (Uncompressed) -->
 
  <link rel="stylesheet" href="stylesheets/foundation.css">

  <!-- FONTES GOOGLE
  ================================================== -->
  <link href='http://fonts.googleapis.com/css?family=Strait' rel='stylesheet' type='text/css'>
  

  <!-- Included CSS Files (Compressed) -->
  <!-- <link rel="stylesheet" href="stylesheets/foundation.min.css">-->
  <link rel="stylesheet" href="stylesheets/app.css">

  <script src="javascripts/modernizr.foundation.js"></script>
</head>

<style>
  textarea{ 
  resize: none;
  }

</style>

<body>


  <!-- Main Page Content and Sidebar -->

  <div class="row">
    <div class="panel">
    <div class="row">
    

<!-- Header and Nav -->
     <div class="row">
        <div class="three columns">
          <h1><a href="index.php"><img src="images/banners_logos/logo.png" /></a></h1>
        </div>
        <div style="text-align: center;" class="nine columns">
          <ul class="nav-bar right">
            <li><a href="PluginGaleria/GaleriaFlag.php">Galeria</a></li>           
            <li style="background-color: rgb(190, 196, 48);"><a style="font-weight: bold;" href="admin.php">Admin</a></li>
            <li style="background-color: #508AD1;"><a style="font-weight: bold;" href="medico.php">Médicos</a></li>

          </ul>
        </div>

        <div style="text-align: center;" class="twelve columns">
          <ul class="nav-bar right">
            <li><a href="index.php">Home</a></li>
            <li><a href="especialidades.php">Especialidades</a></li>
            <li><a href="vantagens.php">Vantagens</a></li>
            <li><a href="acordos.php">Acordos</a></li>
            <li class="nav_select"><a href="contactos.php">Contactos</a></li>
            <li style="background-color: #4DBB14; font-weight: bold;"><a href="inscricao.php">Marcação de Consulta Online</a></li>
          </ul>
        </div>
      </div>


      
              <div class="nine columns" id="m">
                <h3>Obrigado...</h3>
                <p>Entraremos em contacto consigo brevemente... </p>
              </div>
      
       
        
    
      <!-- Sidebar -->
    
      <div style="text-align: center;" class="three columns">
    
        <h5>Onde Estamos?</h5>
    
        <!-- Clicking this placeholder fires the mapModal Reveal modal -->
        <p>
          <a href="" data-reveal-id="mapModal"><img src="images/QrCode/email.png" /></a><br />
          <a href="http://maps.google.pt/maps" target="_blank">Ver mapa</a>
        </p>
    
       <strong>Telefone:</strong> 21 356 06 06<br>
                      <strong>Telemóvel:</strong> 91 348 86 92<br>
                      <strong>Nº Azul:</strong> 210 128 457<br><br>
                      <strong>Email:</strong> <a href="mailto:sabermais@pseudoclinica.pt">sabermais@pseudoclinica.pt</a>
        
        <br><hr><br>      
      <p>
        <a>Horário</a>
      </p>
      <h6>Todos os dias:</h6>
      <p>das 8h às 20h</p>
      <!-- End Sidebar -->
    </div>
    
    <!-- End Main Content and Sidebar -->
    
    
    <!-- Footer -->
    
    <footer class="row">
      <div class="twelve columns">
        <hr />
        <div class="row">
          <div class="six columns">
            <p>2012 Rv.</p>
          </div>
          <div class="six columns">
            <ul class="link-list right">
              <li><a href="index.php">Home</a></li>
                <li><a href="especialidades.php">Especialidades</a></li>
                <li><a href="vantagens.php">Vantagens</a></li>
                <li><a href="acordos.php">acordos</a></li>
                <li><a class="seleccionado" href="contactos.php">Contactos</a></li>
                <li><a href="inscricao.php">Marcações Online</a></li>
                <li><a href="PluginGaleria/GaleriaFlag.php">Galeria</a></li>
              </ul>
            </ul>
          </div>
        </div>
      </div>
    </footer>
    
    <!-- End Footer -->
    
    
    
    <!-- Map Modal -->
    
    <div class="reveal-modal" id="mapModal">
      <h4>Onde Estamos:</h4>
      <p style="text-align:center;"><img src="images/QrCode/email.png" /></p>
    <p style="text-align:center;">Sediada na Rua do Paradoxo nº236 .
</p>
      <!-- Any anchor with this class will close the modal. This also inherits certain styles, which can be overriden. -->
      <a href="#" class="close-reveal-modal">&times;</a>
    </div>
  <!-- End Modal -->

</div> <!--fim do panel moldura-->
  </div>  <!--fim da row moldura-->



  <!-- Included JS Files (Uncompressed) -->
  <!--
  
  <script src="javascripts/jquery.js"></script>
  
  <script src="javascripts/jquery.foundation.mediaQueryToggle.js"></script>
  
  <script src="javascripts/jquery.foundation.forms.js"></script>
  
  <script src="javascripts/jquery.foundation.reveal.js"></script>
  
  <script src="javascripts/jquery.foundation.orbit.js"></script>
  
  <script src="javascripts/jquery.foundation.navigation.js"></script>
  
  <script src="javascripts/jquery.foundation.buttons.js"></script>
  
  <script src="javascripts/jquery.foundation.tabs.js"></script>
  
  <script src="javascripts/jquery.foundation.tooltips.js"></script>
  
  <script src="javascripts/jquery.foundation.accordion.js"></script>
  
  <script src="javascripts/jquery.placeholder.js"></script>
  
  <script src="javascripts/jquery.foundation.alerts.js"></script>
  
  <script src="javascripts/jquery.foundation.topbar.js"></script>
  
  <script src="javascripts/jquery.foundation.joyride.js"></script>
  
  <script src="javascripts/jquery.foundation.clearing.js"></script>
  
  <script src="javascripts/jquery.foundation.magellan.js"></script>
  
  -->
  
  <!-- Included JS Files (Compressed) -->
  <script src="javascripts/jquery.js"></script>
  <script src="javascripts/foundation.min.js"></script>
  
  <!-- Initialize JS Plugins -->
  <script src="javascripts/app.js"></script>



</body>
</html>

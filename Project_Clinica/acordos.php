<?php require 'MODEL/databaseConnection.php'; ?>

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
  <!-- <link rel="stylesheet" href="stylesheets/foundation.min.css"> -->
  <link rel="stylesheet" href="stylesheets/app.css">

  <script src="javascripts/modernizr.foundation.js"></script>




</head>

<!-- ////////////////////////////////////////////////////////////////////////////////////// -->

<body>
  
  <div class="row">
    <div class="twelve columns">

      <div class="panel">

      <!-- Header and Nav -->
      
      <div class="row">
        <div class="three columns">
          <h1><a href="index.html"><img src="images/banners_logos/logo.png" /></a></h1>
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
            <li class="nav_select"><a href="acordos.php">Acordos</a></li>
            <li><a href="contactos.php">Contactos</a></li>
            <li style="background-color: #4DBB14; font-weight: bold;"><a href="inscricao.php">Marcação de Consulta Online</a></li>
          </ul>
        </div>
      </div>
      
      <!-- End Header and Nav -->
      
      
      
      <!-- TITULO PARA APARECER COM EFEITO JQUERY
      ================================================== -->
      <div class="row">
        <div class="twelve columns">
          <div style="text-align: center;" class="panel">
            <h2 style="text-align: center;"><span class="">Acordos da Pseudo Clínica =)</span></h2>
            <p>As nossas parecerias permitem-lhe usufruir de uma vasta comodidade de serviços e produtos.</p>
          </div>
        </div>
      </div>
    
      
      
      <div class="row">

<!-- Bloco de PHP responsável por colocar todas as fotos inerentes às empresas que possuem acordo coma clínica, que estão armazenadas na base de dados -->
            <?php 
            
            $sql = 'SELECT instituicao, foto_instituicao FROM acordos';
            ?>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
          <?php if ($result_set = $connection->query($sql)): ?>
               <?php foreach ($result_set as $coluna): ?>
             
                  <div style="text-align:center; float:left;" class="three columns panel">
                    <!-- coloca o nome de cada instituição -->
                    <h6 style="text-align:center;"><?php echo ucwords($coluna['instituicao']); ?></h6>
                    <!-- coloca a foto de cada instituição -->
                    <img src="images/acordos/<?php echo $coluna['foto_instituicao']; ?>" alt="<?php echo $coluna['instituicao']; ?>">
                  </div>

              <?php endforeach ?>
          <?php endif ?>
              
          
      </div>
      
     
  

      <!-- Footer -->
      
      <footer class="row">
        <div class="twelve columns">
          <hr />
          <div class="row">
            <div class="six columns">
              <p>Lisboa, 2013 | UE - Base de Dados</p>
            </div>
            <div class="six columns">
              <ul class="link-list right">
                <li><a href="index.php">Home</a></li>
                <li><a href="especialidades.php">Especialidades</a></li>
                <li><a href="vantagens.php">Vantagens</a></li>
                <li><a class="seleccionado">Acordos</a></li>
                <li><a href="contactos.php">Contactos</a></li>
                <li><a href="inscricao.php">Marcações Online</a></li>
                <li><a href="PluginGaleria/GaleriaFlag.php">Galeria</a></li>

              </ul>
            </div>
          </div>
        </div> 
      </footer>
    



      </div> <!-- FIM DO PANEL -->
    </div> <!-- FIM DAS DOZE COLUNAS -->
</div>  <!-- FIM DA ROW QUE SERVE DE MOLDURA -->
  

<!--///////////////////////////////////////////////////////////////////////////////////////////-->


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

  <script type="text/javascript">
     $(window).load(function() {
         $('#slider').orbit();
     });

    
  </script>
  

</body>
</html>

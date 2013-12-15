<!--  Ficheiro que verifica se existe alguma sessão iniciada -->
<?php require 'verificaSessions.php'; ?>

<?php require '../MODEL/databaseConnection.php'; ?>

<!-- ficheiro que faz o update do ultimo datetime de login do administrador na base de dados -->
<?php require 'updateDatetimeLogin.php'; ?>

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
  
  <link rel="stylesheet" href="../stylesheets/foundation.css">
  
  <!-- FONTES GOOGLE
  ================================================== -->
  <link href='http://fonts.googleapis.com/css?family=Strait' rel='stylesheet' type='text/css'>
  
  <!-- Included CSS Files (Compressed) -->
  <!-- <link rel="stylesheet" href="stylesheets/foundation.min.css"> -->
  <link rel="stylesheet" href="../stylesheets/app.css">

  <script src="../javascripts/modernizr.foundation.js"></script>




</head>

<!-- ////////////////////////////////////////////////////////////////////////////////////// -->

<body>
  
  <div class="row">
    <div class="twelve columns">

      <div class="panel">

      <!-- Header and Nav -->
      
      <div class="row">
        <div class="three columns">
          <h1><a href="index.php"><img src="../images/banners_logos/logo.png" /></a></h1>
        </div>
        <div style="text-align: center;" class="nine columns">
          <ul class="nav-bar right">
            <li style="background-color: rgb(190, 196, 48);"><a style="font-weight: bold;" href="index.php">Admin Zone</a></li>
            <li style="background-color: rgb(190, 196, 48);"><a style="font-weight: bold;" href="logout.php">Logout</a></li>
          </ul>
        </div>

       </div>
      
      <!-- End Header and Nav -->
      

       <div class="row">
        <div class="twelve columns">
          <div class="panel">
                                                                                      <!-- Mostra o username do administrador que está armazenado na variável global $_SESSION quando foi autenticado-->
            <h2 style="text-align: center;">Welcome Admin <span style="color:red;"><?php echo $_SESSION['username']; ?></span></h2>
          </div>
        </div>
      </div>

      
      <div class="row">
        
        <div style="text-align: center;" class="eight columns">
              <ul class="nav-bar vertical">
                
<!-- Bloco de PHP responsável por colocar os nomes de todas as tabelas existentes na base de dados, dentro de <li's> a fim de dispor o menu de navegação, e para as respectivas hiperligações com destino a "create.php" e "rud.php" estão a ser passados como argumentos via GET o nome dessas mesmas tabelas -->

          <?php $sql = 'SHOW TABLES'; ?>

                     <?php if ($result_set = $connection->query($sql)): ?>
                           <?php foreach ($result_set as $coluna): ?>

                                    <?php if (
                                      $coluna[0] == "view_consultas_do_mes_currente" || 
                                      $coluna[0] == "view_consultas_marcadas" || 
                                      $coluna[0] == "view_emails_web_marketing" || 
                                      $coluna[0] == "view_historico_consultas_realizadas" || 
                                      $coluna[0] == "view_medicos_num_consultas" || 
                                      $coluna[0] == "view_nome_medicos_consultas_marcadas" || 
                                      $coluna[0] == "view_preco_maior_ou_igual_40" || 
                                      $coluna[0] == "view_telemoveis_96" 
                                      ) 
                                      continue;
                                    ?>
                                      
                            <li class="has-flyout">

                                  <a href="#"><?php echo $coluna[0]; ?></a>
                                  <a href="#" class="flyout-toggle"><span> </span></a>

                                  <ul class="flyout">
                                    <li><a href="create.php?t=<?php echo $coluna[0]; ?>">Create</a></li>
                                    <li><a href="rud.php?t=<?php echo $coluna[0]; ?>">R. U. D.</a></li>
                                  </ul>

                            </li>
                           
                           <?php endforeach ?>
                     <?php endif ?>
              </ul>
                 
          </div> 
        </div>
      
      
     <div class="row">
        <div class="panel">
          <h2 style="text-align: center;">Gestão de Salários</h2>
        </div>
        <div style="text-align: center;" class="twelve columns center">
              <ul class="nav-bar vertical">
                  
                  <li><a href="salarios.php">Salários de Médicos</a></li>
                  
              </ul>
          </div> 
        </div>
      


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
  <script src="../javascripts/jquery.js"></script>
  <script src="../javascripts/foundation.min.js"></script>
  
  <!-- Initialize JS Plugins -->
  <script src="../javascripts/app.js"></script>

  <script type="text/javascript">
     $(window).load(function() {
         $('#slider').orbit();
     });

    
  </script>
  

</body>
</html>

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
            <h2 style="text-align: center;">Gestão de Salários</h2>
          </div>
        </div>
      </div>

<!-- MAX()*************************************************************** -->
<?php 
$sql = "SELECT primeiro_nome, 
               ultimo_nome, 
               salario_mensal 
          FROM medicos 
          WHERE salario_mensal = (SELECT MAX(salario_mensal) FROM medicos)";

$result_set = $connection->query($sql); 
$row = $result_set->fetch();

?>
       <div class="row">
            <div class="twelve columns">
              <h2>MAX()</h2>
                  <div class="panel">
                      <table class="twelve">
                            <thead>
                              <tr>
                                <th></th>
                                <th style="text-align: center;">Salário Máximo</th>
                                <th></th>
                              </tr>
                              <tr>
                                  <th style="text-align: center;">Primeiro Nome</th>
                                  <th style="text-align: center;">Último Nome</th>
                                  <th style="text-align: center;">Salário</th>
                              </tr>
                            </thead>
                              <tbody>
                                      <tr>
                                          <td style="text-align: center; vertical-align: middle; border:1px solid #CFB5B5; "><?php echo $row[0]; ?></td> 
                                          <td style="text-align: center; vertical-align: middle; border:1px solid #CFB5B5; "><?php echo $row[1]; ?></td>
                                          <td style="text-align: center; vertical-align: middle; border:1px solid #CFB5B5; "><?php echo $row[2]; ?></td> 
                                      </tr>
                             </tbody>
                      </table>
                                    
                
                  </div>
            </div>
      </div>


     
<!-- MIN()*************************************************************** -->
<?php 
$sql = "SELECT primeiro_nome, 
               ultimo_nome, 
               salario_mensal 
          FROM medicos 
          WHERE salario_mensal = (SELECT MIN(salario_mensal) FROM medicos)";

$result_set = $connection->query($sql); 
$row = $result_set->fetch();

?>
       <div class="row">
            <div class="twelve columns">
              <h2>MIN()</h2>
                  <div class="panel">
                      <table class="twelve">
                            <thead>
                              <tr>
                                <th></th>
                                <th style="text-align: center;">Salário Mínimo</th>
                                <th></th>
                              </tr>
                              <tr>
                                  <th style="text-align: center;">Primeiro Nome</th>
                                  <th style="text-align: center;">Último Nome</th>
                                  <th style="text-align: center;">Salário</th>
                              </tr>
                            </thead>
                              <tbody>
                                      <tr>
                                          <td style="text-align: center; vertical-align: middle; border:1px solid #CFB5B5; "><?php echo $row[0]; ?></td> 
                                          <td style="text-align: center; vertical-align: middle; border:1px solid #CFB5B5; "><?php echo $row[1]; ?></td>
                                          <td style="text-align: center; vertical-align: middle; border:1px solid #CFB5B5; "><?php echo $row[2]; ?></td> 
                                      </tr>
                             </tbody>
                      </table>
                                    
                
                  </div>
            </div>
      </div>


   <!-- AVG()*************************************************************** -->
<?php 
$sql = "SELECT AVG(salario_mensal) FROM medicos";

$result_set = $connection->query($sql); 
$row = $result_set->fetch();

?>
       <div class="row">
            <div class="twelve columns">
              <h2>AVG()</h2>
                  <div class="panel">
                      <table class="twelve">
                            <thead>
                              <tr>
                                  <th style="text-align: center;">Média de Salários</th>
                              </tr>
                            </thead>
                              <tbody>
                                      <tr>
                                          <td style="text-align: center; vertical-align: middle; border:1px solid #CFB5B5; "><?php echo $row[0]; ?></td>
                                      </tr>
                             </tbody>
                      </table>
                                    
                
                  </div>
            </div>
      </div>



<!-- SUM()*************************************************************** -->
<?php 
$sql = "SELECT SUM(salario_mensal) FROM medicos";

$result_set = $connection->query($sql); 
$row = $result_set->fetch();

?>
       <div class="row">
            <div class="twelve columns">
              <h2>SUM()</h2>
                  <div class="panel">
                      <table class="twelve">
                            <thead>
                              <tr>
                                  <th style="text-align: center;">Sumatório de Salários</th>
                                
                            </thead>
                              <tbody>
                                      <tr>
                                          <td style="text-align: center; vertical-align: middle; border:1px solid #CFB5B5; "><?php echo $row[0]; ?></td> 
                                          
                                      </tr>
                             </tbody>
                      </table>
                                    
                
                  </div>
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

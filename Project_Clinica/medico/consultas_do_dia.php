<?php require 'verificaSessions.php'; ?>
<?php require '../MODEL/databaseConnection.php'; ?>


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

<body style="background: #508AD1;" >
  
  <div class="row">
    <div style="width:auto;" class="twelve columns">

      <div class="panel">

      <!-- Header and Nav -->
      
      <div class="row">
        <div class="three columns">
          <h1><a href="index.php"><img src="../images/banners_logos/logo.png" /></a></h1>
        </div>
        <div style="text-align: center;" class="nine columns">
          <ul class="nav-bar right">
            <li style="background-color: rgb(190, 196, 48);"><a style="font-weight: bold;" href="index.php">Doctor Zone</a></li>
            <li style="background-color: rgb(190, 196, 48);"><a style="font-weight: bold;" href="logout.php">Logout</a></li>
          </ul>
        </div>

       </div>
      
      <!-- End Header and Nav -->
      

       <div class="row">
        <div class="twelve columns">
          <div class="panel">
            
            <h2 style="text-align: center;">Consultas do Dia</h2>
          </div>
        </div>
      </div>

      
      <div class="row">
        
        <div style="text-align: center;" class="eight columns center">
              <table class="twelve">
  <thead>
    

    <tr>


<!-- bloco de PHP que criar o header da tabela HTML com todos os campos da tabela "consultas_com_marcacao_confirmada_a_realizar" -->
      <?php $sql = 'DESCRIBE consultas_com_marcacao_confirmada_a_realizar'; ?>

         <?php if ($result_set = $connection->query($sql)): ?>
              <?php foreach ($result_set as $coluna): ?>
   
              <th style="text-align: center; vertical-align: middle;" ><?php echo $coluna[0]; ?></th>
          
              <?php endforeach ?>
         <?php endif ?>
           
              <th style="text-align: center; vertical-align: middle;" >Action</th>
          </tr>
        </thead>
  <tbody>
    
    <?php 
        $date = new DateTime();
        $sql = "SELECT * 
                  FROM consultas_com_marcacao_confirmada_a_realizar 
                  WHERE data_consulta = '". $date->format('m/d/Y') ."' 
                  AND medicos_id = (SELECT medicos_administracao_de_consultas.medicos_id 
                  FROM medicos_administracao_de_consultas 
                  WHERE medicos_administracao_de_consultas.username = '". $_SESSION['username'] . "')";
    ?>
 
           <?php if ($result_set = $connection->query($sql)): ?>
                    <?php foreach ($result_set as $coluna): ?>
                    
                    <!-- coloca as oito celulas correspondentes ao campo do result set a ser iterado -->
                      <tr>
                          <td style="text-align: center; vertical-align: middle;"><?php echo $coluna[0]; ?></td>   
                          <td style="text-align: center; vertical-align: middle;"><?php echo $coluna[1]; ?></td>   
                          <td style="text-align: center; vertical-align: middle;"><?php echo $coluna[2]; ?></td>   
                          <td style="text-align: center; vertical-align: middle;"><?php echo $coluna[3]; ?></td>   
                          <td style="text-align: center; vertical-align: middle;"><?php echo $coluna[4]; ?></td>   
                          <td style="text-align: center; vertical-align: middle;"><?php echo $coluna[5]; ?></td>
                          
                          <td style="text-align: center; vertical-align: middle;">
                            <!-- coloca um botão para cada linha iterada com um link que contem um ficheiro php que irá confirmar a realização da consulta e que passa como argumento a chave primária da tabela "consultas_com_marcacao_confirmada_a_realizar" e o email do utente que é chave primária da tabela "utentes" -->
                          <a class=" radius success button" href="confirmar_consulta.php?pk=<?php echo $coluna[0];?>&ue=<?php echo $coluna[5];?>">Confirmar Realização</a>
                          </td>

                      </tr>
                          
                    <?php endforeach ?>
          <?php endif ?>
                    
  </tbody>
</table>
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

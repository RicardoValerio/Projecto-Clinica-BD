<?php require 'verificaSessions.php'; ?>
<?php require '../MODEL/databaseConnection.php'; ?>


<!-- bloco de PHP responsável por inserir e eliminar o dados das tabelas que diz respeito a consultas marcadas a realizar e consultas realizadas -->
<?php 
// se a variavel global não está vazia, então
      if (!empty($_POST)) {
          
// armazena a query vai inserir na tabela "consultas_realizadas" os valores apropriados aos seus campos.
          $sql = "INSERT INTO consultas_realizadas 
                            (datetime_consulta_realizada, 
                             valor_consulta, 
                             diagnostico,
                             prescricao,
                             medicos_id, 
                             utentes_email
                            ) 
                          VALUES( NOW(), 
                                ( SELECT preco_consulta FROM especialidades, medicos 
                                  WHERE medicos.id = ( 
                                                        SELECT medicos_administracao_de_consultas.medicos_id 
                                                        FROM medicos_administracao_de_consultas 
                                                        WHERE medicos_administracao_de_consultas.username = '". $_SESSION['username'] . "'
                                                      ) 
                                        AND medicos.especialidades_id = especialidades.id
                                  ), '". 
                                  $_POST['diagnostico'] ."','". 
                                  $_POST['prescricao'] ."', 
                                  ( SELECT medicos_administracao_de_consultas.medicos_id 
                                    FROM medicos_administracao_de_consultas 
                                    WHERE medicos_administracao_de_consultas.username = '". $_SESSION['username'] ."'
                                  ), '".
                                  $_GET['ue'] . "'
                                )";
              
          // se a a query for executada com sucesso o seu numero de linha for superior a zero, então:
          if($insert_count = $connection->exec($sql)){

              // armazena a query que irá eliminar o registo da consulta na tabela "consultas_com_marcacao_confirmada_a_realizar" que diz respeito ao registido acabado de ser inserido na tabela "consultas_realizadas"
              $sql = "DELETE FROM consultas_com_marcacao_confirmada_a_realizar WHERE id=" . $_GET['pk'];

              // executa a query de elimanação de registo
              $connection->exec($sql);
              // redirecciona o médico para o index da pasta medico 
              header("Location: index.php");

          }else{
            // caso contrário redirecciona o médico para o ficheiro erro.php, onde é notificado
              header("Location: erro.php");
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
          </div>
            <h2 style="text-align: left;">Relatório da Consulta <span style="font-size: 22px; color:green;"></span></span></h2>
        </div>
      </div>

      
      <div class="row">
        
        <div style="text-align: center;" class="twelve columns">
              
              <!-- o próprio ficheiro vai processar o formulário e é passado como argumento a chave primária do registo de consulta a confirmar bem como o email do utente , isto para poder realizar a query após o processamento!-->
        <form action="?pk=<?php echo $_GET['pk'];?>&ue=<?php echo $_GET['ue'];?>" method="POST">

                      
                     <hr>

                   <div class="row">
                       <div class="twelve columns">
                            <p> Diagnóstico:<span style="color:red;"></span></p>
                       </div> 
    <!-- atributo name contem o diagnostico -->
                        <textarea style="resize:none;" name="diagnostico" id="" cols="30" rows="10"></textarea>

                   </div>
                      
                   <div class="row">
                       <div class="twelve columns">
                            <p> Prescrição:<span style="color:red;"></span></p>
                       </div> 
  <!-- atributo name contem a prescriçao -->
                        <textarea style="resize:none;" name="prescricao" id="" cols="30" rows="10"></textarea>

                   </div>
                      

                  <div class="twelve columns" style="text-align: center;">
                    <input class=" large button success" type="submit" value="Confirmar Consulta Realizada">
                  </div>

        </form>   


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

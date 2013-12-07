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

<body>
  
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
           <li style="background-color: rgb(190, 196, 48);"><a style="font-weight: bold;" href="index.php">Admin Zone</a></li>
            <li style="background-color: rgb(190, 196, 48);"><a style="font-weight: bold;" href="logout.php">Logout</a></li>
          </ul>
        </div>

       </div>
      
      <!-- End Header and Nav -->
      

       <div class="row">
        <div class="twelve columns">
          <div class="panel">
                                                                              <!-- escreve o username do admin que está armazenado na variável global $_SESSION -->
            <h2 style="text-align: center;">Welcome Admin <span style="color:red;"><?php echo $_SESSION['username']; ?></span></h2>
          </div>
                                                                                                    <!-- escreve o nome da tabela que está a ser passada por GET -->
            <h2 style="text-align: left;">R.U.D on Table <span style="font-size: 22px; color:green;"><?php echo $_GET['t']; ?></span></span></h2>
        </div>
      </div>

      
      <div class="row">
        
        <div style="text-align: center;" class="twelve columns">
                      
                      <table class="twelve">
                                      
                                  <thead>
                                    <tr>


                <?php $sql = "describe " . $_GET['t'] ; ?>
<!-- bloco de PHP que cria o header da tabela disposta. O tamanho deste header, assim como a tabela HTML, varia de acordo com a tabela da base de dados que está a ser passa por GET -->
                        <?php if ($result_set = $connection->query($sql)): ?>
                                <?php foreach ($result_set as $coluna): ?>

                                      <th style="text-align: center;"><?php echo $coluna[0]; ?></th>

                               <?php endforeach ?>
                       <?php endif ?>

                                    <th style="text-align: center;">Action</th>
                                    <th style="text-align: center;">Action</th>
                                    </tr>
                                  </thead>
                                          
            
                                          <tbody>
<!-- Bloco de PHP referente à tabela passada por GET -->
                      <?php 

                      // query que retorna o nº de campos existentes na tabela passada via GET
                          $count_fields = "SELECT COUNT(*) 
                                            FROM INFORMATION_SCHEMA.COLUMNS 
                                            WHERE TABLE_NAME = '" . $_GET['t']. "'";

                            // executa a query e armazena o result set numa variável que se irá tornar um array cujo valor será o número de campos
                           $numero_de_campos = $connection->query($count_fields)->fetch();

                           // armazena numa variavel a query select all from table passada por GET
                          $sql = 'SELECT * FROM ' . $_GET['t'];
                      ?>
                                    
                                    <!-- ciclo de PHP que irá criar a tabela HTML -->
                                    <?php if ($result_set = $connection->query($sql)): ?>
                                           <?php foreach ($result_set as $coluna): ?>
                                      
                                                      
                                                      <!-- este "for" dentro do "foreach" vai ser o bloco de php responsável por preencher cada linha da tabela HTML. A condição é: enquanto a celula (que é iniciada em zero) for menor que o número de campos, então executa o seu interior, isto é, coloca os valores referentes a esse campo formatado em <td> na tabela HTML -->
                                                  <tr>
                                                     <?php for ($celula=0; $celula < $numero_de_campos[0] ; $celula++): ?>
                                                            <td style="text-align: center; vertical-align: middle; border:1px solid #ADA1A1;"><p style="font-size:14px;"><?php echo $coluna[$celula]; ?></p></td>
                                                      <?php endfor; ?>
                                                    
                                               <!-- coloca os botões (Editar e Eliminar) para cada linha -->
                                                    <td style="text-align: center; vertical-align: middle;">

                                                      <!-- hiperligação do botão "Editar" leva a aplicação para um ficheiro chamado "update.php" quer irá processar a actualização da linha seleccionada. Como parâmetro está a ser passado o nome da tabela passada via GET e a sua chave primária passada na iteração do ciclo "foreach" -->
                                                        <a class=" radius button" href="update.php?t=<?php echo $_GET['t']; ?>&pk=<?php echo $coluna[0]; ?>">Editar</a>

                                                     </td>

                                                      <td style="text-align: center; vertical-align: middle;">

                                                        <!-- hiperligação do botão "Eliminar" leva a aplicação para um ficheiro chamado "delete.php" quer irá processar a liminação da linha seleccionada. Como parâmetro está a ser passado o nome da tabela passada via GET e a sua chave primária passada na iteração do ciclo "foreach" -->
                                                        <a class="alert radius button" href="delete.php?t=<?php echo $_GET['t']; ?>&pk=<?php echo $coluna[0]; ?>">Eliminar</a>

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

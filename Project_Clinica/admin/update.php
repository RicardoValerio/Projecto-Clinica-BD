<?php require 'verificaSessions.php'; ?>
<?php require '../MODEL/databaseConnection.php'; ?>

<?php 

// armazena a variável certa, dependente da tabela passada por GET
$sql = ($_GET['t'] === "utentes") ?
        "SELECT * FROM " . $_GET['t'] . " WHERE email= '" . $_GET['pk'] ."'"
    :   "SELECT * FROM " . $_GET['t'] . " WHERE id=" . $_GET['pk'];


//executa a query e retorna numa variável chamada "$linha_result_set" que fica a conter um array com apenas uma linha do result set
$linha_result_set = $connection->query($sql)->fetch();

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
                                                                                    <!-- escreve o username do administrador que está contido na variável global $_SESSION -->
            <h2 style="text-align: center;">Welcome Admin <span style="color:red;"><?php echo $_SESSION['username']; ?></span></h2>
          </div>
            
        </div>
      </div>

      
      <div class="row">
        
        <div style="text-align: center;" class="twelve columns">
             

             <!-- formulário que contem um ficheiro externo responsável por processar os valores passados via POST -->
             <form action="process_update.php" method="POST">
                  


              <!-- Pelo facto de o formulário ter o método POST estamos a passar os seguintes dois inputs de forma hidden para os mesmos não serem dispostos visualmente na página. -->

              <!-- passa para POST o nome da tabela onde se vai fazer o update-->
              <input type="hidden" name="tabela" value="<?php echo $_GET['t']; ?>">
              <!-- passa para POST o valor da chave primária para realmente poder fazer o update -->
              <input type="hidden" name="chave_primaria" value="<?php echo $_GET['pk']; ?>">

            <table class="twelve">
                            
                               <thead>
                                      <tr>
                                <!--  -->
                                <?php 
                                  // variável que irá conter um array com os valores do campos da tabela à medida que estes vão sendo incrementados no "foreach" abaixo
                                  $array_com_campos_da_tabela = array();

                                
                                  $sql = "describe " . $_GET['t'] ;
                                ?>
                                
                                <!-- bloco de PHP que irá colocar as celulas apropriadas de cada coluna -->
                                <?php if ($result_set = $connection->query($sql)): ?>
                                    <?php foreach ($result_set as $coluna):

                                        // variável criada acima que irá conter os valores de cada coluna, isto para poder passar por POST quando estiver a criar as textareas.
                                         $array_com_campos_da_tabela[] = $coluna[0];
                                      ?>
                                          <th style="text-align: center;"><?php echo $coluna[0]; ?></th>
                                      
                                    <?php endforeach ?>
                                <?php endif ?>
                            		</thead>
                                      
                                <tbody>
                            
                              <tr>
                                <!-- itera o numero de vezes quantas colunas forem. O facto de estar a dividir por 2 deve-se ao facto de a a variável "$linha_result_set" ser um array que contém o result set da query criada no topo do ficheiro e o mesmo acumular os mesmos valores duas vezes. Um em forma de indice numerico, e outro em forma assciativa(chave-valor). Deste modo, assegura-se o nº certo de campos -->
                           <?php for ($i=0; $i < (count($linha_result_set)/2) ; $i++): ?>

                                <td style="text-align: center; vertical-align: middle; border:1px solid #ADA1A1;">
                                    <!-- cria as textareas de forma iterativa e coloca no atributo "name" os respectivos campos do valores -->
                                    <!-- depois no texto da textarea coloca o valor da celula correcto de acordo com a query inicial no topo do ficheiro -->
                                  <textarea style="resize:none;" name="<?php echo $array_com_campos_da_tabela[$i]; ?>" cols="30" rows="5"><?php echo $linha_result_set[$i]; ?></textarea>
                                </td>
                                
                            <?php endfor; ?>
                           </tr>
                          
                            </tbody>
            </table>
                		
                	<td style="text-align: center; vertical-align: middle;">
                        <input type="submit" class=" radius button" value="Update">
                    </td>
        	        
                  	
                  	          </div> 
                  	   </form>     
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

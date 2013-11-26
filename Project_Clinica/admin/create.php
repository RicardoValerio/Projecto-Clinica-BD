<?php require 'verificaSessions.php'; ?>
<?php require '../MODEL/databaseConnection.php'; ?>
<?php 

if (!empty($_POST)) {
  
  // echo "<pre>"; 
  // print_r($_POST);
  // echo"</pre>";
  // die();


// switch que contém as queries para inserir os dados, passados em POST, na sua respectiva tabela passada em GET

       switch ($_GET['t']) {
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
          case 'acordos':
              
                    $sql = "INSERT INTO acordos 
                                  (datetime_acordo, 
                                   instituicao, 
                                   foto_instituicao
                                   ) 
                                VALUES ( NOW(), '". 
                                         $_POST['instituicao']      . "' , '" . 
                                         $_POST['foto_instituicao'] .
                                     "')" ;
                    
                    // caso a query seja executada com sucesso, então:
                    if($insert_count = $connection->exec($sql)){
                      // redirecciona o administrador para o index da pasta admin
                        header("Location: index.php");
                    }else{
                      // caso contrário redirecciona para a pagina erro.php
                        header("Location: erro.php");
                    }
                    
              
              break;
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
          case 'administradores':

                    $sql = "INSERT INTO administradores 
                                    (username, 
                                     password, 
                                     datetime_ultimo_login
                                    ) 
                              VALUES ('". $_POST['username'] . "', '" . 
                                          $_POST['password'] . "', 
                                          NOW() 
                                     )";
                    
                    // caso a query seja executada com sucesso, então:
                    if($insert_count = $connection->exec($sql)){
                      // redirecciona o administrador para o index da pasta admin
                        header("Location: index.php");
                    }else{
                      // caso contrário redirecciona para a pagina erro.php
                        header("Location: erro.php");
                    }

            break;
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
          case 'consultas_com_marcacao_confirmada_a_realizar':
              
              $sql = "INSERT INTO consultas_com_marcacao_confirmada_a_realizar 
                          (datetime_confirmacao, 
                           data_consulta, 
                           hora_consulta, 
                           medicos_id, 
                           utentes_email, 
                           especialidades_id, 
                           horarios_id
                           ) 
                      VALUES 
                            ( NOW(), '". 
                              $_POST['data_consulta']     .   "' , '"   . 
                              $_POST['hora_consulta']     .   "' ,  "   . 
                              $_POST['medicos_id']        .   "  , '"   . 
                              $_POST['utentes_email']     .   "' ,  "   .  
                              $_POST['especialidades_id'] .   "  ,  "   .  
                              $_POST['horarios_id'] . 
                           " )";

// caso a query seja executada com sucesso, então:
              if($insert_count = $connection->exec($sql)){
                // redirecciona o administrador para o index da pasta admin
                  header("Location: index.php");
              }else{
                // caso contrário redirecciona para a pagina erro.php
                erro($_POST);
                die();
                  header("Location: index.php");
              }

            break;
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
          case 'consultas_realizadas':

                  $sql = "INSERT INTO consultas_realizadas 
                                  (datetime_consulta_realizada, 
                                   valor_consulta, 
                                   diagnostico, 
                                   exame, 
                                   medicos_id, 
                                   utentes_id, 
                                   utentes_email
                                  ) VALUES ('" . $_POST['datetime_consulta_realizada'] . "', ". 
                                                 $_POST['valor_consulta'] .", '". 
                                                 $_POST['diagnostico'] ."', '". 
                                                 $_POST['exame'] ."'," . 
                                                 $_POST['medicos_id'] .", '" . 
                                                 $_POST['utentes_email'] . 
                                          "')" ;
                  
                  // caso a query seja executada com sucesso, então:
                  if($insert_count = $connection->exec($sql)){
                    // redirecciona o administrador para o index da pasta admin
                      header("Location: index.php");
                  }else{
                    // caso contrário redirecciona para a pagina erro.php
                      header("Location: erro.php");
                  }

            break;
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
          case 'especialidades':

                  $sql = "INSERT INTO especialidades 
                                  (especialidade, 
                                   descricao_especialidade, 
                                   preco_consulta
                                   ) VALUES ('". $_POST['especialidade'] ."','". 
                                                 $_POST['descricao_especialidade'] ."', " . 
                                                 $_POST['preco_consulta'] . 
                                          " )";
                  
                  // caso a query seja executada com sucesso, então:
                  if($insert_count = $connection->exec($sql)){
                    // redirecciona o administrador para o index da pasta admin
                      header("Location: index.php");
                  }else{
                    // caso contrário redirecciona para a pagina erro.php
                      header("Location: erro.php");
                  }

            break;
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
          case 'horarios':
              
                  $sql = "INSERT INTO horarios (descricao_horario) VALUES ('" . $_POST['descricao_horario'] ."')" ;

// caso a query seja executada com sucesso, então:
                  if($insert_count = $connection->exec($sql)){
                    // redirecciona o administrador para o index da pasta admin
                      header("Location: index.php");
                  }else{
                    // caso contrário redirecciona para a pagina erro.php
                      header("Location: erro.php");
                  }

            break;
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
          case 'medicos':
                 
                  $sql = "INSERT INTO medicos 
                                  (primeiro_nome, 
                                   ultimo_nome, 
                                   email, 
                                   contacto_tel, 
                                   foto, 
                                   especialidades_id, 
                                   horarios_id 
                                   ) 
                            VALUES ('" . $_POST['primeiro_nome'] ."', '". 
                                         $_POST['ultimo_nome'] ."', '". 
                                         $_POST['email'] ."', '" . 
                                         $_POST['contacto_tel'] ."', '". 
                                         $_POST['foto'] . "', " . 
                                         $_POST['especialidades_id'] . ", ". 
                                         $_POST['horarios_id'] .
                                   ")";
                  
                  // caso a query seja executada com sucesso, então:
                  if($insert_count = $connection->exec($sql)){
                    // redirecciona o administrador para o index da pasta admin
                      header("Location: index.php");
                  }else{
                    // caso contrário redirecciona para a pagina erro.php
                      header("Location: erro.php");
                  }

            break;
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
          case 'medicos_administracao_de_consultas':
                  
                  $sql = "INSERT INTO medicos_administracao_de_consultas 
                                (username, 
                                 password, 
                                 datetime_ultimo_login, 
                                 medicos_id
                                ) VALUES ('" . $_POST['username'] ."','". 
                                               $_POST['password'] ."','". 
                                               $_POST['datetime_ultimo_login'] ."', " . 
                                               $_POST['medicos_id'] . 
                                         ")";
                  
                  // caso a query seja executada com sucesso, então:
                  if($insert_count = $connection->exec($sql)){
                    // redirecciona o administrador para o index da pasta admin
                      header("Location: index.php");
                  }else{
                    // caso contrário redirecciona para a pagina erro.php
                      header("Location: erro.php");
                  }

            break;
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
          case 'questoes_online':
              
                  $sql = "INSERT INTO questoes_online 
                                    (nome, 
                                     email, 
                                     mensagem, 
                                     datetime_questao
                                     ) 
                              VALUES ('". $_POST['nome'] ."','".
                                          $_POST['email'] ."','". 
                                          $_POST['mensagem'] ."', 
                                          NOW() 
                                      )" ;
                  
                  // caso a query seja executada com sucesso, então:
                  if($insert_count = $connection->exec($sql)){
                    // redirecciona o administrador para o index da pasta admin
                      header("Location: index.php");
                  }else{
                    // caso contrário redirecciona para a pagina erro.php
                      header("Location: erro.php");
                  }

            break;
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
          case 'utentes':
              
                  $sql = "INSERT INTO utentes 
                                  (email, 
                                   primeiro_nome, 
                                   ultimo_nome, 
                                   morada, 
                                   contacto_tel, 
                                   datetime_registo
                                  ) 
                            VALUES ('" . $_POST['email'] ."','". 
                                         $_POST['primeiro_nome'] ."','". 
                                         $_POST['ultimo_nome'] ."','". 
                                         $_POST['morada'] ."','". 
                                         $_POST['contacto_tel'] ."', 
                                         NOW() 
                                   )";
                  
                  // caso a query seja executada com sucesso, então:
                  if($insert_count = $connection->exec($sql)){
                    // redirecciona o administrador para o index da pasta admin
                      header("Location: index.php");
                  }else{
                    // caso contrário redirecciona para a pagina erro.php
                      header("Location: erro.php");
                  }

            break;
      /////////////////////////////////////////////////////////////////////////////////////////////////////////
          case 'vantagens':

                  $sql = "INSERT INTO vantagens 
                                (titulo, 
                                 conteudo_vantagem
                                ) 
                            VALUES ('". $_POST['titulo'] ."','". 
                                        $_POST['conteudo_vantagem'] .
                                  "')";
                  
                  // caso a query seja executada com sucesso, então:
                  if($insert_count = $connection->exec($sql)){
                    // redirecciona o administrador para o index da pasta admin
                      header("Location: index.php");
                  }else{
                    // caso contrário redirecciona para a pagina erro.php
                      header("Location: erro.php");
                  }

            break;
      /////////////////////////////////////////////////////////////////////////////////////////////////////////

          default:
                header("Location: index.php ");
            break;
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
                                                                                    <!-- coloca o username do admin que está contido na variável global session -->
            <h2 style="text-align: center;">Welcome Admin <span style="color:red;"><?php echo $_SESSION['username']; ?></span></h2>
          </div>
                                                                                                <!-- coloca o nome da tabela que está a ser passada via GET -->
            <h2 style="text-align: left;">Create on Table <span style="font-size: 22px; color:green;"><?php echo $_GET['t']; ?></span></span></h2>
        </div>
      </div>

      
      <div class="row">
        
        <div style="text-align: center;" class="twelve columns">
              
              <!-- formulário com método POST que no atributo action, o ficheiro de processamento mencionado é o próprio ficheiro (isto é conseguido através do sinal "?", e passa também um valor ao parâmetro "t" (de table) com o nome da tabela que veio como GET) -->
        <form action="?t=<?php echo $_GET['t']; ?>" method="POST">
          
<!-- Bloco de PHP que irá colocar campos de entrada de dados tantas vezes quanto o número de colunas existentes numa tabela que passada via GET-->

       <?php $sql = 'describe ' . $_GET['t'] ; ?>

                   <?php if ($result_set = $connection->query($sql)): ?>
                        <?php foreach ($result_set as $coluna): ?> 

                          <!-- se a coluna que está a ser avaliada com igual aos valores abaixo ignora-os com a keyword "continue". Desta forma, asseguramos que o administrador não irá criar dados nas chaves primárias com o nome "id" e nos campos de data cujo valor terá de ser "NOW()" -->
                              <?php if ($coluna[0] === "id" || 
                                        $coluna[0] === "datetime_acordo" || 
                                        $coluna[0] === "datetime_ultimo_login" || 
                                        $coluna[0] === "datetime_confirmacao" || 
                                        $coluna[0] === "datetime_questao" || 
                                        $coluna[0] === "datetime_registo") 

                                    continue; 
                              ?>
                      
                     <hr>
                   <div class="row">
                       <div class="four columns">
                            <p>Coluna : <span style="color:red;"><?php echo $coluna[0];?></span></p>
                       </div> 
                        <div class="four columns">
                        <p>Tipo de dados: <span style="color:green;"><?php echo $coluna[1]; ?></span></p>
                        </div>



                        <div class="four columns">
                      <!-- Bloco de PHP que irá colocar no atributo title (do paragrafo com valor EXEMPLO) um exemplo de um valor que já está na BD-->
                          <?php 
                              $sql = "SELECT " . $coluna[0] . " FROM " . $_GET['t'] ;

                              $resultado = $connection->query($sql);
                              $row = $resultado->fetch();
                           ?>
                          <p title="<?php echo $row[0]; ?>"><span style="color:blue;">Exemplo</span></p>
                        </div>


                                                              <!-- no name coloca o nome da coluna assim como no id -->
                        <textarea style="resize:none;" name="<?php echo $coluna[0]; ?>" id="<?php echo $coluna[0]; ?>" cols="30" rows="10"></textarea>



                   </div>
                      
                        <?php endforeach ?>
                   <?php endif ?>

                  <div class="twelve columns" style="text-align: center;">
                    <input class=" large button success" type="submit" value="Create">
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

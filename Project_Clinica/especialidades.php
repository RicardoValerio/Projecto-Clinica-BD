<?php require 'MODEL/databaseConnection.php'; ?>


<!-- este bloco de PHP serve para garantir que os conteudos seleccionados a apresentar, vêm necessariamente da BD -->
 <?php 
 // se está definido o valor passado por GET (que corresponde ao valor que é passado quando é clicada uma hiperligação nos menus à esquerda da página), então:
 // 
  if (isset($_GET['p'])) {

      // armazena a query numa variável 
      $sql = "SELECT id FROM especialidades WHERE id=" . $_GET['p'] ;
      
      //executa a query e retorna um valor booleano do seu estado (true -> sucesso, false -> error)
      // se a query foi executada com sucesso e o valor de rows retornado pela query foi superior a zero quer dizer que: 
        if( $connection->query($sql) && $connection->query($sql)->rowCount()){
          
          // existe este id na base de dados, logo, mostra-se essa especialidade
          $page = $_GET['p'];

          // caso contário quer dizer que:
        }else{
          // não existe o id passado por GET na bd, então, mostra a primeira especialidade por segurança
          $page = '1';
        }

    // Caso não está definido,logo, mostra a primeira especialidade";
  }else{
    $page = '1';
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
            <li class="nav_select"><a href="especialidades.php">Especialidades</a></li>
            <li><a href="vantagens.php">Vantagens</a></li>
            <li><a href="acordos.php">Acordos</a></li>
            <li><a href="contactos.php">Contactos</a></li>
            <li style="background-color: #4DBB14; font-weight: bold;"><a href="inscricao.php">Marcação de Consulta Online</a></li>

          </ul>
        </div>
      </div>
      
      <!-- End Header and Nav -->
      

       <div class="row">
        <div class="twelve columns">
          <div class="panel">
            <h2 style="text-align: center;"><span class="">As Especialidades da Pseudo Clínica =)</span></h2>
          </div>
        </div>
      </div>

      
      <div class="row">
        
        <div style="text-align: center;" class="twelve columns">
            <div class="three columns panel">
              <ul class="nav-bar vertical">

<!-- Bloco de PHP correspondente à barra de navegação lateral esquerda, -->

          <?php $sql = 'SELECT id, especialidade FROM especialidades'; ?>

                      <!-- o metodo query() retorna o result_set ou FALSE -->
                    <?php if ($result_set = $connection->query($sql)): ?>
                            <!-- o foreach realiza o metodo fetch() automaticamente por cada linha -->
                               <?php foreach ($result_set as $coluna): ?>

                               <!-- itera por cada linha do result set e coloca o seu fundo azul, caso o valor que está contido na variável $page que foi definida no topo do ficheiro seja igual ao id da especialidade que está a ser colocada -->
                                      <li 
                                       <?php if ($page === $coluna['id']): ?>
                                         class="active" 
                                       <?php endif ?> >
                                        <!-- link de cada especialidade onde está definido um parametro "p" que vai ter o valor do id da devida especialidade -->
                                            <a href="?p=<?php echo $coluna['id'] . '#' . $coluna['id']; ?>"><?php echo $coluna['especialidade']; ?>
                                            </a>
                                        </li>

                               <?php endforeach ?>
                    <?php endif ?>
                           
              </ul>
                 
             </div>
<!-- Bloco de PHP, responsável pela parte central da página onde o principal objectivo, na óptica do utlizador, é disponibilizar o conteúdo referente a cada especialidade -->
        <?php $sql = "SELECT id, 
                             especialidade, 
                             descricao_especialidade, 
                             preco_consulta 
                      FROM especialidades 
                      WHERE id = " . $page ; 
        ?>

                <?php if ($result_set = $connection->query($sql)): ?>
                       <?php foreach ($result_set as $coluna): ?>
                                <!-- Âncora para cada especialidade-->
                             <div id="<?php echo $coluna['id'];?>" class="seven columns panel">
                                <!-- titulo de cada especialidade -->
                                  <h2> <?php echo $coluna['especialidade']; ?> </h2>
                                  <!-- paragrafo descritivo de cada especialidade -->
                                  <p style="text-align:center;"><?php echo nl2br($coluna['descricao_especialidade']); ?></p>
                                   <br>
                                   <!-- preço por consulta de cada especialidade -->
                                  <p style="text-align: left;">Preço por Consulta: <span style="color:green;"><?php echo $coluna['preco_consulta'];?>€</span> </p>
                            </div>
            
                       <?php endforeach ?>
                <?php endif ?>
         
          

            <div class="two columns panel">
              <h6>Especialistas:</h6>
      
<!-- Este bloco de PHP é responsável por colocar na página os médicos especialistas referentes à especialidade que foi requesitada via GET, ou seja, a especialidade cujo ID está armazenada na variável $page definida e avaliada no topo do ficheiro -->
      <?php  $sql = 'SELECT foto, primeiro_nome, ultimo_nome 
                      FROM medicos 
                       WHERE especialidades_id = ' . $page ;
      ?>
                        
              <?php if ($result_set = $connection->query($sql)): ?>
                      <?php foreach ($result_set as $coluna): ?>
                      <!-- coloca a foto do respectivo médico -->
                      <img src="images/especialistas/<?php echo $coluna['foto']; ?> "  alt="especialistas">
                      <!-- coloca o primeiro e último nome do respectivo médico -->
                        <p style="font-size: 9px; margin-left: 7px;">
                          Dr. <?php echo $coluna['primeiro_nome'] . ' ' . $coluna['ultimo_nome'] ; ?> 
                        </p>
                      <hr>
                      <?php endforeach ?>
              <?php endif ?>
                
                
            </div>
      
      
      
      
      

      <!-- Footer -->
      
      <footer class="row">
        <div class="twelve columns">
          <hr />
          <div class="row">
            <div class="six columns">
              <p>Lisboa, 2013 | UE - Bases de Dados</p>
            </div>
            <div class="six columns">
              <ul class="link-list right">
                <li><a href="index.php">Home</a></li>
                <li><a class="seleccionado" href="especialidades.php">Especialidades</a></li>
                <li><a href="vantagens.php">Vantagens</a></li>
                <li><a href="acordos.php">acordos</a></li>
                <li><a href="contactos.php">Contactos</a></li>
                <li><a href="inscricao.php">Marcações Online</a></li>
                <li><a href="PluginGaleria/GaleriaFlag.php">Galeria</a></li>
              </ul>
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

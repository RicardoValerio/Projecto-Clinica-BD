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

<body style="background-color: #508AD1;">
  
   <div class="row">
        <div class="twelve columns">
          <ul class="nav-bar left">
            <li style="background-color: rgb(190, 196, 48);"><a style="font-weight: bold;" href="index.php">Voltar ao Site</a></li>
          </ul>
        </div>

    </div>



<div style="margin-top: 100px;" class="row">
  
  <div class="four columns"></div>
  <div style="border-radius:8px; margin: 22px;" class="four columns panel">


  <!-- action possui o ficheiro PHP que irá processar a autenticação via POST -->
   <!-- os valores contidos dentro dos atributos "name" serão a chaves do array associativo passado em POST -->
    <form action="medico/doctorAuthentication.php" method="post">
                
                <div class="three columns">
                  <label class="inline">Médico:</label>
                </div>
                
                <div class="nine columns ">
                  <input type="text" id="Nome_formulario" placeholder="" name="username"/>
                 </div>

                <div class="three columns">
                  <label class="inline">Pass:</label>
                </div>
                <div class="nine columns">
                  <input class="" type="password" id="Email_formulario" placeholder="" name="password"/>
                 </div>
                 
              <div style="text-align:center;">
                <button type="submit" id="botaoFinaliza" class="radius button success">Enviar</button>
              </div>

              </form>
    
</div>
  <div class="four columns"></div>
  
</div>



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

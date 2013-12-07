  <?php require 'MODEL/databaseConnection.php'; ?>

<!-- Bloco de PHP responsável por processar os valores passados por $_POST, do formulário de marcação de consultas -->

<!-- Neste IF, apenas vai ser processado o seu interior caso a variável global $_POST não esteja vazio -->
<?php if (!empty($_POST)): ?>

<?php 
 
 // verifica se já existe o numero limite de consultas para uma determinada especialidade
 // numa determinada data, em determinada hora e em determinado horario

$sql = "SELECT consultas_marcadas.id,
                consultas_marcadas.datetime_confirmacao,
                consultas_marcadas.data_consulta,                 
                consultas_marcadas.hora_consulta,               
                consultas_marcadas.medicos_id,                 
                consultas_marcadas.utentes_email,
                medicos.especialidades_id,
                medicos.horarios_id          
          FROM consultas_marcadas 
          INNER JOIN medicos              
          ON medicos.id = consultas_marcadas.medicos_id
          AND medicos.especialidades_id = ". $_POST['especialidade'] ."
          AND medicos.horarios_id = ". $_POST['horario'] ."
          AND consultas_marcadas.data_consulta = '". $_POST['data'] ."'
          AND consultas_marcadas.hora_consulta = '". $_POST['horas'] .":". $_POST['minutos'] ."'";


$result_set = $connection->query($sql);



// Sabendo que 2 é o numero máximo de consultórios para cada especialidade, 
// logo é o numero máximo de médicos e de consultas possíveis na mesma hora, no mesmo dia, e no mesmo horário para
  // uma determinada especialidade

// Assim, se o número de consultas marcadas já for igual a 2:
if($result_set->rowCount() == 2){
    
    // Já não pode entrar mais registos de consultas para este dia, a esta hora, para esta especialidade, neste horario.
    // Assim, não é possível registar nas condições submetidas, logo, redireccionar o utilizador para uma página diferente onde o notifique
      header("Location: registo_invalido.php ");
    
}else{

    // Caso contrário ainda pode entrar registo/registos, isto é, quer dizer que a base de dados tem 0 ou 1 registo, de acordo com as condições passadas


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //  1 -  regista o utilizador na tabela utentes caso este ainda não exista, pois caso já exista, a execução da query não irá ser bem sucedida, pois não podem existir duas chaves primárias iguais. Assim, garantidamente a tabela utentes terá utentes distintos mesmo que um determinado utente marque, no futuro, mais do que uma consulta.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


    $sql_inserir_utente = "INSERT INTO utentes 
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
                                             $_POST['telefone'] ."', 
                                             NOW() 
                                        )" ;
          
          // ou executa correctamente : não existia nenhum utente com o email(PK) igual ao passado
          // ou não executa correctamente : existia um utente com o email(PK) igual ao passado
          $connection->exec($sql_inserir_utente);
          

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // 2 - inserir o registo de consulta na base de dados com o respectivo médico disponível encontrado
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


    // query que irá verificar qual o ID de um dos dois médicos que está disponível para a consulta
    $sql_id_medico_disponivel = "SELECT medicos.id 
                                  FROM medicos 
                                  WHERE medicos.id NOT IN 
                                  ( SELECT medicos_id 
                                    FROM medicos, consultas_marcadas 
                                    WHERE medicos.especialidades_id = ". $_POST['especialidade'] ."
                                     AND medicos.horarios_id = ". $_POST['horario'] ."
                                     AND consultas_marcadas.data_consulta='". $_POST['data'] ."'
                                   )
                                  AND medicos.especialidades_id = ". $_POST['especialidade'] ." 
                                  AND medicos.horarios_id = ". $_POST['horario'];

    // executar a query e armazenar num PDO statement
    $result_set = $connection->query($sql_id_medico_disponivel);

    // armazenar o result set numa variavel a partir do método fetch que só retorna uma linha
    $linha_retornada = $result_set->fetch();
   

    // criar a query que irá inserir a marcação de consulta
    $sql_marcacao_consulta = "INSERT INTO consultas_marcadas 
                                  (datetime_confirmacao,
                                   data_consulta,
                                   hora_consulta,
                                   medicos_id,
                                   utentes_email
                                   )
                              VALUES ( NOW(), '". 
                                       $_POST['data'] ."', '" . 
                                       $_POST['horas'].":". $_POST['minutos'] ."', ". 
                                       $linha_retornada['id'] ." , '" . 
                                       $_POST['email'] . 
                                    "')" ;

    // Verificar o número de rows inseridas na execução e com isso avaliar condição
        if($num_rows_inseridas = $connection->exec($sql_marcacao_consulta)){
            //enviar para uma nova página com uma mensagem de sucesso caso tudo corra bem.
            header("Location: registo_valido.php");
        }else{
          // redireccionar para o index apenas por segurança caso as coisas não correrem bem por algum motivo 
            header("Location: index.php");
        }
        
      
}

?>

<?php endif ?>

  
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
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />


  <!-- FONTES GOOGLE
  ================================================== -->
  <link href='http://fonts.googleapis.com/css?family=Strait' rel='stylesheet' type='text/css'>
  

  <!-- Included CSS Files (Compressed) -->
  <!-- <link rel="stylesheet" href="stylesheets/foundation.min.css">-->
  <link rel="stylesheet" href="stylesheets/app.css">

  <script src="javascripts/modernizr.foundation.js"></script>

<style>
  div>*{
      font-family: 'Strait', sans-serif;
      font-size: 17px;

  }
</style>

</head>
<body>


  <!-- Main Page Content and Sidebar -->

  <div class="row">
    <div class="panel">
    <div class="row">
    

<!-- Header and Nav -->
      
      <div class="row">
        <div class="three columns">
          <h1><a href="index.php"><img src="images/banners_logos/logo.png" /></a></h1>
        </div>
        <div class="nine columns" style="text-align: center;">
          <ul class="nav-bar right">
            <li><a href="PluginGaleria/GaleriaFlag.php">Galeria</a></li>           
            <li style="background-color: rgb(190, 196, 48);"><a style="font-weight: bold;" href="admin.php">Admin</a></li>
             <li style="background-color: #508AD1;"><a style="font-weight: bold;" href="medico.php">Médicos</a></li>         
          </ul>
        </div>

        <div class="twelve columns" style="text-align: center;">
          <ul class="nav-bar right">
            <li><a href="index.php">Home</a></li>
            <li><a href="especialidades.php">Especialidades</a></li>
            <li><a href="vantagens.php">Vantagens</a></li>
            <li><a href="acordos.php">Acordos</a></li>
            <li><a href="contactos.php">Contactos</a></li>
            <li style="background-color: #CDD4CA; font-weight: bold;" class="seleccionado"><a style="color:green;" href="inscricao.php">Marcação de Consulta Online</a></li>

          </ul>
        </div>
      </div>





      <!-- Contact Details -->
      <div class="twelve columns">

  
    <h5>Para marcar uma consulta online só precisa de preencher o formulário:</h5>
      <p style="text-align: center;">Por favor, preencha o formulário seguinte com os seus dados pessoais. <br>
Os nossos serviços irão receber o seu pedido de marcação de consulta ao qual irão confirmar a disponibilidade.</p>
      
<dl class="tabs contained three-up">
  <dd class="active"><a href="#" id="1passo">Marque a sua consulta agora mesmo:</a></dd>
</dl>

<br><br>

  <div class="primeiraTab">
  <br>

  <form action="?" method="post">
                    
                    <div style="text-align:center;" class="three columns"><label class="inline">Primeiro Nome:</label></div>
                    <div class="nine columns "><input type="text" id="primeiro_nome_formulario" placeholder="" name="primeiro_nome" maxlength="130"/>
                    <small id="avisoPNome" class="invisivel">Por favor. Introduza um Nome válido...</small>
                    </div>

                    <div style="text-align:center;" class="three columns"><label class="inline">Último Nome:</label></div>
                    <div class="nine columns "><input type="text" id="ultimo_nome_formulario" placeholder="" name="ultimo_nome" maxlength="130"/>
                    <small id="avisoUNome" class="invisivel">Por favor. Introduza um Nome válido...</small>
                    </div>
                    

                        <div style="text-align: center;" class="two columns"><label class="inline">Morada:</label></div>
                        <div class="ten columns ">
                          <input type="text" id="Morada_formulario" placeholder="" name="morada" maxlength="150"/>
                        <small id="avisoMorada" class="invisivel">Por favor. Introduza a sua Morada...</small>
                        </div>



                    <div style="text-align:center;" class="two columns">
                      <label class="inline">Email:</label>
                    </div>
                    <div class="six columns">
                      <input class="" type="text" id="Email_formulario" placeholder="" name="email" maxlength="95"/>
                      <small id="avisoEmail" class="invisivel">Por favor. Introduza um Email válido...</small>
                     </div>


                  

                      <div class="twelve columns">
                        <div style="text-align:center;" class="two columns">
                          <label class="inline">Telefone:</label>
                        </div>
                        <div class="four columns">
                          <input class="" type="text" id="telefone_formulario" placeholder="opcional" name="telefone" maxlength="9"/>
                        </div>
                        <div class="six columns"></div>
                      </div>

                
  <hr>
            
                    
                    <div class="row">
                      <div style="text-align:center;" class="two columns">
                        <label class="inline">Especialidade:</label>
                      </div>
                      <div class="ten columns">
                      
                         <select style="height: 40px;" name="especialidade" id="especialidade">
                            <option style="background-color: orange;" value="" disabled>Especialidade:</option>

<!-- Bloco de PHP responsável por colocar as especialidades dentro das <options> na tag <select> do formulário -->
                    <?php $sql = 'SELECT id, especialidade FROM especialidades'; ?>
                    
                        <?php if ($result_set = $connection->query($sql)): ?>
                              <?php foreach ($result_set as $coluna): ?>

                                <option value="<?php echo $coluna['id']; ?> "><?php echo $coluna['especialidade'] ?></option>
                           
                              <?php endforeach ?>
                        <?php endif ?>
                          
                            </select>
                  </div>
                </div>

<hr>
      <div class="twelve columns center">
            <div style="text-align:center;" class="two columns">
              <label class="inline">Horário:</label>
            </div>
      
<!-- Bloco de PHP que irá colocar os horários contidos na base de dados, dentro do formulário -->
      <?php $sql = 'SELECT id, descricao_horario FROM horarios'; ?>

              <?php if ($result_set = $connection->query($sql)): ?>
                  <?php foreach ($result_set as $coluna): ?>
                
                    <div class="five columns">
                      <label style="text-align: center; height:40px;" for="<?php echo $coluna['descricao_horario']; ?>">
                        <input name="horario" value="<?php echo $coluna['id']; ?>" type="radio" id="<?php echo $coluna['descricao_horario']; ?>"> <?php echo $coluna['descricao_horario']; ?> 
                      </label>
                    </div>
                      
                  <?php endforeach ?>
              <?php endif ?>
      </div>
<hr>
      <div class="twelve columns">
          <div style="text-align:center;" class="two columns">
            <label class="inline">Data: <br> <span style="font-size: 12px;">(mês/dia/ano)</span></label>
          </div>
          <div class="four columns">
            <?php $date = new DateTime(); ?>
            <input style="text-align: center;" name="data" type="text" id="datepicker" value="<?php echo $date->format('m/d/Y');  ?>" size="30" /> 
            <input style="display:none;" type="text" value="0" id="manipuladorData">           
          </div>
          <div style="text-align:center;" class="two columns">
            <label class="inline">Hora:</label>
          </div>
          <div class="four columns">
            
            <div style="text-align: center;" id="horario_manha">
              
              <select style="width:60px;" name="horas" id="hora_select">
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
              </select>
              :
              <select style="width:60px;" name="minutos" id="manha_minutos_select">
                <option value="00">00</option>
                <option value="30">30</option>
              </select>

            </div>

          </div>
          
      </div>

    <br><br><hr><br><br>

<div class="twelve columns" style="text-align: center;">
  <input class=" large button success" type="submit" disabled value="Enviar Inscrição" id="finalizar">
</div>

     </form> 

 <br><br><br><br>

 <div class="row">
   <div class="twelve columns">
 </div>                     
 <div class="alert-box text-center">
<span style="font-weight: bold;">Nota:</span> A disponibilidade da sua marcação será verificada pelos nossos serviços após submissão do formulário<a href="" class="close">&times;</a>
</div>
     
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
                <li><a href="especialidades.php">Especialidades</a></li>
                <li><a href="vantagens.php">Vantagens</a></li>
                <li><a href="acordos.php">acordos</a></li>
                <li><a href="contactos.php">Contactos</a></li>
                <li><a class="seleccionado" href="inscricao.php">Marcações Online</a></li>
                <li><a href="PluginGaleria/GaleriaFlag.php">Galeria</a></li>
              </ul>
            </ul>
          </div>
        </div>
      </div>
    </footer>
    
    <!-- End Footer -->
    
    
    

</div> <!--fim do panel moldura-->
  </div>  <!--fim da row moldura-->



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

  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>


<script>
  
// VERIFICAR PRIMEIRO NOME
var PNome=document.getElementById('primeiro_nome_formulario');
var checar_nome=/^([A-Z,a-z, ,.,ã,á,à,Â,Á,À,â,ê,í,ú,õ,ó,é,ü,-]){2,130}$/;

PNome.onblur=function() {
  if(!checar_nome.test(PNome.value)){
    PNome.className="error";
    document.getElementById('avisoPNome').className="error";
  }else{
    PNome.className="";
    document.getElementById('avisoPNome').className="invisivel";
  }
};


  
// VERIFICAR ULTIMO NOME
UNome=document.getElementById('ultimo_nome_formulario');

UNome.onblur=function() {
  if(!checar_nome.test(UNome.value)){
    UNome.className="error";
    document.getElementById('avisoUNome').className="error";
  }else{
    UNome.className="";
    document.getElementById('avisoUNome').className="invisivel";
  }
};



// VERIFICAR MORADA
var Morada=document.getElementById('Morada_formulario');
var checar_morada=/^([A-Z,a-z,0-9, ,.,ã,á,à,â,Á,À,ê,í,ú,õ,ó,é,ü,º,ª,-]){2,130}$/;

Morada.onblur=function() {
  if(!checar_morada.test(Morada.value)){
    Morada.className="error";
    document.getElementById('avisoMorada').className="error";
  }else{
    Morada.className="";
    document.getElementById('avisoMorada').className="invisivel";
  }
};




//CAMPO DO EMAIL
var Email=document.getElementById('Email_formulario');
var checar_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
var manipuladorParaFinalizar=0;
Email.onblur=function() {
  // if(Email.value == "")
  if(!checar_email.test(Email.value)){
    manipuladorParaFinalizar=0;
    Email.className="error";
    document.getElementById('avisoEmail').className="error";
  }else{
    manipuladorParaFinalizar=1;
    Email.className="";
    document.getElementById('avisoEmail').className="invisivel";
  }
};



var finalizar=document.getElementById('finalizar');
setInterval(
  function() {
    if (PNome.value.length && UNome.value.length && manipuladorParaFinalizar && Morada.value.length && (document.getElementsByName('horario')[0].checked || document.getElementsByName('horario')[1].checked ) && Number(manipuladorData.value)) {
        for (var i = 0; i < finalizar.attributes.length; i++) {
            if (finalizar.attributes[i].name == "disabled" ) {
                finalizar.removeAttribute("disabled");
            }
        }
    }else{
      finalizar.setAttribute("disabled","disabled");
    }
},100);


</script>


<script>

  var myOptions = document.getElementById('hora_select').options;
  setInterval(


      function(){
        if (document.getElementsByName('horario')[0].checked){
          for (var i = 0, j = 8; i < myOptions.length; i++, j++ ) {
              if (j == 8 || j == 9) {
                myOptions[i].value='0'+j;
                myOptions[i].innerHTML='0'+j;
                continue;
              }
              myOptions[i].value=j;
              myOptions[i].innerHTML=j;
          }

        }else if (document.getElementsByName('horario')[1].checked){
          for (var i = 0, j = 14; i < myOptions.length; i++, j++ ) {
              myOptions[i].value=j;
              myOptions[i].innerHTML=j;
          }

        }
      }
    ,200);

</script>

<script>
  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth()+1;
  var yyyy = today.getFullYear();
  
var anoCaixa =  document.getElementById('datepicker').value[6] + 
                document.getElementById('datepicker').value[7] + 
                document.getElementById('datepicker').value[8] +
                document.getElementById('datepicker').value[9];


setInterval(

function() {

diaCaixa = document.getElementById('datepicker').value[3] +
          document.getElementById('datepicker').value[4];

mesCaixa =  document.getElementById('datepicker').value[0] +
             document.getElementById('datepicker').value[1];

anoCaixa =  document.getElementById('datepicker').value[6] + 
                document.getElementById('datepicker').value[7] + 
                document.getElementById('datepicker').value[8] +
                document.getElementById('datepicker').value[9];

      if (anoCaixa < yyyy || ( mesCaixa < mm && anoCaixa == yyyy) || ( diaCaixa <= dd && mesCaixa == mm) ){
         // console.log("NÃO PODE SER SEU VAGABUNDO!!!");
        document.getElementById('manipuladorData').value=0;
      }else{
        // console.log("ASSIM TUDO BEM SEU VAGABUNDO!!!");
        document.getElementById('manipuladorData').value=1;
      }



},200);

  </script>

</body>
</html>

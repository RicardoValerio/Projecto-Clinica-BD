<?php require 'verificaSessions.php'; ?>

<?php 

require '../MODEL/databaseConnection.php';

// echo "<pre>";
// print_r($_POST);
// echo "</pre>";
// die();

		switch ($_POST['tabela']) {
/////////////////////////////////////////////////////////////////////////////////////////////////////////
				  case 'acordos':

						        $sql = "UPDATE acordos 
						        			SET id=" . $_POST['id'] . ", 
						        			    datetime_acordo='" . $_POST['datetime_acordo'] . "' , 
						        			    instituicao='" . $_POST['instituicao'] . "' , 
						        			    foto_instituicao='" . $_POST['foto_instituicao'] . "' 
						        			WHERE id=" . $_POST['chave_primaria'];
						        
						        // caso a execução da query seja bem sucedida, então:
						        if($update_count = $connection->exec($sql)){
						        	// redirecciona o administrador para o index da pasta admin
						            header("Location: index.php");
						        }else{
						        	// caso não seja bem sucedida redirecciona para uma página de notificação de erro
						            header("Location: erro.php");
						        }
						      
				      break;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
				  case 'administradores':

						      $sql = "UPDATE administradores 
						      			  SET id=" . $_POST['id'] . ", 
						      			      username='" . $_POST['username']. "', 
						      			      password='" . $_POST['password'] ."', 
						      			      datetime_ultimo_login='". $_POST['datetime_ultimo_login'] ."' 
						      			  WHERE id=" . $_POST['chave_primaria'] ;
						        
						        // caso a execução da query seja bem sucedida, então:
						        if($update_count = $connection->exec($sql)){
						        	// redirecciona o administrador para o index da pasta admin
						            header("Location: index.php");
						        }else{
						        	// caso não seja bem sucedida redirecciona para uma página de notificação de erro
						            header("Location: erro.php");
						        }
				        
				      break;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
				  case 'consultas_com_marcacao_confirmada_a_realizar':

						      $sql = "UPDATE consultas_com_marcacao_confirmada_a_realizar 
						      			SET id=". $_POST['id'] .", 
						      				datetime_confirmacao='". $_POST['datetime_confirmacao'] ."', 
						      				data_consulta='". $_POST['data_consulta'] ."', 
						      				hora_consulta='". $_POST['hora_consulta'] ."', 
						      				medicos_id=". $_POST['medicos_id'] .", 
						      				utentes_email='". $_POST['utentes_email'] ."',
						      				especialidades_id=". $_POST['especialidades_id'] .", 
						      				horarios_id=". $_POST['horarios_id'] ."
						      			WHERE id=". $_POST['chave_primaria'];
						        
						        // caso a execução da query seja bem sucedida, então:
						        if($update_count = $connection->exec($sql)){
						        	// redirecciona o administrador para o index da pasta admin
						            header("Location: index.php");
						        }else{
						        	// caso não seja bem sucedida redirecciona para uma página de notificação de erro
						            header("Location: erro.php");
						        }
				        
				      break;
/////////////////////////////////////////////////////////////////////////////////////////////////////////				     
				  case 'consultas_realizadas':
						      
						      $sql = "UPDATE consultas_realizadas 
						      			  SET id=" . $_POST['id'] . ", 
						      			  	  datetime_consulta_realizada='". $_POST['datetime_consulta_realizada'] ."', 
						      			  	  valor_consulta=" . $_POST['valor_consulta'] . ", 
						      			  	  diagnostico='" . $_POST['diagnostico'] ."', 
						      			  	  prescricao='". $_POST['prescricao'] ."', 
						      			  	  medicos_id=". $_POST['medicos_id'] .", 
						      			  	  utentes_email='". $_POST['utentes_email'] ."' 
						      			 WHERE id=" . $_POST['chave_primaria'] ;
						        

								// caso a execução da query seja bem sucedida, então:
						        if($update_count = $connection->exec($sql)){
						        	// redirecciona o administrador para o index da pasta admin
						            header("Location: index.php");
						        }else{
						        	// caso não seja bem sucedida redirecciona para uma página de notificação de erro
						            header("Location: erro.php");
						        }
				        
				      break;
/////////////////////////////////////////////////////////////////////////////////////////////////////////      
				  case 'especialidades':
						      
						      $sql = "UPDATE especialidades 
						      			  SET id=" . $_POST['id'] . ", 
						      			      especialidade='" . $_POST['especialidade'] . "', 
						      			      descricao_especialidade='". $_POST['descricao_especialidade'] . "', 
						      			      preco_consulta=". $_POST['preco_consulta'] . " 
						      			WHERE id=" . $_POST['chave_primaria'];
						        
						        // caso a execução da query seja bem sucedida, então:
						        if($update_count = $connection->exec($sql)){
						        	// redirecciona o administrador para o index da pasta admin
						            header("Location: index.php");
						        }else{
						        	// caso não seja bem sucedida redirecciona para uma página de notificação de erro
						            header("Location: erro.php");
						        }
				        
				      break;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
				  case 'horarios':
						      
						      $sql = "UPDATE horarios 
						      			  SET id=" . $_POST['id'] . ", 
						      			      descricao_horario='" . $_POST['descricao_horario'] ."' 
						      			 WHERE id=". $_POST['chave_primaria'] ;
						        
						        // caso a execução da query seja bem sucedida, então:
						        if($update_count = $connection->exec($sql)){
						        	// redirecciona o administrador para o index da pasta admin
						            header("Location: index.php");
						        }else{
						        	// caso não seja bem sucedida redirecciona para uma página de notificação de erro
						            header("Location: erro.php");
						        }
				        
				      break;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
				  case 'medicos':

						      $sql = "UPDATE medicos 
						      			SET id=" . $_POST['id'] . ", 
						      				primeiro_nome='". $_POST['primeiro_nome'] ."', 
						      				ultimo_nome='". $_POST['ultimo_nome'] ."', 
						      				email='" . $_POST['email'] . "', 
						      				contacto_tel='". $_POST['contacto_tel'] ."', 
						      				foto='" . $_POST['foto'] ."', 
						      				especialidades_id=". $_POST['especialidades_id'] .", 
						      				horarios_id=". $_POST['horarios_id'] . " 
						      			WHERE id=". $_POST['chave_primaria'] ;
						        
						        // caso a execução da query seja bem sucedida, então:
						        if($update_count = $connection->exec($sql)){
						        	// redirecciona o administrador para o index da pasta admin
						            header("Location: index.php");
						        }else{
						        	// caso não seja bem sucedida redirecciona para uma página de notificação de erro
						            header("Location: erro.php");
						        }
						        
				      break;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
				  case 'medicos_administracao_de_consultas':

						      $sql = "UPDATE medicos_administracao_de_consultas 
						      			  SET id=" . $_POST['id'] . ", 
						      			  	  username='". $_POST['username'] ."', 
						      			  	  password='". $_POST['password'] ."', 
						      			  	  datetime_ultimo_login='". $_POST['datetime_ultimo_login'] . "', 
						      			  	  medicos_id=" . $_POST['medicos_id'] ." 
						      			WHERE id=". $_POST['chave_primaria'] ;
						        
						        // caso a execução da query seja bem sucedida, então:
						        if($update_count = $connection->exec($sql)){
						        	// redirecciona o administrador para o index da pasta admin
						            header("Location: index.php");
						        }else{
						        	// caso não seja bem sucedida redirecciona para uma página de notificação de erro
						            header("Location: erro.php");
						        }
				        
				      break;
////////////////////////////////////////////////////////////////////////////////////////////////////////			      
				  case 'questoes_online':

						      $sql = "UPDATE questoes_online 
						      			  SET id=" . $_POST['id'] .", 
						      			  	  nome='". $_POST['nome'] ."' , 
						      			  	  email='". $_POST['email'] . "', 
						      			  	  mensagem='". $_POST['mensagem'] ."', 
						      			  	  datetime_questao='". $_POST['datetime_questao'] ."' 
						      			WHERE id=". $_POST['chave_primaria'] ;
						        
						        // caso a execução da query seja bem sucedida, então:
						        if($update_count = $connection->exec($sql)){
						        	// redirecciona o administrador para o index da pasta admin
						            header("Location: index.php");
						        }else{
						        	// caso não seja bem sucedida redirecciona para uma página de notificação de erro
						            header("Location: erro.php");
						        }
						        
				      break;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
				  case 'utentes':

				      $sql = "UPDATE utentes 
				      			 SET email='". $_POST['email'] ."', 
				      			 	 primeiro_nome='". $_POST['primeiro_nome'] ."', 
				      			 	 ultimo_nome='". $_POST['ultimo_nome'] ."', 
				      			 	 morada='". $_POST['morada'] ."', 
				      			 	 contacto_tel='". $_POST['contacto_tel'] ."', 
				      			 	 datetime_registo='". $_POST['datetime_registo'] ."' 
				      		    WHERE email='". $_POST['chave_primaria'] ."'";
				        
				        // caso a execução da query seja bem sucedida, então:
				        if($update_count = $connection->exec($sql)){
				        	// redirecciona o administrador para o index da pasta admin
				            header("Location: index.php");
				        }else{
				        	// caso não seja bem sucedida redirecciona para uma página de notificação de erro
				            header("Location: erro.php");
				        }
				        
				      break;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
				  case 'vantagens':

				      $sql = "UPDATE vantagens 
				      			 SET id=". $_POST['id'] .", 
				      				 titulo='". $_POST['titulo'] ."', 
				      			 	 conteudo_vantagem='". $_POST['conteudo_vantagem'] ."' 
				      			WHERE id=". $_POST['chave_primaria'] ;
				        
				        // caso a execução da query seja bem sucedida, então:
				        if($update_count = $connection->exec($sql)){
				        	// redirecciona o administrador para o index da pasta admin
				            header("Location: index.php");
				        }else{
				        	// caso não seja bem sucedida redirecciona para uma página de notificação de erro
				            header("Location: erro.php");
				        }
				        
				      break;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
				  default:
				    	header("Location: index.php");
				    break;
			}





 ?>
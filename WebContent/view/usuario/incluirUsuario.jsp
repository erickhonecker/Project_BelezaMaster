<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="br.com.ifpe.belezamaster.model.usuario.Usuario"%>
<%@ page import="br.com.ifpe.belezamaster.model.login.Perfil"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<href
	='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800
	'rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link href="view/css/style.css" rel="stylesheet" type="text/css" />
<title>Beleza Master - Especialista em Designer de Cortes
	Femininos e Masculinos</title>

<!-- Bootstrap Core CSS --> <!-- Custom Fonts -->
<link href="view/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="view/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<link href="view/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="view/css/creative.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
   <%
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		boolean NivelDePerfil = false;
		if (usuario != null) {
			Perfil perfil = usuario.getPerfil();
			if (perfil != null) {
				if (perfil.getCodigo() == 1) {
					NivelDePerfil = true;
				}
			}
		}
	%>
   

</head>
<body class="bg-dark-2">

	<c:import url="../menu/menu.jsp"></c:import>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<center>
		<div class="container">
			<div class="msg"><span class="alert-success">${mensagem}</span>
			</div>
		</div>
	</center>


	<div id="loginbox" style="margin-top: 50px;"
		class=" col-md-6 col-md-offset-3 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">Cadastre-se</div>
				<div
					style="float: right; font-size: 80%; position: relative; top: -10px">
					<a href="#">Forgot password?</a>
				</div>
			</div>
			
			<span style="color: red;">${nome}</span>

			<div style="padding-top: 30px" class="panel-body">
			


				<form id="loginform" class="form-horizontal" action="incluirUsuario" method="post" role="form">


<label class="span">Nome: <br /></label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span>
							
							
							 <input id="nome" type="text" class="form-control" name="nome"
							placeholder="Digite seu nome" onkeypress="mascara(this,soLetras)"
							value="${usuario.nome}" maxlength="50" required="required" >
						<form:errors path="usuario.nome" cssStyle="color:red" />
					</div>
					<label class="span">Cpf: <br /></label>
				&nbsp;<span class="error">${cpf}</span> 


                     
					<div style="margin-bottom: 25px" class="input-group">
                        
                         
						<span class="input-group-addon">
						
						<i class="fa fa-cc"
		
							aria-hidden="true"></i></span> <input id="cpf" type="text"
							class="form-control" name="cpf" value="${usuario.cpf}" placeholder="Digite seu CPF"
							onblur="javascript: validarCPF(this.value);" maxlength="14"
							equired="required">
					</div>
                    
                    <label class="span">Email: <br /></label>
				&nbsp;<span class="error">${email}</span> 
				
                 <div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-envelope"></i></span> <input id="email"
							type="email" class="form-control" name="email"
							value="${usuario.email}" placeholder="Digite seu E-mail"
							required="required" maxlength="50" />
						<form:errors path="usuario.email"
							cssStyle="color:red; font-size:10px;" />
					</div>
					
					<label class="span">Senha: <br /></label>
					<span  class="error">${senha}</span> 
						
					
					
						<span class="error">${confsenha}</span>
						
					<div style="margin-bottom: 25px" class="input-group">
					
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span>
							
							
							 <input id="senha"
							type="password" class="form-control" name="senha"
							placeholder="Digite sua senha" required="required" maxlength="20"><br>

					</div>
					
					
					<label class="span">Confirme a senha: <br /></label><span  class="error">${confsenha}</span>
					<span  class="error">${senha}</span> 
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span> <input id="confSenha"
							type="password" class="form-control" name="confSenha"
							placeholder="Confirme senha" required="required" maxlength="20"><br>


					</div>
					
					<label class="span">Telefone: <br /></label>
<br>                 
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="fa fa-phone-square" aria-hidden="true"></i></span> 
							
							
						<input
							id="telefone" type="tel" class="form-control" name="telefone"
							placeholder="Digite seu telefone" required="required"
							maxlength="13" value="${usuario.telefone}">
						<form:errors path="usuario.telefone"
							cssStyle="color:red; font-size:10px;" />
					</div>
            <label class="span">Celular: <br /></label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="fa fa-mobile fa-2x" aria-hidden="true"></i></span> <input
							style="height: 42px;" id="celular" type="tel"
							class="form-control" name="celular"
							placeholder="Digite seu celular" required="required"
							maxlength="14" value="${usuario.celular}">
						<form:errors path="usuario.celular"
							cssStyle="color:red; font-size:10px;" />
		
					</div>
					
					
					<br>
<%
if (NivelDePerfil != false) {
	%><label class="span">Escolha uma opção: <br /></label>
						<br>
	
					<input name="perfil.codigo" type="radio" value="1" required="required"/><label>Administrador</label>
					<input name="perfil.codigo" type="radio" value="2" required="required"/><label>Profissional</label>
					<input name="perfil.codigo" type="radio" value="3" required="required"/> <label>Usuario</label>
       <%
		}
		%>
				<input name="perfil.codigo" type="hidden" value="3" required="required"/>
					
					<div style="margin-top: 10px" class="form-group">
						<!-- Button -->

						<br /> &nbsp; <input type="submit" class="btn btn-primary"
							value="Cadastrar" name="btn-cadastrar" /> &nbsp;&nbsp; <input
							type="reset" class="btn btn-danger" value="Limpar"
							name="btn-limpar" /> <br />
					</div>


					<div class="form-group">
						<div class="col-md-12 control">
							<div
								style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
								Já é cadastrado? <a href="exibirIndex"
									onClick="$('#loginbox').hide(); $('#signupbox').show()">
									Faça seu login </a>
							</div>
						</div>
					</div>
				</form>



			</div>
		</div>



	</div>
	


	<!-- jQuery -->
	<script src="view/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="view/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="view/vendor/easing/easing.min.js"></script>
	<script src="view/vendor/scrollreveal/scrollreveal.min.js"></script>
	<script src="view/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="view/js/validaCPF.js"></script>
	<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="view/js/jquery-1.2.6.pack.js"></script>
	<script type="text/javascript"
		src="view/js/jquery.maskedinput-1.1.4.pack.js" /></script>

	<!-- Theme JavaScript -->
	<script src="view/js/creative.min.js"></script>

 	<script type="text/javascript"> 
 		jQuery.noConflict();
 		jQuery(function($) {
 			$("#telefone").mask("(99)9999-9999");
 			$("#cpf").mask("999.999.999-99");
 			$("#celular").mask("(99)99999-9999");
 		});
 	</script> 
</body>
</html>

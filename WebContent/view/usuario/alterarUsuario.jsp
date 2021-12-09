<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

<head>

	<href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800'
	rel='stylesheet' type='text/css'>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link href="view/css/style.css" rel="stylesheet" type="text/css" /> 
    <title>Beleza Master - Especialista em Designer de Cortes Femininos e Masculinos</title>

    <!-- Bootstrap Core CSS -->
  

    <!-- Custom Fonts -->
    <link href="view/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="view/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

	    <link href="view/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	
    <!-- Theme CSS -->
    <link href="view/css/creative.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<script type="text/javascript" src="view/js/validaCPF.js"></script>
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript"
	src="view/js/jquery.maskedinput-1.1.4.pack.js" /></script>
</head>
<body class="bg-dark-2">

		<c:import url="../menu/menu.jsp"></c:import>

 <br>
         <br>
         <br>
         <br>
         <br>
	<center>
		<div class="container">
			<div class="msg">${mensagem}
			</div>
		</div>
	</center>
	<div id="loginbox" style="margin-top: 50px;"
		class=" col-md-6 col-md-offset-3 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">Alterar Usuário</div>
				
				<div
					style="float: right; font-size: 80%; position: relative; top: -20px">
					


				</div>
				
						
				
				
				
				
			</div>
			<span style="color: red;">${nome}</span>

			<div style="padding-top: 30px" class="panel-body">

				<div style="display: none" id="login-alert"
					class="alert alert-danger col-sm-12"></div>
		
        
		<form action="alterarUsuario"  method="post">


			<input type="hidden" name="id">

			<div class="form-group">
				<label class="span" for="inputNome">Nome</label><br /> <input
					type="text" class="form-control author" name="nome"
					required="required" maxlength="50"value="${usuario.nome}" onkeypress="mascara(this,soLetras)">
			</div>
			<br />
			<div class="form-group">
				<label class="span" for="inputEmail">E-mail</label><br /> <input
					type="email" id="inputEmail" class="form-control author"
					name="email"  required="required"
					value="${usuario.email}" maxlength="50" />
			</div>
			<br />
			<div class="form-group">
				<label class="span" for="inputLogin">Telefone</label><br /> <input
					type="text" class="form-control author" id="telefone"
					name="telefone" required="required"
					value="${usuario.telefone}" maxlength="13">
			</div>
			<br />
			<div class="form-group">
				<label class="span" for="inputSenha">Celular</label><br /> <input
					type="text" class="form-control author" id="celular" name="celular"
					 required="required"
					value="${usuario.celular}" maxlength="14">
			</div>

			<div class="form-group">
				<label class="span" for="inputSenha"></label><br /> <input
					type="hidden" class="form-control author" id="cpf" name="cpf"
					 value="${usuario.cpf}">
			</div>
			<br /> <a href="exibirListarUsuario"
				class="btn btn-danger submit link-password-02">Cancelar</a> &nbsp;
			
			&nbsp;
			<button type="submit"  href="exibirListarUsuario" class="btn btn-warning submit">&nbsp;
				Alterar &nbsp;</button>

		</form>
	
	</div>
<!-- 	<div class="footer-bottom"> -->
<!-- 		<div class="container"> -->
<!-- 			<ul class="footer-nav"> -->
<!-- 				<li><a href="exibirAlterarUsuario">Alterar Usuário</a></li>| -->
<!-- 				<li><a href="exibirIncluirServico">Cadastrar Serviço</a></li>| -->
<!-- 				<li><a href="exibirIncluirUsuario">Cadastrar Usuário</a></li>| -->
<!-- 				<li><a href="exibirListaProfissional">Pesquisar -->
<!-- 						Profissional</a></li>| -->
<!-- 				<li><a href="exibirIncluirProfissional">Cadastrar -->
<!-- 						Profissional</a></li>| -->
<!-- 				<li><a href="exibirLogin">Home</a></li> -->
<!-- 			</ul> -->
<!-- 			<div class="copy"> -->
<!-- 				<p> -->
<!-- 					© 2014 Template by <a href="#" target="_blank" -->
<!-- 						class="link-password-02">ALM e Suplementos</a> -->
<!-- 				</p> -->
<!-- 			</div> -->
			<div class="clear"></div>

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
			$("#celular").mask("(99)99999-9999");
			$("#cpf").mask("999.999.999-99");

		});
	</script>



</body>
</html>
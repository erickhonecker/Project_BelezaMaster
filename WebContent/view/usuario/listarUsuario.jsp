<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

<head>

<href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800' rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link href="view/css/style.css" rel="stylesheet" type="text/css" />
<title>Beleza Master - Especialista em Designer de Cortes
	Femininos e Masculinos</title>

<!-- Bootstrap Core CSS -->


<!-- Custom Fonts -->
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
    <script type="text/javascript"src="view/js/jquery-2.1.4.js"></script>
    
 <script type="text/javascript">
		$(document).ready(function() {
			$("#nome").keyup(function() {
				var texto = $('#nome').val();
				$.post("pesquisarUsuario", {'nome' : texto}, function(dados) {
					$('#tabelaListaUsuario').html(dados);
				});
			});

		});
	    </script>
</head>
<body class="bg-dark-2">

	<c:import url="../menu/menu.jsp"></c:import>

<div class="container">

	<br>
	<br>
	<br>
	<br>
	<br>


		<center>
			<div class="container">
				<div class="msg">${mensagem}</div>
			</div>
		</center>
		<div id="loginbox" style="margin-top: 50px;"
		class=" col-md-6 col-md-offset-3 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">Listar Usuário</div>
				<div
					style="float: right; font-size: 80%; position: relative; top: -10px">
				</div>
			</div>

			<div style="padding-top: 30px" class="panel-body">

				<div style="display: none" id="login-alert"
					class="alert alert-danger col-sm-12"></div>

			
					<br /> <label class="span">E-mail:</label><br /> <input
						class="form-control" type="text" name="nome" id="nome" /> <br /> <br /> 
			</div>
		</div>

	</div>
	<p>
	<div class="table table-responsive " >
	
	<table id="tabelaListaUsuario" class="table table-hover table-bordered">
	<thead>
		<tr>
			<th>Nome Usuário</th>
			<th>E-mail</th>
			<th>Telefone</th>
			<th>Celular</th>
			<th>Alterar</th>
			<th>Remover</th>



		</tr>
</thead>
<tbody >
		<c:forEach var="usuario" items="${listarUsuario}">
			<tr>
				<td > ${usuario.nome}</td>
				<td > ${usuario.email}</td>
				<td > ${usuario.telefone}</td>
				<td > ${usuario.celular}</td>
		
		        <td><a class="btn btn-success" href="exibirAlterarUsuario?cpf=${usuario.cpf}"> Alterar</a></td>
				<td><a class="btn btn-danger" href="removerUsuario?cpf=${usuario.cpf}"> Remover</a></td>
		


			</tr>
		</c:forEach>
	</tbody>
	</table>
	</div>
</div>
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


</body>
</html>
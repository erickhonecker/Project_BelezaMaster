<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

<head>
<href
	='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800
	' rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link href="view/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script> <script
	type="text/javascript" src="view/js/jquery-1.2.6.pack.js"></script> <script
	type="text/javascript" src="view/js/jquery.maskedinput-1.1.4.pack.js" /></script>



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
    <![endif]--> <script type="text/javascript"
	src="view/js/jquery-2.1.4.js"></script> <script type="text/javascript">
		$(document).ready(function() {
			$("#codigoAtendimento").keyup(function() {
				var texto = $('#codigoAtendimento').val();
				$.post("pesquisarFinalizarAtendimento", {
					'codigoAtendimento' : texto
				}, function(dados) {
					$('#tabelaListaFinalizarAtendimento').html(dados);
				});
			});

		});
	</script>

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
				<div class="msg">${finalizar}${cancelar}
			</div>
		</div>
	</center>
	<div id="loginbox" style="margin-top: 50px;"
		class=" col-md-6 col-md-offset-3 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">Finalizar Atendimento</div>
				<div
					style="float: right; font-size: 80%; position: relative; top: -10px">
				</div>
			</div>

			<div style="padding-top: 30px" class="panel-body">

				<div style="display: none" id="login-alert"
					class="alert alert-danger col-sm-12"></div>

				<br /> <label class="span">Código Atendimento</label><br /> <input
					class="form-control" type="text" name="codigoAtendimento"
					onkeypress="mascara(this,soNumeros)" id="codigoAtendimento" /> <br /> <br />

			</div>
		</div>

	</div>

	<div class="table table-responsive ">

		<table id="tabelaListaFinalizarAtendimento"
			class="table table-hover table-bordered">
			<tr>
				<th>Nome do Usuário</th>
				<th>Cpf do Usuário</th>
				<th>Código do Servico</th>
				<th>Serviço</th>
				<th>Nome do Profissional</th>
				<th>Código do Atendimento</th>
				<th>Horário de Atendimento</th>
				<th>Situação</th>				
			    <th>Data do Atendimento</th>	
				<th>Alterar</th>
				<th>Remover</th>


			</tr>

			<c:forEach var="atendimento" items="${registrarAtendimento}">
				<tr>

					<td>${atendimento.usuario.nome}</td>
					<td>${atendimento.usuario.cpf}</td>
					<td>${atendimento.servico.codigo}</td>
					<td>${atendimento.servico.nome}</td>
					<td>${atendimento.profissional.nome}</td>
					<td>${atendimento.codigoAtendimento}</td>
					<td><fmt:formatDate value="${atendimento.horario}"
							pattern="MM/dd/yyyy" /></td>
					<td>${atendimento.situacao}</td>
					<td><fmt:formatDate value="${atendimento.dataAtendimento}"
							pattern="MM/dd/yyyy" /></td>

					<td><a  class="btn btn-success"
						href="finalizarAtendimento?codigoAtendimento=${atendimento.codigoAtendimento}">Finalizar</a></td>
					<td><a class="btn btn-danger"
						href="removerCancelar?codigoAtendimento=${atendimento.codigoAtendimento}">Cancelar</a></td>

				</tr>

			</c:forEach>
		</table>
	</div>
	<br />
	<br />
	<br />
	<br />


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
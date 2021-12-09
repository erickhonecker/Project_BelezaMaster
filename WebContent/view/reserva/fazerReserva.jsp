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
	' rel='stylesheet' type='text/css'/>
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
    <![endif]-->

</head>
<body class="bg-dark-2">

	<c:import url="../menu/menu.jsp"></c:import>


	<br><br><br><br><br>
	
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
				<div class="panel-title">Fazer Reserva</div>
				<div
					style="float: right; font-size: 80%; position: relative; top: -10px">
				</div>
			</div>

			<div style="padding-top: 30px" class="panel-body">

				<div style="display: none" id="login-alert"
					class="alert alert-danger col-sm-12"></div>

				<form action="fazerReserva" method="post">
			 <label class="span">Data de Atendimento <br /></label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> 
							
							<input id="nome" onblur="validaDat(this,this.value)" type="text" class="form-control" name="dataAtendimento"
							placeholder="Digite Data de Atendimento"
							required="required" value="<fmt:formatDate value="${atendimento.dataAtendimento}" pattern="MM/dd/yyyy" />">
					</div>			
					<p>
									 <label class="span">Profissional: <br /></label>
<br> <select class="form-control input-lg" required="required" name="profissional.id">
							<option value="">Selecione</option>
							<c:forEach items="${listaProfissional}" var="obj">
								<option value="${obj.id}"
									<c:if test="${obj.id eq p.profissional.id}">selected="selected"</c:if>>
									${obj.nome}</option>
							</c:forEach>
						</select>
					</p>


					<p>
						<label class="span">Serviço: <br /></label><br> <select class="form-control input-lg" required="required"name="servico.codigo">
							<option value="">Selecione</option>
							<c:forEach items="${listaServico}" var="obj">
								<option value="${obj.codigo}"
									<c:if test="${obj.codigo eq p.servico.codigo}">selected="selected"</c:if>>
									${obj.nome}</option>
							</c:forEach>
						</select>
					</p>



					<p>
						<label class="span">Usuário: <br /></label><br> <select class="form-control input-lg" required="required" name="usuario.cpf">
							<option value="">Selecione</option>
							<c:forEach items="${listaUsuario}" var="obj">
								<option value="${obj.cpf}"
									<c:if test="${obj.cpf eq p.usuario.cpf}">selected="selected"</c:if>>
									${obj.nome}</option>
							</c:forEach>
						</select>
					</p>

					
					<button type="submit" class="btn btn-success submit">&nbsp;
				Reservar &nbsp;</button>
				
					<button type="reset" class="btn btn-danger submit">&nbsp;
				Cancelar &nbsp;</button>
			&nbsp;
			



				</form>
			</div>
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
	<script type="text/javascript" src="view/js/jquery.maskedinput-1.1.4.pack.js" /></script>

	<!-- Theme JavaScript -->
	<script src="view/js/creative.min.js"></script>
 <script type="text/javascript"> 
		jQuery.noConflict();
	jQuery(function($) {
		 $("#nome").mask("99/99/9999   99:99");
		 });
 	</script>

</body>
</html>
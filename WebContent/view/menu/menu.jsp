<%@ page import="br.com.ifpe.belezamaster.model.usuario.Usuario"%>
<%@ page import="br.com.ifpe.belezamaster.model.login.Perfil"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

</head>
<body>
	<%
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		boolean NivelDePerfil = false;
		if (usuario != null) {
			Perfil perfil = usuario.getPerfil();
			if (perfil != null) {
				if (perfil.getCodigo() ==  1 || perfil.getCodigo() == 2) {
					NivelDePerfil = true;
				}else{
					
				}
			}
		}
	%>
	<%
		boolean verProfissional = false;
		if (usuario != null)  {
			Perfil perfil = usuario.getPerfil();
			if (perfil != null) {
				if (perfil.getCodigo() == 2 || perfil.getCodigo() == 3) {
					verProfissional = true;
				}
			}
		}
	%>
	<%
		boolean exibirMenu = false;
		if (usuario != null)  {
			Perfil perfil = usuario.getPerfil();
			if (perfil != null) {
				if (perfil.getCodigo() == 1 || perfil.getCodigo() == 2) {
					exibirMenu = true;
				}
			}
		}
	%>
	<%
		boolean exibirPerfil = false;
		if (usuario != null)  {
			Perfil perfil = usuario.getPerfil();
			if (perfil != null) {
				if (perfil.getCodigo() == 1 || perfil.getCodigo() == 2 || perfil.getCodigo() == 3) {
					exibirPerfil = true;
				}
			}
		}
	%>


	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top">Beleza
					Master</a>
			</div>


			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="exibirIndex">Home</a></li>
					<%
						if (exibirMenu != false) {
					%>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Produto<span class="caret"></span></a>
						<ul id="dropdown-dp" class="dropdown-menu">
							<li><a href="exibirIncluirProduto">Cadastrar Produto</a> <a
								href="exibirListarProduto">Listar Produto</a></li>
						</ul></li>
					<%
						}
					%>
					<%
						if (exibirMenu != false) {
					%>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Serviço<span class="caret"></span></a>
						<ul id="dropdown-dp" class="dropdown-menu">
							<li><a href="exibirIncluirServico">Cadastrar Serviço</a> <a
								href="exibirListarServico">Listar Serviço</a></li>
						</ul></li>
					<%
						}
					%>
					<%
						if (exibirMenu != false) {
					%>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Usuário<span class="caret"></span></a>
						<ul id="dropdown-dp" class="dropdown-menu">
							<li><a href="exibirIncluirUsuario">Cadastrar Usuário</a> <a
								href="exibirListarUsuario">Listar Usuário</a></li>
						</ul></li>
					<%
						}
					%>

					<%
						if (verProfissional != true && exibirMenu != false) {
					%>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Profissional<span class="caret"></span></a>
						<ul id="dropdown-dp" class="dropdown-menu">
							<li><a href="exibirIncluirProfissional">Cadastrar
									Profissional</a> <a href="exibirListarProfissional">Listar
									Profissional</a></li>
						</ul></li>
					<%
						}
					%>
					<%
						if (exibirMenu != false) {
					%>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Reserva<span class="caret"></span></a>
						<ul id="dropdown-dp" class="dropdown-menu">
							<li><a href="exibirIncluirAtendimento">Fazer Reserva</a> <a
								href="exibirListarAtendimento">Registrar Atendimento</a> <a
								href="exibirFinalizarAtendimento">Finalizar Atendimento</a> <a
								href="ExibirRelatorio">Relatório de Atendimento</a></li>


						</ul></li>
					<%
						}
					%>


                  <% if (exibirPerfil != false ) {
					%>
					

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><b> <i class="fa fa-user"
								aria-hidden="true">&nbsp;</i> Bem vindo,
								${usuarioLogado.nome}&nbsp;&nbsp;
						</b> <span class="caret"></span></a>
						<ul id="id" class="dropdown-menu">
							<li>
								<div class="row">
									<div class="col-md-12">

										<a class="nav-tabs-dropdown btn-01"
											href="exibirAlterarDadosUsuario"><strong>Alterar
												Dados</strong></a>

										<div class="espaco-negro"></div>
										<%
											if (NivelDePerfil != true) {
										%>
										<a class="nav-tabs-dropdown btn-01"
											href="exibirIncluirAtendimento"><strong>Fazer
												Reserva</strong></a>
										<%
											}
										%>
										<br> <br>


									</div>


									<div class="bottom">

										<a href="logout" class="btn-new"><strong>Sair</strong></a>
									</div>
									<Br>
								</div>
							</li>
							<%
						}
					%>
						</ul></li>
			

				</ul>
			</div>
		</div>
	</nav>

</body>
</html>

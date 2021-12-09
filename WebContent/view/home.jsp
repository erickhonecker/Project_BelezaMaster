<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

<head>
<href
	='http://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,800
	'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link href="view/css/style.css" rel="stylesheet" type="text/css" />
<title>Beleza Master - Especialista em Designer de Cortes
	Femininos e Masculinos</title>

<!-- Bootstrap Core CSS -->
<link href="view/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

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
</head>

<body id="page-top">

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

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a class="page-scroll" href="exibirIndex">Home</a></li>
				<li><a class="page-scroll" href="#sobre">Sobre</a></li>
				<li><a class="page-scroll" href="#services">Serviços</a></li>
				<li><a class="page-scroll" href="#galeria">Galeria</a></li>
				<li><a class="page-scroll" href="#contato">Contato</a></li>
				<li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <b> <i class="fa fa-user"
							aria-hidden="true">&nbsp;</i> Bem vindo,
							${usuarioLogado.nome}&nbsp;&nbsp;
					</b> <span class="caret"></span>
				</a>
					<ul id="id" class="dropdown-menu">
						<li>
							<div class="row">
								<div class="col-md-12">

									<a class="nav-tabs-dropdown btn-01"
										href="exibirAlterarDadosUsuario"><strong>Alterar
											Dados</strong></a>
									<div class="espaco-negro"></div>
									<a class="nav-tabs-dropdown btn-01"
										href="exibirIncluirAtendimento"><strong>Fazer
											Reserva</strong></a>
									<p />
								</div>

								<div class="bottom">

									<a href="logout" class="btn-new"><strong>Sair</strong></a>
								</div>
								<Br>
							</div>

						</li>
					</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<header id="home">

	<div class="header-content">
		<div class="header-content-inner">
			<h1 id="homeHeading">Beleza Master Especializada em Designer de
				Cortes</h1>
			<hr>
			<p>Especializada em Cortes Femininos e Masculinos, Designer de
				Sombrancelhas, Penteados para noivas e muito mais!</p>
			<a href="#about" class="btn btn-primary btn-xl page-scroll">Saiba
				Mais</a>
		</div>
	</div>

	</header>

	<section class="bg-primary" id="sobre">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<h2 class="section-heading">Nós temos o que você precisa!</h2>
				<hr class="light">
				<p class="text-faded">Lorem ipsum dolor sit amet, consectetur
					adipiscing elit. Nullam congue blandit tincidunt. Integer vel
					posuere ligula, in congue lorem. Nam eget augue dignissim,
					tristique lorem eget, hendrerit nunc. Maecenas sed quam a arcu
					consectetur commodo id sit amet mi.</p>
				<a href="#services"
					class="page-scroll btn btn-default btn-xl sr-button">Começar!</a>

			</div>

		</div>
	</div>
	</section>

	<section id="services">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading">Nossos Serviços</h2>
				<hr class="primary">
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-scissors text-primary sr-icons"></i>
					<h3>Cortes Femininos e Masculinos</h3>
					<p class="text-muted">Feminino: Corte Médio, Long Bob, Messy
						Hair.
					<p class="text-muted" />
					Masculino: Corte Moicano, Militar e Muito Mais!
					</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-eye text-primary sr-icons"></i>
					<h3>Designer de Sombrancelhas</h3>
					<p class="text-muted">Para todos os tipos de rosto, Oval,
						Redondo e Muito Mais!</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-sign-language text-primary sr-icons"></i>
					<h3>Manicure & Pedicure</h3>
					<p class="text-muted">Corte, Limpeza e Pintura.</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-heart text-primary sr-icons"></i>
					<h3>Penteados para Noivas</h3>
					<p class="text-muted">Escolha qualquer tipo de modelo para o
						seu dia!</p>
				</div>
			</div>
		</div>
	</div>
	</section>

	<section class="no-padding" id="galeria">
	<div class="container-fluid bg-dark">
		<div class="row no-gutter popup-gallery">
			<div class="col-lg-4 col-sm-6">
				<a href="view/img/portfolio/fullsize/1.jpg" class="portfolio-box">
					<img src="view/img/portfolio/thumbnails/1.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Project Name</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="view/img/portfolio/fullsize/2.jpg" class="portfolio-box">
					<img src="view/img/portfolio/thumbnails/2.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Project Name</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="view/img/portfolio/fullsize/3.jpg" class="portfolio-box">
					<img src="view/img/portfolio/thumbnails/3.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Project Name</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="view/img/portfolio/fullsize/4.jpg" class="portfolio-box">
					<img src="view/img/portfolio/thumbnails/4.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Project Name</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="view/img/portfolio/fullsize/5.jpg" class="portfolio-box">
					<img src="view/img/portfolio/thumbnails/5.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Project Name</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="view/img/portfolio/fullsize/6.jpg" class="portfolio-box">
					<img src="view/img/portfolio/thumbnails/6.jpg"
					class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Project Name</div>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	</section>
	<section id="contato" class="bg-dark">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<h2 class="section-heading">Fale Conosco!</h2>
				<hr class="primary">
				<p>Pronto para começar a usar nossos serviços? Isso é ótimo!
					Entre em contaco conosco por Telefone ou E-mail e vamos entrar em
					contato com você o mais rápido possível!</p>
			</div>
			<div class="col-lg-4 col-lg-offset-2 text-center">
				<i class="fa fa-phone fa-3x sr-contact"></i>
				<p>(81)00000-0000</p>
			</div>
			<div class="col-lg-4 text-center">
				<i class="fa fa-envelope-o fa-3x sr-contact"></i>
				<p>
					<a href="#">beleza@master.com</a>
				</p>
			</div>
		</div>
	</div>
	</section>

	<!-- jQuery -->
	<script src="view/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="view/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="view/vendor/easing/easing.min.js"></script>
	<script src="view/vendor/scrollreveal/scrollreveal.min.js"></script>
	<script src="view/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Theme JavaScript -->
	<script src="view/js/creative.min.js"></script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>나의 설문지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/makeform.css">
<link rel="stylesheet" href="/resources/js/myform.js">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
	   $(".V_form").click(function(){
	      $("#myModal").modal()
	    });
	});
</script>
</head>
<body>
	<div>
		<div class="container text-center">

			<h2>
				<img style="float:; width: 10%;" src="/resources/img/tenor.gif"> 응답하라2019<img
					class="M_image" style="width: 10%;" src="/resources/img/tenor.gif">
			</h2>
		</div>
	</div>

	<nav class="navbar navbar-dark bg-dark"
		style="background-color: #e3f2fd";>
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar" style="">
					<span class="glyphicon glyphicon-tasks"
						style="font-size: 120%; color: cornflowerblue; background-color: white;"></span>
				</button>
				<a class="navbar-brand">Gudi_Academy</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="act"><a href="/">Home</a></li>
					<li><a href="/myform">Myform</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							Your Account</a></li>
					<li><a href="/loginkakao">login</a></li>
					<li><a href="/logout">logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<section>
		<div class="container text-center">
			<div class="row">

				<div class="col-sm-3 V_form">
					<div class="panel panel-info">
						<div class="panel-heading">제목</div>
						<div class="panel-body">
							<img src="" class="img-responsive" style="width: 100%" alt="">
						</div>
						<div class="panel-footer">txt</div>
					</div>
				</div>
				<div class="col-sm-3 V_form">
					<div class="panel panel-info">
						<div class="panel-heading">제목</div>
						<div class="panel-body">
							<img src="" class="img-responsive" style="width: 100%" alt="">
						</div>
						<div class="panel-footer">txt</div>
					</div>
				</div>
				<div class="col-sm-3 V_form">
					<div class="panel panel-info">
						<div class="panel-heading">제목</div>
						<div class="panel-body">
							<img src="" class="img-responsive" style="width: 100%" alt="">
						</div>
						<div class="panel-footer">txt</div>
					</div>
				</div>
				<div class="col-sm-3 V_form">
					<div class="panel panel-info">
						<div class="panel-heading">제목</div>
						<div class="panel-body">
							<img src="" class="img-responsive" style="width: 100%" alt="">
						</div>
						<div class="panel-footer">txt</div>
					</div>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">
									<p>제 목</p>
								</h4>
							</div>
							<div class="modal-body">
								<form>
									<table>
										<thead>
											<tr>
												<p>%%질문</p>
											</tr>
										</thead>
										<tbody>

											<td>
												<div class="radio">
													<label><input type="radio" name="optradio">%%option 1 
														: </label>
												</div>
											</td>
											<td><input class="form-control" type="text"
												value="%%옵션" disabled></td>
										</tbody>
									</table>
									<hr>
									<input class="form-control" type="text" value="%%uuid"
										disabled>
								</form>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="container text-center">
			<a href="/makeform" class="btn btn-primary active right"
				role="button">설문지 만들기</a>
		</div>

	</section>
	<br>
	<footer class="container-fluid text-center">
		<form class="form-inline" action="/myform" method="post">
			Get Title : <input type="text" name="title" class="form-control"
				size="50" placeholder="Search">
			<button type="submit" class="btn btn-info">Find</button>
		</form>
		<div class="margin5">
			<p>Goodee Academy Copyright.</p>
		</div>
	</footer>
</body>
</html>
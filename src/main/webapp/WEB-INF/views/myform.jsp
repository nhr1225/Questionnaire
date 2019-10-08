<%@page import="com.java.nhr1225.bean.makeformBean"%>
<%@page import="java.util.List"%>
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
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	$(document).ready(function(){
		var id = <%=session.getAttribute("id")%>;
		var title;
		var subtitle;
		var option;
		
    /*     if( id == null || id == ""){
        	$(".profile").hide();
        	$("#myform_nav").hide();
        	alert("로그인이 필요합니다.");
        	location.href="http://gdj16.gudi.kr:20010/";
        }else{
        	$(".profile").show();
        	$("#myform_nav").show();
        } */
		
        
		
	   $(".V_form").click(function(){
	      $("#myModal").modal()
	        title = document.getElementsByClassName("title")[0].innerHTML;
			subtitle = document.getElementsByName("subtitle")[0].value;
			option = document.getElementsByName("option")[0].value;
			
			$.ajax({
			    url: "/myform", 
			    data: { title : title, subtitle : subtitle, option : option, id : id,}, 
			    type: "POST",  
			    dataType: "json"
			})
			.done(function(json) {
			    location.href="/myform";
			})
			.always(function() {
			    alert("요청이 완료되었습니다!");
			    location.href="/myform";

			});
	    });
	   
	   /* random color */
		var color;
		color = '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
		console.log("color : ", color);
		$("#panel-body").css("background-color", "color");
		/* document.getElementsByClassName(".panel-body").style.backgroundColor = "lightblue"; */
	  
	   
	});
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	
	function drawChart() {
	  var data = google.visualization.arrayToDataTable([
		  ['옵션', 'Hours per Day'],
		  ['Work', 8],
		  ['Eat', 2],
		  ['TV', 4],
		  ['Gym', 2],
		  ['Sleep', 8]
	  ]);

	  var options = {'title':'My Average Day', 'width':550, 'height':400};

	  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	  chart.draw(data, options);
	}
	</script>
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
				<%
					 List<makeformBean> list = (List<makeformBean>) request.getAttribute("list");
	                    System.out.println(list);
							if(list == null){
								System.out.println("없다");
							} else {
								for(int i = 0; i < list.size(); i++){
					
				%>
				<div class="col-sm-3 V_form">
					<div class="panel panel-info">
					
						<div class="panel-heading title"><%=list.get(i).getTitle()%></div>
						<div class="panel-body" id="panel-body" >
						ttt
						</div>
						<div class="panel-footer">uuid</div>
					</div>
				</div>
				<%
						}
					}
				%>
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">
						<%
							 List<makeformBean> list1 = (List<makeformBean>) request.getAttribute("list");
			                    System.out.println(list);
									if(list == null){
										System.out.println("없다");
									} else {
										for(int i = 0; i < list.size(); i++){
							
						%>
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">
									<p><%=list1.get(i).getTitle()%></p>
								</h4>
							</div>
							<div class="modal-body">
								<form>
									<table>
										<thead>
											<tr>
												<p><%=list1.get(i).getSubtitle()%></p>
											</tr>
										</thead>
										<tbody>

											<td>
												<div class="radio">
													<label><input type="radio" name="optradio"></label>
												</div>
											</td>
											<td>
												<input class="form-control" type="text" value="<%=list1.get(i).getOption()%>">
											</td>
										</tbody>
									</table>
									<hr>
									<input class="form-control" type="text" value="%%uuid" disabled>
								</form>
							</div>
						</div>
						<%
								}
							}
						%>
						<div id="piechart" style="padding: 15px; margin: auto;"></div>
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
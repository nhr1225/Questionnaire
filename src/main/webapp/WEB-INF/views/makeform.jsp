<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>설문지 만들기</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/makeform.css">
<link rel="stylesheet" href="/resources/js/index.js">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" async src="https://tenor.com/embed.js"></script>
<script>
$(document).ready(function(){
	var option_num = [1];
	
	$("form").submit(function(e){
		e.preventDefault();
		var tf = document.getElementsByClassName("textForm");
		for(var i=0; i<tf.length; i++){
			if(tf[i].value ==""){
				alert("제목을 입력하시오");
				return;
			} 
		}
		$("form")[0].submit();
	});
	
	var id = <%=session.getAttribute("id")%>;

	if( id == null || id == ""){
		$(".profile").hide();
		$("#myform_nav").hide();
		$("#qna_nav").hide();
		alert("로그인이 필요합니다.");
		location.href="/";
	}else{
		$(".profile").show();
		$("#myform_nav").show();
		$("#qna_nav").show();
	} 

		$(".btn2_plus").off().click(function() {
			btn2plus(this);

			$(".btn2_minus").click(function() {
				let m_indexs = $(".btn2_minus").index(this);
				/* console.log("m_Index = ",m_indexs); */
				if (m_indexs > -1) {
					$("table tbody #sub_option")[m_indexs].remove();
					
				}
				option_num.pop(m_indexs);
			});
		});

		function btn2plus(prop) {

			let items = 11;
			let form_option_plus = "";
			form_option_plus += '<tr id="sub_option">'
			form_option_plus += '<td>옵 션</td>'
			form_option_plus += '<td><input class="form-control"  type="text" name="option" placeholder="옵션을 입력하시오"></td>'
			form_option_plus += '<td>'
			form_option_plus += '<button type="button" class="btn2_minus"><span class="glyphicon glyphicon glyphicon-minus" aria-hidden="true"></span></button>'
			form_option_plus += '</td>'
			form_option_plus += '</tr>';
			console.log("prop : ", prop);
			let index = $(".btn2_plus").index(prop);

			console.log("index : ", index);

			option_num[index] += 1;

			/* var num = $("tbody tr").length +1; */
			if (option_num[index] < 6) {
				$("table tbody").eq(index).append(
						form_option_plus);
			} else {
				alert("옵션은 5개까지 가능합니다.");
			}

		}

		$("#btn1_plus").click(function() {
			let items = 1;
			let form_table = "";
			form_table += '<table class="table table-striped">'
			form_table += '<thead>'
			form_table += '<tr>'
			form_table += '<th style="text-align: center;">질 문</th>'
			form_table += '<th><input class="form-control" name="subtitle" type="text" placeholder="질문을 입력하시오"></th>'
			form_table += '<th style="display: table-cell; text-align: center;">'
			form_table += '<button type="button" class="btn1_minus" id="btn1_minus" >'
			form_table += '<span class="glyphicon glyphicon glyphicon-minus" aria-hidden="true"></span>'
			form_table += '</button>'
			form_table += '</th>'
			form_table += '</tr>'
			form_table += '</thead>'
			form_table += '<tbody>'
			form_table += '<tr>'
			form_table += '<td>옵 션</td>'
			form_table += '<td><input class="form-control" name="option" type="text" placeholder="옵션을 입력하시오"></td>'
			form_table += '<td>'
			form_table += '<button type="button" class="btn2_plus">'
			form_table += '<span class="glyphicon glyphicon glyphicon-plus" aria-hidden="true"></span>'
			form_table += '</button>'
			form_table += '</td>'
			form_table += '</tr>'
			form_table += '</tbody>'
			form_table += '</table>';
			$(".option_table").eq(0).append(
					form_table);
	
			option_num.push(1);
			console.log("option_num : ",option_num);
		$(".btn1_minus").click(function() {
			let indexs = $(".btn1_minus").index(this);
			/* console.log("Index = ",indexs); */
			var i = indexs + 1;
			if (i > 0) {
				document.getElementsByTagName("table")[i].remove();
				
			}
			option_num.pop(i);
		});

		$(".btn2_plus").off().click(function() {
			btn2plus(this);
	
			$(".btn2_minus").click(function() {
				let m_indexs = $(".btn2_minus").index(this);
				if (m_indexs > -1) {
					$("table tbody #sub_option")[m_indexs].remove();
				}
			});
		});

		function btn2plus(prop) {
			let items = 11;
			let form_option_plus = "";
			form_option_plus += '<tr id="sub_option">'
			form_option_plus += '<td>옵 션</td>'
			form_option_plus += '<td><input class="form-control" name="option"  type="text" placeholder="옵션을 입력하시오"></td>'
			form_option_plus += '<td>'
			form_option_plus += '<button type="button" class="btn2_minus"><span class="glyphicon glyphicon glyphicon-minus" aria-hidden="true"></span></button>'
			form_option_plus += '</td>'
			form_option_plus += '</tr>';

			let index = $(".btn2_plus").index(prop);
			option_num[index] += 1
			/* var num = $("tbody tr").length +1; */

			console.log("index : ", index);

			if (option_num[index] < 6) {
				$("table tbody").eq(index).append(form_option_plus);
			} else {
				alert("옵션은 5개까지 가능합니다.");
			}

			/* console.log($("table tbody").eq(index)); */
		}

	});
	
	$("#add").click(function(e) {
		 e.preventDefault();
		var title = document.getElementsByName("title")[0].value;
		var id = document.getElementsByName("id")[0].value;
		
		var subtitle_len = document.getElementsByName("subtitle").length;
		
		var subtitleList = [];
		var optionList = [];
		var option_len = 0;
		for (var i = 0; i < subtitle_len; i++) {
			subtitleList.push(document.getElementsByName("subtitle")[i].value);
			
			var options = [];
			option_len = $('.table-striped').children('tbody').eq(i).find('input[type="text"]').length;
			for (var j = 0; j < option_len; j++) {
				options.push($('.table-striped').children('tbody').eq(i).find('input[type="text"]').eq(j).val());
			}
			optionList.push(options);
		}
		
		
		 var data =  {
				"title" : title,
				"subtitle" : JSON.stringify(subtitleList),
				"option" : JSON.stringify(optionList),
				"id" : id
		}
		 console.log("data : ",data);
		 console.log("subtitleList : ",subtitleList);
		 console.log("optionList : ",optionList);
		/* var person = JSON.stringify(data);
		System.out.println(person);  */
		
		$.ajax({
			url : "/insert",
			data : data,
			type : "POST",
		}).done(function(json) {
			location.href = "/myform";
		}).always(function() {
			alert("요청이 완료되었습니다!");
			location.href = "/myform";

		});
	});
});
</script>
</head>
<body>
	<div>
		<div class="container text-center">
			<img class="M_image" style="float: left; width: 10%;"
				src="/resources/img/tenor.gif"> <img
				style="float: left; width: 10%;" src="/resources/img/tenor.gif">
			<h2>Make Area</h2>
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
					<li><a href="/write">Q&A</a></li>
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
		<form class="container text-center">
			<div class="container-fluid text-center">
				<h3>Title</h3>
				<input class="form-control textForm" type="text"
					style="text-decoration: none;" name="title" placeholder="설문지 제목입력란">
			</div>
			<hr>
			<div class="option_table">
				<table class="table table-striped">
					<thead>
						<tr>
							<th style="text-align: center;">질 문</th>
							<th><input class="form-control textForm" type="text"
								placeholder="질문을 입력하시오" name="subtitle"></th>
							<th style="display: table-cell; text-align: center;">
								<button type="button" id="btn1_plus">
									<span class="glyphicon glyphicon glyphicon-plus"
										aria-hidden="true"></span>
								</button>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>옵 션</td>
							<td><input class="form-control textForm" type="text"
								placeholder="옵션을 입력하시오" name="option"></td>
							<td>
								<button type="button" class="btn2_plus">
									<span class="glyphicon glyphicon glyphicon-plus"
										aria-hidden="true"></span>
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<a href="/myform" class="btn btn-primary active right" role="button" style="margin-left: 5px;">취소</a> 
				<input style="text-align: center;" type="hidden" id="id" name="id" class="textForm" value="<%=session.getAttribute("id")%>"> 
				<input type="button" class="btn btn-primary right" id="add" value="저장">
			</div>
		</form>
	</section>
	<footer class="container-fluid text-center">
		<div class="margin5">
			<p>Goodee Academy Copyright.</p>
		</div>
	</footer>
</body>
</html>
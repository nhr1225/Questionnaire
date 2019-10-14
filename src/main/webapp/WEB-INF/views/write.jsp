<%@page import="com.java.nhr1225.bean.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	    <meta charset="UTF-8" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" type="text/css" href="/resources/css/write.css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/css/write.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	    <title>Q&A 게시판</title>
		<script>
		$(document).ready(function(){
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
			
				var nickname = "<%=session.getAttribute("nickname")%>";
				var input = document.getElementsByTagName("input");
				var a = document.getElementsByTagName("a");
				if(nickname == "null" | nickname == ""){
					$("button").prop("disabled", true);
				
				} else{
					$("button").prop("disabled", false);
				}
			});
			function date(){
				 var d = new Date();
			     var currentDate = d.getFullYear() + "년 " + ( d.getMonth() + 1 ) + "월 " + d.getDate() + "일";
			     document.getElementById("date").innerHTML = currentDate;
			}
			
			
		</script>
    </head>
    
    <body>
   	<div>
      <div class="container text-center">
          <h2><img class="M_image" style="width: 10%;" src="/resources/img/tenor.gif">Q&A 게시판<img style="width: 10%;" src="/resources/img/tenor.gif"></h2>
      </div>
    </div>
    <nav class="navbar navbar-dark bg-dark" style="background-color: #e3f2fd";>
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="">
            <span class="glyphicon glyphicon-tasks" style="font-size: 120%; color: cornflowerblue; background-color: white;"></span>                     
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
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
              <li><a href="/login">login</a></li>
              <li><a href="/logout">logout</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <section class="t1">
        <div class="padding10 width45 write" id="write">
            <a href="/qna_write"  style="float: right; margin-right: 15px;"><button class="btn btn-info active right" type="button">글 작성</button></a>
        </div>
        <div class="t2">
            <table>
                <thead>
                    <tr>
                        <th>번  호</th>
                        <th>제  목</th>
                        <th>내  용</th>
                        <th>작성자</th>
                    </tr>
                </thead>
                <br>
                <tbody>
                    <%
                    List<BoardBean> list = (List<BoardBean>) request.getAttribute("list");
                    System.out.println(list);
						if(list == null){
							System.out.println("없다");
						} else {
							for(int i = 0; i < list.size(); i++){
					%>
								
								<tr>
							      <td style="text-align: center;"  id="number"><a href="/write?abc=<%=list.get(i).getNo()%>"><%=list.get(i).getNo()%></a></td>
							      <td><%=list.get(i).getTitle() %></td>
							      <td><%=list.get(i).getTxt() %></td>
							      <td style="text-align: center;"><%=list.get(i).getNickname()%></td>
							    </tr>
							    
					<%
							}
						}
					%>
				</tbody>
            </table>
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
</html>
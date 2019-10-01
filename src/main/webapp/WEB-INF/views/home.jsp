<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>설문지 첫화면</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/css/index.css">
        <link rel="stylesheet" href="/resources/js/index.js">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script>
        
        $(document).ready(function(){
        	var id = <%=session.getAttribute("id")%>;
            console.log("id : " + id);
            if( id == null || id == ""){
            	$(".profile").hide();
            	$("#myform_nav").prop("disabled", true);
            }else{
            	$(".profile").show();
            	$("#myform_nav").prop("disabled", false);
            }
        });
        
        	
        </script>
    </head>
    <body>
        <div >
          <div class="container text-center">
            
            <h2><img class="M_image" style="width: 10%;" src="/resources/img/tenor.gif">나만의 설문지를 만들어 보세요.<img style="width: 10%;" src="/resources/img/tenor.gif"></h2>
            
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
                <li id="myform_nav"><a href="/myform">Myform</a></li>
                
              </ul>
              <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
                  <li><a href="/loginkakao">login</a></li>
                  <li><a href="/logout">logout</a></li>
              </ul>
            </div>
          </div>
        </nav>
        <section>
            <div class="container text-center">    
              <div class="row">
                    <div class="col-sm-3 well profile">
                    <%-- <%=session.getAttribute("thumbnail_image")%> --%>
                      <div class="well" style="background-image: <%=session.getAttribute("thumbnail_image")%>">
                        <p><a href="#">My Profile</a></p>
                        <%-- <%=session.getAttribute("profile_image")%> --%>
                          <div src="" style="border-radius: 100%;" height="65" width="65" alt="Avatar"><img alt="" src="<%=session.getAttribute("profile_image")%>" style="width: 25%;"></div>
                      </div>
                      <div class="well">
                          <p>안녕하세요  <%=session.getAttribute("nickname") %> 님</p>
                       <!-- <p><a href="#">Interests</a></p>
                        <p>
                          <span class="label label-default">News</span>
                          <span class="label label-primary">W3Schools</span>
                          <span class="label label-success">Labels</span>
                          <span class="label label-info">Football</span>
                          <span class="label label-warning">Gaming</span>
                          <span class="label label-danger">Friends</span>
                        </p>-->
                      </div>
                    </div>
                  <div>
                     <h1>Welcome to Servey World</h1>
                  </div>
                </div>
            </div>
        </section>
        <footer class="container-fluid text-center">
            <div class="margin5"><p>Goodee Academy Copyright.</p> </div>
        
        </footer>
       
    </body>
</html>

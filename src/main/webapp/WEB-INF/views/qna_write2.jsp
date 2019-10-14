<%@page import="java.util.List"%>
<%@page import="com.java.nhr1225.bean.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판글쓰기</title>
<link rel="stlyesheet" type="text/css" href="/resources/css/file.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/qna_write.css">
<script>
	$(document).ready(function(){	
		if( id == null || id == ""){
			alert("로그인이 필요합니다.");
			location.href="/";
		}
		
	<%
		List<BoardBean> list = (List<BoardBean>)request.getAttribute("list");
	%>
		console.log("<%=list.get(0).getNickname()%>")
		$("#no")[0].value = "<%=list.get(0).getNo()%>"
		$("#title")[0].value = "<%=list.get(0).getTitle()%>"
		$("#txt")[0].value = "<%=list.get(0).getTxt()%>"
		$("#nickname")[0].value = "<%=list.get(0).getNickname()%>"
		$("#nickname").hide();
		$("#id").hide();
		
		if("<%=list.get(0).getId()%>" == "<%=session.getAttribute("id")%>"){
			$("#update").prop("disabled", false);
			$("#delete").prop("disabled", false);
		}else{
			$("#update").prop("disabled", true);
			$("#delete").prop("disabled", true);
		}
		
		$(".update").on("click",function(){
			var no = document.getElementsByName("no")[0].value;
			var title = document.getElementsByName("title")[0].value;
			var txt = document.getElementsByName("txt")[0].value;
			var id = document.getElementsByName("id")[0].value;
			var nickname = document.getElementsByName("nickname")[0].value;
			$.ajax({
			    url: "/update_board", 
			    data: { no: no, title : title, txt : txt, id : id, nickname :nickname}, 
			    type: "POST",  
			    dataType: "json"
			})
			.done(function(json) {
			    location.href="/write";
			})
			.always(function() {
			    alert("요청이 완료되었습니다!");
			    location.href="/write";

			});
		});
		
		$(".delete").on("click", function(){
			var no = document.getElementsByName("no")[0].value;
			var title = document.getElementsByName("title")[0].value;
			var txt = document.getElementsByName("txt")[0].value;
			var id = document.getElementsByName("id")[0].value;
			var nickname = document.getElementsByName("nickname")[0].value;
			$.ajax({
			    url: "/delete_board", 
			    data: { no: no, title : title, txt : txt, id : id, nickname :nickname}, 
			    type: "POST",
			})
			.done(function(json) {
			    location.href="/write";
			})
			.always(function() {
			    alert("요청이 완료되었습니다!");
			    location.href="/write";
			});
		});
	});

	function back() {
		location.href = "/write";
	}
	
	var dt = new DataTransfer();
	function formList() {
		console.log(dt);
	}
	function file_Event(obj) {
		console.log(obj.files);
		for (var i = 0; i < obj.files.length; i++) {
			var fileName = obj.files[i].name;
			var ext = fileName.substring(fileName.lastIndexOf(".") + 1,
					fileName.length);
			console.log(fileName, ext);
			var extLower = ext.toLowerCase();
			var text = "";
			if ("txt" == extLower) {
				text = "텍스트";
			} else if ("pdf" == extLower || "html" == extLower) {
				text = "문서";
			} else if ("jpg" == extLower || "jpeg" == extLower
					|| "png" == extLower) {
				text = "이미지";
			} else {
				continue;
			}
			var node = document.createElement("LI");
			var textnode = document.createTextNode(text);
			node.appendChild(textnode);
			node.classList.add("itemContainer");
			document.getElementById("mainContainer").appendChild(node);
			dt.items.add(obj.files[i]);
		}
	}
	
</script>
</head>
<body>
	<div>
		<div class="boardBox">
			<h2>게시판 글쓰기</h2>
			<div class="marginbt">
					<label class="width10">번  호 : </label> 
					<input type="text" name="no" id="no" class="no" disabled>
				</div>
			<div class="line">
				<button type="button" onclick="back()">뒤로가기</button>
			</div>
			<hr>
			<!-- form 위치를 no 위로 올리기 || function을 document.ready() 안에 넣기 -->			
			<form action="/" method="post" enctype="multipart/form-data">
				<div class="marginbt">
					<label class="width10">제 목</label> 
					<input name="title" id="title" type="text" class="textForm width80" required="required" placeholder="글 제목을 입력하세요." />
				</div>
				<div class="marginbt">
					<label class="width10">내 용</label>
					<textarea name="txt" id="txt" rows="5" style="min-height: 50px; min-width: 80%;" class="textForm width80"
						placeholder="글 내용을 입력하세요." required="required"></textarea>
				</div>
				<div class="line">
					<input style="text-align: center;" type="text" id="nickname" name="nickname" value="<%=session.getAttribute("nickname")%>">
					<input style="text-align: center;" type="text" id="id" name="id" class="textForm" value="<%=session.getAttribute("id")%>">
				</div>
			</form>
			<button id="update" name="update" class="update">수 정</button>
			<button id="delete" name="delete" class="delete">삭 제</button>
		</div>
	</div>
</body>
</html>
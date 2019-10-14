<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/qna_write.css">
<script>
	$(document).ready(function(){
		
		if( id == null || id == ""){
			alert("로그인이 필요합니다.");
			location.href="/";
		}
		
		
		$("#nickname").hide()
		$("#id").hide()
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
<body >
	<div>
		<div class="boardBox">
			<h2>게시판 글쓰기</h2>
			<div class="line">
				<button type="button" onclick="back()">뒤로가기</button>
			</div>
			<hr>
			<form action="/insert_board" method="post" enctype="multipart/form-data">
				<div class="marginbt">
					<label class="width10">제 목</label> 
					<input name="title" type="text"	class="textForm width80" placeholder="글 제목을 입력하세요." />
				</div>
				<div class="marginbt">
					<label class="width10">내 용</label>
					<textarea name="txt" id="txt" rows="5" style="min-height: 50px; min-width: 80%;" class="textForm width80" placeholder="글 내용을 입력하세요." required="required"></textarea>
				</div>
				<div class="line">
					<input type="submit" name="add" class="add" value="저장">
					<input style="text-align: center;" type="text" id="nickname" name="nickname" value="<%=session.getAttribute("nickname")%>">
					<input style="text-align: center;" type="text" id="id" name="id" class="textForm" value="<%=session.getAttribute("id")%>">
				</div>
				
			</form>
		</div>
	</div>
</body>
</html>
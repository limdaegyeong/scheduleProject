<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/resource/js/cmm/com.js"></script>
    
    <meta charset="UTF-8">
    <title>스케줄관리 프로그램</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>스케줄관리 프로그램</h1>
        <div class="form-group">
            <label for="title">프로젝트명</label>
            <input id="title" type="text" placeholder="프로젝트명을 입력하세요"/>
        </div>
        <div class="form-group">
            <label for="content">프로젝트내용</label>
            <input id="content" type="text" placeholder="프로젝트내용을 입력하세요"/>
        </div>
        <div class="form-group">
            <label for="startDt">프로젝트 시작일</label>
            <input id="startDt" type="text" placeholder="yyyy-mm-dd"/>
        </div>
        <div class="form-group">
            <label for="endDt">프로젝트 종료일</label>
            <input id="endDt" type="text" placeholder="yyyy-mm-dd"/>
        </div>
        <button type="button" id="testBtn">스케쥴테스트</button>
        <button type="button" id="home">홈</button>
    </div>
</body>

<script type="text/javascript">
	$("#testBtn").on("click", function(){
		 
		title		= $("#title").val();
		content		= $("#content").val();
		startDt		= $("#startDt").val();
		endDt		= $("#endDt").val();
		var date = new Date();
		var now = date.getFullYear() + "-" + ("00"+(date.getMonth()+1).toString()).slice(-2) + "-" + ("00"+(date.getDate()).toString()).slice(-2);		
		
		var json = {};
		json.title		= title;
		json.content	= content;
		json.startDt	= startDt;
		json.endDt		= endDt;
		json.registDt	= now;
		
		if(title == "" ) { alert("제목을 입력해주세요"); return; }
		if(content == "" ) { alert("내용을 입력해주세요"); return; }
		if(startDt == "" ) { alert("시작일을 입력해주세요"); return; }
		if(endDt == "" ) { alert("종료일을 입력해주세요"); return; }
		
		console.log("title : "+title);
		console.log("content : "+content);
		console.log("startDt : "+startDt);
		console.log("endDt : "+endDt);
		console.log("registDt : "+now);
		ajaxAction(json, "text", "/schedule/scheduleSave.act", function(result) {
			alert(result);
			document.location.href = document.location.href;
		});
	});
   	$("#home").on("click", function() {
   		document.location.href = "/";
    });
</script>

</html>
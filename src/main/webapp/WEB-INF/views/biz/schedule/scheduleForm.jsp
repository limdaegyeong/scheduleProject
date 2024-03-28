<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resource/js/cmm/com.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">	
<meta charset="UTF-8">
<title>스케쥴 관리 게시판</title>
    <style>
        .container {
            margin-top: 20px;
        }

        .clickable {
            cursor: pointer;
            padding: 10px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .clickable:hover {
            background-color: #f0f0f0;
        }

        .btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div>
            자유 게시판
            <c:forEach var="item" items="${scb_infoList}">
                <div id="${item.num}" class="clickable">
                    <span data-value="${item.num}">게시글 번호 : ${item.num}</span> 
                    <span data-value="${item.title}">제목 : ${item.title}</span>
                </div>
            </c:forEach>
            <button type="button" id="addBtn" class="btn btn-primary">게시글 작성</button>
        </div>
    </div>
</body>

<script type="text/javascript">
/* 	$("#addBtn").on("click", function(){
		 
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
		
		console.log("title : "+title);
		console.log("content : "+content);
		console.log("startDt : "+startDt);
		console.log("endDt : "+endDt);
		console.log("registDt : "+now);
		ajaxAction(json, "text", "/schedule/scheduleSave.act", function(result) {
		});
	}); */
   	$("#addBtn").on("click", function() {
        window.location.href = "/schedule/scheduleAddForm";
    });
	
	$('.clickable').on("click", function() {
	    var value = $(this).attr('id');
	    var url = "/scheduleDetailForm?num=" + value;
	    window.location.href = url;
	});
</script>

</html>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resource/js/cmm/com.js"></script>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	    자유 게시판
	    <c:forEach var="item" items="${scb_infoList}">
	        <div id="${item.num}" class="clickable">
	            <span data-value="${item.num}">게시글 번호 : ${item.num}</span> 
	            <span data-value="${item.title}">제목 : ${item.title}</span>
	        </div>
	    </c:forEach>
	    <button type="button" id="addBtn">게시글 작성</button>
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
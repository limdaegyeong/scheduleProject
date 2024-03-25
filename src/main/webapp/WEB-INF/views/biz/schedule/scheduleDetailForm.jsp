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
	<div id="scbInfoDtlView">
		<c:forEach var="item" items="${scb_infoDtl}">
	        <div>
	            <span data-value="${item.num}">게시글 번호 : ${item.num}</span> 
	            <span data-value="${item.title}">제목 : ${item.title}</span>
	        </div>
	        <div>
	        	게시글 내용 : ${item.content}
	        </div>
	        <div>
	        	게시글 시작일 : ${item.startDt}
	        </div>
	        <div>
	        	게시글 종료일 : ${item.endDt}
	        </div>
		</c:forEach>
	    <button type="button" id="change">수정하기</button>
	    <button type="button" id="delete">삭제하기</button>
	    <button type="button" id="home">홈</button>
	</div>
	<div id="scbInfoDtlUpdateView" style="display: none;">
	    <c:forEach var="item" items="${scb_infoDtl}">
			<div>
				<input type="hidden" id="num" value="${item.num}">
			    <span>게시글 번호 : ${item.num}</span> 
			    <span>제목 : <input type="text" id="title" value="${item.title}"></span>
			</div>
	        <div>
	            게시글 내용 : <textarea id="content" rows="4" cols="50">${item.content}</textarea>
	        </div>
	        <div>
	            게시글 시작일 : <input type="text" id="startDt" value="${item.startDt}">
	        </div>
	        <div>
	            게시글 종료일 : <input type="text" id="endDt" value="${item.endDt}">
	        </div>
	    </c:forEach>
	    <button type="button" id="update">수정 완료</button>
	    <button type="button" id="home">홈</button>
	</div>


</body>
<script type="text/javascript">
	$(document).ready(function(){
		
		var updateSwitch = 0;
		
		$("#change").on("click", function() {
		    updateSwitch = 1; // updateSwitch 값을 1로 변경
		    $("#scbInfoDtlView").hide(); // scbInfoDtlView를 숨김
		    $("#scbInfoDtlUpdateView").show(); // scbInfoDtlUpdateView를 보임
		});

		$("#home").on("click", function() {
	   		document.location.href = "/";
	    });

	    // 홈 버튼이나 다른 페이지로 이동할 때 updateSwitch 값과 뷰를 초기화
	    $(window).on("beforeunload", function() {
	        updateSwitch = 0;
	        $("#scbInfoDtlUpdateView").hide(); // scbInfoDtlUpdateView를 숨김
	        $("#scbInfoDtlView").show(); // scbInfoDtlView를 보임
	    });
	    
	    $("#update").on("click", function(){
	    	num			= $("#num").val();
			title		= $("#title").val();
			content		= $("#content").val();
			startDt		= $("#startDt").val();
			endDt		= $("#endDt").val();
			var date = new Date();
			var now = date.getFullYear() + "-" + ("00"+(date.getMonth()+1).toString()).slice(-2) + "-" + ("00"+(date.getDate()).toString()).slice(-2);		
			
			var json = {};
			json.num		= num;
			json.title		= title;
			json.content	= content;
			json.startDt	= startDt;
			json.endDt		= endDt;
			json.registDt	= now;
			
			if(title == "" ) { alert("제목을 입력해주세요"); return; }
			if(content == "" ) { alert("내용을 입력해주세요"); return; }
			if(startDt == "" ) { alert("시작일을 입력해주세요"); return; }
			if(endDt == "" ) { alert("종료일을 입력해주세요"); return; }
			
			console.log("num : "+num);
			console.log("title : "+title);
			console.log("content : "+content);
			console.log("startDt : "+startDt);
			console.log("endDt : "+endDt);
			console.log("registDt : "+now);
			ajaxAction(json, "text", "/schedule/scheduleUpdate.act", function(result) {
				alert(result);
				document.location.href = document.location.href;
			});
	    });
	    
	    $("#delete").on("click", function(){
	        
	    	if (confirm("정말로 삭제하시겠습니까?")) {
		    	num			= $("#num").val();
		    	
				var json = {};
				json.num		= num;
				
				console.log("num : "+num);
	            ajaxAction(json, "text", "/schedule/scheduleDelete.act", function(result) {
	                alert(result);
	                document.location.href = "/";
	            });
	        }
	    });
	});
</script>

</html>

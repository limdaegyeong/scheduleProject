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
	    <button type="button" id="home">홈</button>
	</div>


</body>
<script type="text/javascript">

   	$("#home").on("click", function() {
   		document.location.href = "/";
    });

</script>

</html>
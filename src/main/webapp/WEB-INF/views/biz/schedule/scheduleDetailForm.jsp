<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resource/js/cmm/com.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세 보기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .post-details {
            margin-bottom: 20px;
        }

        .post-details div {
            margin-bottom: 10px;
        }

        .post-details label {
            font-weight: bold;
        }

        .post-details input[type="text"],
        .post-details textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .post-details button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .post-details button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div id="scbInfoDtlView" class="post-details">
            <c:forEach var="item" items="${scb_infoDtl}">
                <div>
                    <label>게시글 번호:</label>
                    <span>${item.num}</span>
                </div>
                <div>
                    <label>제목:</label>
                    <span>${item.title}</span>
                </div>
                <div>
                    <label>게시글 내용:</label>
                    <p>${item.content}</p>
                </div>
                <div>
                    <label>게시글 시작일:</label>
                    <span>${item.startDt}</span>
                </div>
                <div>
                    <label>게시글 종료일:</label>
                    <span>${item.endDt}</span>
                </div>
            </c:forEach>
            <button type="button" id="change">수정하기</button>
            <button type="button" id="delete">삭제하기</button>
            <button type="button" id="home">홈</button>
        </div>

        <div id="scbInfoDtlUpdateView" class="post-details" style="display: none;">
            <c:forEach var="item" items="${scb_infoDtl}">
                <div>
                    <input type="hidden" id="num" value="${item.num}">
                </div>
                <div>
                    <label for="title">제목:</label>
                    <input type="text" id="title" value="${item.title}">
                </div>
                <div>
                    <label for="content">내용:</label>
                    <textarea id="content" rows="4" cols="50">${item.content}</textarea>
                </div>
                <div>
                    <label for="startDt">시작일:</label>
                    <input type="text" id="startDt" value="${item.startDt}">
                </div>
                <div>
                    <label for="endDt">종료일:</label>
                    <input type="text" id="endDt" value="${item.endDt}">
                </div>
            </c:forEach>
            <button type="button" id="update">수정 완료</button>
            <button type="button" id="cancel">취소</button>
        </div>
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

        $("#update").on("click", function(){
            num         = $("#num").val();
            title       = $("#title").val();
            content     = $("#content").val();
            startDt     = $("#startDt").val();
            endDt       = $("#endDt").val();
            var date = new Date();
            var now = date.getFullYear() + "-" + ("00"+(date.getMonth()+1).toString()).slice(-2) + "-" + ("00"+(date.getDate()).toString()).slice(-2);        
            
            var json = {};
            json.num        = num;
            json.title      = title;
            json.content    = content;
            json.startDt    = startDt;
            json.endDt      = endDt;
            json.registDt   = now;
            
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
                $("#scbInfoDtlUpdateView").hide();
                $("#scbInfoDtlView").show();
            });
        });
        
        $("#delete").on("click", function(){
            
            if (confirm("정말로 삭제하시겠습니까?")) {
                num         = $("#num").val();
                
                var json = {};
                json.num        = num;
                
                console.log("num : "+num);
                ajaxAction(json, "text", "/schedule/scheduleDelete.act", function(result) {
                    alert(result);
                    document.location.href = "/";
                });
            }
        });

        $("#cancel").on("click", function(){
            $("#scbInfoDtlUpdateView").hide();
            $("#scbInfoDtlView").show();
        });
    });
</script>

</html>

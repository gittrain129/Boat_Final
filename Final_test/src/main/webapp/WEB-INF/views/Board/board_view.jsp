<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>mvc 게시판 - view</title>
<jsp:include page="../Main/header.jsp" />


<script>
	let result = "${result}";
	if(result == 'passFail'){
		alert('비밀번호가 일치하지 않습니다.');
	}
	$(function(){
		$("form[action=delete]").submit(function(){
			if($("#board_pass").val() == ''){
				alert('비밀번호가 일치하지 않습니다.');
				$("#board_pass").focus();
				return false;
			}
			
		})
		
	})
</script>




<style>
body > div > table > tbody >tr:nth-child(1) {
	text-align: center
}

td:nth-child(1) {
	width: 20%
}

a {
	color: white
}

body > div > table > tbody tr:last-child {
	text-align: center;
}

.btn-primary {
	background-color: #4f97e5
}

#myModal {
	display: none
}

#comment > table > tbody > tr > td:nth-child(2){
 width:60%
}
#count{
    position: relative;
    top: -10px;
    left: -10px;
    background: orange;
    color: white;
    border-radius: 30%;
}

textarea{resize:none}

form[action=down] > input[type=submit]{
    position: relative;
    top: -20px;
    left: 10px;
    border: none;
    cursor : pointer;
}

</style>
</head>
<body>

	<input type="hidden" id="loginid" value="${id}" name="loginid">
	<!--view.js에서 사용하기 위해 추가 -->
	<div class="container">
		<table class="table">
			<tr>
				<th colspan="2">MVC 게시판- VIEW페이지</th>
			</tr>
			<tr>
				<td><div>글쓴이</div></td>
				<td><div>${boarddata.BOARD_NAME}</div></td>
			</tr>
			<tr>
				<td><div>제목</div></td>
				<td><c:out value="${boarddata.BOARD_SUBJECT}" /></td>
			</tr>
			<tr>
				<td><div>내용</div></td>
				<td style="padding-right: 0px">
				<textarea class="form-control" rows="5" readOnly>${boarddata.BOARD_CONTENT }</textarea></td>

			</tr>

			<tr>
				<td colspan="2" class="center">
					<button class="btn btn-primary">댓글</button>
					<span id="count">${count }</span>
					
				<sec:authorize access="isAuthenticated()">
    			<sec:authentication property="principal" var="pinfo"/>
					
					<c:if test="${boarddata.BOARD_NAME == pinfo.username || pinfo.username =='admin' }">
						<a href="modifyView?num=${boarddata.BOARD_NUM}">
							<button class="btn btn-warning">수정</button>
						</a>
						<%-- href 주소를 #으로 설정합니다 --%>
						<a href="#">
							<button class="btn btn-danger" data-toggle="modal" data-target="#myModal">삭제</button>
						</a>
						
				</c:if>
				</sec:authorize>

				<a href="replyView?num=${boarddata.BOARD_NUM }">
					<button class="btn btn-info">답변</button>
				</a>
				<a href="list">
					<button class="btn btn-success">목록</button>
				</a> 
		</table>


	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form name = "deleteForm" action = "delete" method="post">
					
						<%-- http://localhost:8088/Board/BoardDetailAction.bo?num=22
								주소를 보면 num을 파라미터로 넘기고있습니다.
								이 값을 가져와서 ${param.num} 를 사용 또는 ${boarddata.board_num}
						 --%>
						 
						 <input type="hidden" name="num" value="${param.num }" id="board_num">
						 	<div class="form-group">
						 		<label for="pwd">비밀번호</label>
						 		<input type="password" class="form-control" placeholder="Enter Password" name="BOARD_PASS" id="board_pass">
						 		
						 	</div>
						 	<button type="submit" class="btn btn-primary">전송</button>
						 	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
				
				</div>
			
			</div>
		</div>
		

	</div>
		<div id="comment">
			<button class="btn btn-info float-left">총 50자까지 가능합니다.</button>
			
			<button id="write" class="btn btn-info float-right">등록</button>
			<textarea rows=3 class="form-control" id="content" maxLength="50"></textarea>
			<table class="table table-striped">
				<thead>
					<tr><td>아이디</td><td>내용</td><td>날짜</td></tr>
				</thead>
				<tbody>
				</tbody>
			</table>
				<div id="message"></div>
		</div>
	</div>
	
	<script src = "${pageContext.request.contextPath}/jkKim/js/view.js"></script>
</body>
</html>
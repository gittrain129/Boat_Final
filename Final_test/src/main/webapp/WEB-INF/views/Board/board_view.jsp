<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>업무 게시판 - view</title>
<jsp:include page="../Main/header.jsp" />


<script>
	let result = "${result}";
	if(result == 'passFail'){
		   toastr.options.escapeHtml = true;
	       toastr.options.closeButton = true;
	       toastr.options.newestOnTop = false;
	       toastr.options.progressBar = true;
	       toastr.info('비밀번호가 일치하지 않습니다.', {timeOut: 3000});
	}
	$(function(){
		$("form[action=delete]").submit(function(){
			if($("#board_pass").val() == ''){
				 toastr.options.escapeHtml = true;
			       toastr.options.closeButton = true;
			       toastr.options.newestOnTop = false;
			       toastr.options.progressBar = true;
			       toastr.info('비밀번호가 일치하지 않습니다.', {timeOut: 3000});
				$("#board_pass").focus();
				return false;
			}
			
		})
		
	})
	
	function showModal() {
    $('#myModal').modal('show');
}

</script>




<style>

#viewform{
	padding : 20px;
	background-color: white;
	border : 2px solid gray;
	margin: 100px auto 50px auto;
	max-width :1000px;
}

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
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="pinfo"/>

	<input type="hidden" id="loginid" value="${EMPNO}" name="loginid">
	<!--view.js에서 사용하기 위해 추가 -->
	
	<div class="container" id="viewform">
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
					
				
					
					<c:if test="${boarddata.BOARD_EMPNO == pinfo.username || pinfo.username =='admin' }">
						<a href="modifyView?num=${boarddata.BOARD_NUM}">
							<button class="btn btn-warning">수정</button>
						</a>
						<%-- href 주소를 #으로 설정합니다 --%>
						<a href="#" >
						<button class="btn btn-danger" onclick="showModal()" data-toggle="modal" data-target="#myModal">삭제</button>
						</a>
						
				</c:if>
				

				<a href="replyView?num=${boarddata.BOARD_NUM }">
					<button class="btn btn-info">답변</button>
				</a>
				<a href="List">
					<button class="btn btn-success">목록</button>
				</a> 
		</table>


	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form name = "deleteForm" action = "delete" method="post">
					 
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
	
	</sec:authorize>
	 <jsp:include page="../Main/footer.jsp" />
</body>
</html>
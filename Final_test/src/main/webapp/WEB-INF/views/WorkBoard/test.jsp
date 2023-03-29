<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table class="table table-striped">
		<tr>
			<th colspan="2">MVC 게시판 - view페이지</th>
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
				<textarea class="form-control"
						  rows="5" readOnly>${boarddata.BOARD_CONTENT}</textarea>
		</td>
		
		<c:if test="${boarddata.BOARD_RE_LEV==0}">
			<%-- 원문글인 경우에만 첨부파일을 추가 할 수 있습니다. --%>
			<tr>
				<td><div>첨부파일</div></td>
				
				<%-- 파일첨부한 경우 --%>
				<c:if test="${!empty boarddata.BOARD_FILE}">
					<td><img src="../resources/image/down.png" width="10px">
						<form method="post" action="down" style="height:0px">
							<input type="hidden" value="${boarddata.BOARD_FILE}" name="filename">
							<input type="hidden" value="${boarddata.BOARD_ORIGINAL}" name="original">
							<input type="submit" value="${boarddata.BOARD_ORIGINAL}" >								
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</td>
				</c:if>
				
				
				<%-- 파일첨부하지 않은 경우 --%>
				<c:if test="${empty boarddata.BOARD_FILE}">
							<td></td>
				</c:if>
			</tr>
		</c:if>
		
		<tr>
			<td colspan="2" class="center">
				<button class="btn btn-primary">댓글</button>
					<span id="count">${count}</span>
					
				<sec:authentication property="principal" var="pinfo"/>
				<sec:authorize access="isAuthenticated()">
					<c:if test="${boarddata.BOARD_NAME == pinfo.username || pinfo.username == 'admin' }">
						<a href="modifyView?num=${boarddata.BOARD_NUM}">
							<button class="btn btn-warning">수정</button>
						</a>
						<%-- href의 주소를 #으로 설정합니다. --%>
						<a href="#">
							<button class="btn btn-danger" data-toggle="modal"
								data-target="#myModal">삭제</button>
						</a>
					</c:if>
				</sec:authorize>
				
				<a href="replyView?num=${boarddata.BOARD_NUM}">
					<button class="btn btn-info">답변</button>
				</a>
				
				<a href="list">
					<button class="btn btn-success">목록</button>
				</a>
				
			</td>
		</tr>	
	</table>
		
	
	
	
	
		
		
	<form action="add" method="post" enctype="multipart/form-data" name="boardform">
	  <h1>MVC 게시판-write 페이지</h1>
	  <div class="form-group">
	    <label for="board_name">글쓴이</label>
	    <input name="BOARD_NAME" id="board_name" value="${memberinfo.id}" readOnly
	    	   type="text" class="form-control"
	    	   placeholder="Enter board_name">
	  </div>
	  <div class="form-group">
	    <label for="board_pass">비밀번호</label>
	    <input name="BOARD_PASS" id="board_pass" type="password" maxlength="30"
	    	   class="form-control" placeholder="Enter board_pass">
	  </div>
	  <div class="form-group">
	    <label for="board_subject">제목</label>
	    <input name="BOARD_SUBJECT" id="board_subject" type="text" maxlength="100"
	    	   class="form-control" placeholder="Enter board_subject">
	  </div>
	  <div class="form-group">
	    <label for="board_content">내용</label>
	    <textarea name="BOARD_CONTENT" id="board_content" 
	    		  cols="67" rows="10" class="form-control"></textarea>
	  </div>
	  <div class="form-group">
	  	<label for="board_file">파일 첨부</label>
	  	<label for="upfile">
	  		<img src="../resources/image/attach.png" alt="파일첨부">
	  	</label>
	  	<input type="file" id="upfile" name="uploadfile">
	  	<span id="filevalue"></span>
	  </div>
	  <div class="form-group">
	  	<button type=submit class="btn btn-primary">등록</button>
	  	<button type=reset class="btn btn-danger">취소</button>
	  </div>
	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	 </form>
</body>
</html>
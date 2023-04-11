<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="b" items="${chatHistory}">
	<li class="left clearfix">
		<span class="chat-img pull-left">
		</span>
		<div class="chat-body clearfix">
			<div class="header">
				<strong class="primary-font" style="font-size: 0.9rem;">나</strong>
				<small class="pull-right text-muted" style="font-size: 0.8rem;"><i class="fa fa-clock-o" ></i>${b.CHAT_TIME}</small>
			</div>
			<p class="fs-6">${b.CONTENT}</p>
		</div>
	</li>
</c:forEach>
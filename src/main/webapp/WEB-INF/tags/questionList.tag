<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@attribute name="title" type="java.lang.String" required="true"%>
<%@attribute name="recentTags" type="java.util.List" required="true"%>
<%@attribute name="questions" type="java.util.List" required="true"%>

<section class="first-content">
	<div class="subheader">
		<h2 class="title page-title">${title}</h2>
	</div>
	<c:if test="${not empty questions}">
		<ol class="question-list">
			<c:forEach var="question" items="${questions }">
				<tags:questionListItem question="${question}"/>
			</c:forEach>
		</ol>
	</c:if>
	<c:if test="${empty questions}">
		<h2 class="title section-title"><fmt:message key="questions.empty_list" /></h2>
	</c:if>
	<ul class="pager">
		<c:forEach begin="1" end="${totalPages}" var="p">
			<li class="page-item ${p == currentPage ? 'current' : ''}">
				<a href="${httpServletRequest.requestURI}?p=${p}">${p}</a>
			</li>
		</c:forEach>
	</ul>
</section>
<aside class="sidebar">
	<div class="subheader">
		<h3 class="title page-title"><fmt:message key="tags.main"/></h3>
	</div>
	<%@include file="../jsp/mainTags.jsp" %>
	<div class="subheader">
		<h3 class="title page-title"><fmt:message key="tags.recent"/></h3>
	</div>
	<tags:recentTagsUsage tagsUsage="${recentTags}"/>
</aside>
<ol id="intro">
	<!--   <li data-id="newHeader">Tip content...</li> -->
	<li data-class="votes" data-options="tipLocation:top" class="brutal-intro">Esse é o contador de votos. Perguntas com -5 não aparecem mais na página inicial</li>
	<li data-class="answers" data-options="tipLocation:top" class="brutal-intro">Content...</li>
	<li data-class="views" data-options="tipLocation:top" class="brutal-intro">Content...</li>
</ol>
<%@include file="/libs/cms/global.jsp"%>

<c:forEach var="sibling" items="${sling:listChildren(resource.parent)}">
	<c:if test="${resource == sibling}">
		<c:set var="before" value="${prev}" />
	</c:if>
	<c:set var="prev" value="${resource}" />
</c:forEach>
<input type="hidden" name=":order" value="before ${before.name}" />
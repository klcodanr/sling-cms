<%@include file="/libs/cms/global.jsp"%>
<c:set var="rsrc" value="${sling:getResource(resourceResolver,slingRequest.requestPathInfo.suffix)}" />
<c:forEach var="sibling" items="${sling:listChildren(rsrc.parent)}">
	<c:if test="${rsrc.path == sibling.path}">
		<c:set var="before" value="${prev}" />
	</c:if>
	<c:set var="prev" value="${sibling}" />
</c:forEach>
<input type="hidden" name=":order" value="before ${before.name}" />
<%@include file="/libs/cms/global.jsp"%>
<option>Select Page Type</option>
<c:forEach var="type" items="${sling:listChildren(sling:getRelativeResource(site.config,'content/pagetypes'))}">
	<option value="${type.valueMap.resourceType}"><sling:encode value="${type.valueMap.label}" mode="HTML" /></option>
</c:forEach>
<%@include file="/libs/cms/global.jsp"%>
<option>Select Resource Type</option>
<c:forEach var="type" items="${fn:split(param.availabletypes,',')}">
	<option value="${type}"><sling:encode value="${type}" mode="HTML" /></option>
</c:forEach>
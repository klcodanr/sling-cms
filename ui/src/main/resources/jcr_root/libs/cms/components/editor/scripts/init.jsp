<%@include file="/libs/cms/global.jsp"%>
<link rel="stylesheet" href="/admin/clientlibs/edit/edit.css" />
<c:if test="${not empty properties.availableTypes}">
	<c:set var="availableTypes" value="${properties.availableTypes}" scope="request" />
</c:if>
<%@include file="/libs/cms/global.jsp"%>
<sling:getResource var="pagetypes" path="${site.config.path}/pagetypes" />
<c:forEach var="pageType" items="${sling:listChildren(pagetypes}">
	
</c:forEach>
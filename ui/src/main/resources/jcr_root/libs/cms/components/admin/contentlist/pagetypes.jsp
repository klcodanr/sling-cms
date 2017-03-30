<%@include file="/libs/cms/global.jsp"%>
<sling:getResource var="pagetypes" path="${site.config.path}/jcr:content/pageTypes" />
<c:forEach var="pageType" items="${sling:listChildren(pagetypes}">
	
</c:forEach>
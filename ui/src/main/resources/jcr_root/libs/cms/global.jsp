<%@page session="false" %><%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling" %><%
%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%
%><%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%
%><%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%
%><sling:defineObjects /><sling:adaptTo var="properties" adaptable="${resource}" adaptTo="org.apache.sling.api.resource.ValueMap" />
<sling:adaptTo var="ra" adaptable="${slingRequest}" adaptTo="org.apache.sling.cms.core.models.RedirectAttribute" />
<c:if test="${slingRequest.requestPathInfo.suffix != null}">
	<sling:getResource path="${slingRequest.requestPathInfo.suffix}" var="siteResource" />
	<sling:adaptTo var="siteMgr" adaptable="${siteResource}" adaptTo="org.apache.sling.cms.core.models.SiteManager" />
	<c:set var="site" value="${siteMgr.site}" />
</c:if>
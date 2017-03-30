<%@include file="/libs/cms/global.jsp"%>
<c:set var="cmsEditEnabled" value="true" scope="request" />
<sling:include resource="${sling:getResource(resourceResolver,slingRequest.requestPathInfo.suffix)}"  />
<c:set var="cmsEditEnabled" value="false" scope="request" />
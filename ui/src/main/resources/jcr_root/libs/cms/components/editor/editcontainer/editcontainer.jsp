<%@include file="/libs/cms/global.jsp"%>
<sling:call script="/libs/cms/components/editor/scripts/init.jsp" />
<c:set var="cmsEditEnabled" value="true" scope="request" />
<sling:include path="${slingRequest.requestPathInfo.suffix}${properties.includePath}" resourceType="${properties.includeResourceType}" />
<c:set var="cmsEditEnabled" value="false" scope="request" />
<sling:call script="/libs/cms/components/editor/scripts/finalize.jsp" />
<%@include file="/libs/cms/global.jsp"%>
<sling:call script="/libs/cms/components/editor/scripts/init.jsp" />
<c:set var="cmsEditEnabled" value="true" scope="request" />
<c:set var="availableTypes" value="cms/components/editor/pagetype" scope="request" />
<sling:include path="${slingRequest.requestPathInfo.suffix}/pagetypes" resourceType="fdn/components/container" />
<c:set var="cmsEditEnabled" value="false" scope="request" />
<sling:call script="/libs/cms/components/editor/scripts/finalize.jsp" />
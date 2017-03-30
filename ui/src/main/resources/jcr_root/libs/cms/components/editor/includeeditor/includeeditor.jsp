<%@include file="/libs/cms/global.jsp"%>
<sling:adaptTo var="editor" adaptable="${sling:getResource(resourceResolver,slingRequest.requestPathInfo.suffix)}" adaptTo="org.apache.sling.cms.core.models.EditableResource" />
<sling:include resource="${editor.editResource}" />
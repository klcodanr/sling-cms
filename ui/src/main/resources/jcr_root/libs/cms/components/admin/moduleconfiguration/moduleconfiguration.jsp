<%@include file="/libs/cms/global.jsp"%>
<sling:getResource var="configRsrc" path="${slingRequest.requestPathInfo.suffix}" />
<sling:getResource var="moduleRsrc" path="/etc/modules/${configRsrc.name}" />
<sling:adaptTo var="module" adaptable="${moduleRsrc}" adaptTo="org.apache.sling.cms.core.models.Module" /> 
<h2>Configure Modules</h2>
<sling:include path="${configRsrc.path}" resourceType="${module.configurationResourceType}" />
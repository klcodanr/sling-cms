<%@include file="/libs/cms/global.jsp"%>
<input type="hidden" name="${properties.name}" value="${sling:getRelativeResource(site.config,'blog').valueMap.resourceType}" />
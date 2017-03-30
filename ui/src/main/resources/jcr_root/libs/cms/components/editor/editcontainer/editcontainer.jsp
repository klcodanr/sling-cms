<%@include file="/libs/cms/global.jsp"%>
<link rel="stylesheet" href="/admin/clientlibs/edit/edit.css" />
<c:if test="${not empty properties.availableTypes}">
	<c:set var="availableTypes" value="${properties.availableTypes}" scope="request" />
</c:if>
<c:set var="cmsEditEnabled" value="true" scope="request" />
<sling:include path="${slingRequest.requestPathInfo.suffix}${properties.includePath}" resourceType="${properties.includeResourceType}" />
<c:set var="cmsEditEnabled" value="false" scope="request" />
<script src="/admin/clientlibs/edit/edit.js"></script>
<div class="cms--modal-box">
	<button class="cms--modal-close cms--edit-button">x</button>
	<br/>
	<iframe class="cms--modal-frame" src=""></iframe>
</div>
<div class="cms--modal-background"></div>
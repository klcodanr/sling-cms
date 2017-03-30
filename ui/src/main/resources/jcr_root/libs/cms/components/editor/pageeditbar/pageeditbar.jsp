<%@include file="/libs/cms/global.jsp"%>
<link rel="stylesheet" href="/admin/clientlibs/edit/edit.css" />
<c:set var="cmsEditEnabled" value="true" scope="request" />
<div class="cms--edit-bar">
	<a href="/admin">Sling CMS</a>
	<button class="cms--edit-button" data-cms-action="editpage" data-cms-path="${slingRequest.requestPathInfo.suffix}">
		Page Properties
	</button>
	<button class="cms--edit-button" data-cms-action="delete" data-cms-path="${slingRequest.requestPathInfo.suffix}">
		Delete
	</button>
</div>
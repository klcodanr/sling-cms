<%@include file="/libs/cms/global.jsp"%>
<link rel="stylesheet" href="/admin/clientlibs/edit/edit.css" />
<c:set var="cmsEditEnabled" value="true" scope="request" />
<div class="cms--edit-bar">
	<a href="/admin">Sling CMS</a>
	<button class="cms--edit-button" data-cms-action="editpage" data-cms-path="${slingRequest.requestPathInfo.suffix}/jcr:content">
		Page Properties
	</button>
</div>
<sling:call script="/libs/cms/components/editor/scripts/finalize.jsp" />
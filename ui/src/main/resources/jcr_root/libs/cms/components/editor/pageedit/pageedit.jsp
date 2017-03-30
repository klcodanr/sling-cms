<%@include file="/libs/cms/global.jsp"%>
<sling:include path="${slingRequest.requestPathInfo.suffix}" />
<c:set var="cmsEditEnabled" value="false" scope="request" />
<script src="/admin/clientlibs/edit/edit.js"></script>
<div class="cms--modal-box">
	<button class="cms--modal-close cms--edit-button">x</button>
	<br/>
	<iframe class="cms--modal-frame" src=""></iframe>
</div>
<div class="cms--modal-background"></div>
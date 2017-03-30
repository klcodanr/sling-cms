<%@include file="/libs/cms/global.jsp"%>
<div class="row">
	<div class="col-md-12">
		<div class="form-group">
			<sling:encode value="${properties.label}" mode="HTML" /><br/>
			<sling:encode value="${slingRequest.requestPathInfo.suffix}" mode="HTML" />
		</div>
	</div>
</div>
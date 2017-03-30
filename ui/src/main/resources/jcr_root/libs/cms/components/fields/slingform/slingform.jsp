<%@include file="/libs/cms/global.jsp"%>
<form method="post" action="${slingRequest.requestPathInfo.suffix}${properties.actionSuffix}" enctype="multipart/form-data" class="slingform">
	<sling:include path="fields" resourceType="fdn/components/container" />
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<button type="submit" class="btn btn-success" title="<sling:encode value="${properties.button}" mode="HTML_ATTR" />">
					<sling:encode value="${properties.button}" mode="HTML" />
				</button>
			</div>
		</div>
	</div>
</form>
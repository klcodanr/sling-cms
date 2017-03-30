<%@include file="/libs/cms/global.jsp"%>
<input type="text" class="form-control" name="${properties.name}" value="${editProperties[properties.name]}"  ${required} ${disabled} />
<span class="input-group-btn">
	<a class="btn btn-default" data-base-path="${properties.basePath}">
		<i class="fa fa-search"></i>
	</a>
</span>
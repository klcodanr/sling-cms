<%@include file="/libs/cms/global.jsp"%>
<c:choose>
	<c:when test="${properties.accepts}">
		<c:set var="accepts" value="${properties.accepts}" />
	</c:when>
	<c:otherwise>
		<c:set var="accepts" value="${sling:getRelativeResource(site.config,'assets').valueMap.fileTypes}" />
	</c:otherwise>
</c:choose>
<input type="file" class="form-control" name="*" ${required} accepts="${accepts}" />
<input type="hidden" name="*@TypeHint" value="nt:file" />
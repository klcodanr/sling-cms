<%@include file="/libs/cms/global.jsp"%>
<select multiple="multiple" class="form-control" data-role="tagsinput" name="${properties.name}" ${required} ${disabled}>
	<c:forEach var="tag" items="${editProperties[properties.name]}">
		<option value="${sling:encode(tag,'HTML_ATTR')}"><sling:encode value="${tag}" mode="HTML" /></option>
	</c:forEach>
</select>
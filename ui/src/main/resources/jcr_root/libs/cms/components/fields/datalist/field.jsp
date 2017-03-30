<%@include file="/libs/cms/global.jsp"%>
<input type="text" class="form-control" name="${properties.name}" value="${editProperties[properties.name]}" ${required} ${disabled} list="${resource.name}" />
<datalist id="${resource.name}">
	<c:forEach var="item" items="${sling:findResources(resourceResolver,properties.query,properties.queryLanguage)}">
		<c:if test="${item.valueMap[properties.valueProperty] != null and item.valueMap[properties.labelProperty] != null}">
			<option value="${sling:encode(item.valueMap[properties.valueProperty],'HTML_ATTR')}"><sling:encode value="${item.valueMap[properties.labelProperty]}" mode="HTML" /></option>
		</c:if>
	</c:forEach>
</datalist>
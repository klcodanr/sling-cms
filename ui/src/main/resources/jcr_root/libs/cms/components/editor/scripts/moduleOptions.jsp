<%@include file="/libs/cms/global.jsp"%>

<c:forEach var="module" items="${sling:listChildren(sling:getResource(resourceResolver,'/etc/modules'))}">
	<c:set var="selected" value="" />
	<c:forEach var="emod" items="${editProperties[properties.name]}">
		<c:if test="${emod == module.path}">
			<c:set var="selected" value="selected=\"selected\"" />
		</c:if>
	</c:forEach>
	<option value="${module.path}" ${selected}><sling:encode value="${module.valueMap.title}" mode="HTML" /></option>
</c:forEach>
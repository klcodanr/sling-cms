<%@include file="/libs/cms/global.jsp"%>
<c:if test="${properties.multiple == true}">
	<c:set var="multiple" value="multiple = \"multiple\"" />
</c:if>
<select class="form-control" name="${properties.name}" ${required} ${disabled} ${multiple}>
	<c:set var="optionsPath" value="${resource.path}/options" />
	<c:choose>
		<c:when test="${sling:getResource(resourceResolver,optionsPath) != null}">
			<c:forEach var="option" items="${sling:listChildren(sling:getResource(resourceResolver,optionsPath))}">
				<c:choose>
					<c:when test="${option.valueMap.value eq editProperties[properties.name]}">
						<c:set var="selected" value="selected=\"selected\"" />
					</c:when>
					<c:otherwise>
						<c:set var="selected" value="" />
					</c:otherwise>
				</c:choose>
				<option ${selected} value="${sling:encode(option.valueMap.value,'HTML_ATTR')}"><sling:encode value="${option.valueMap.label}" mode="HTML" /></option>
			</c:forEach>
		</c:when>
		<c:when test="${not empty properties.optionsScript}">
			<sling:call script="${properties.optionsScript}" />
		</c:when>
	</c:choose>
</select>
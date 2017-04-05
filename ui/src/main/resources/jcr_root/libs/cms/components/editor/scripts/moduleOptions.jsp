<%@include file="/libs/cms/global.jsp"%>
<c:forEach var="modr" items="${sling:listChildren(sling:getResource(resourceResolver,'/etc/modules'))}">
	<c:set var="checked" value="" />
	<c:forEach var="emod" items="${editProperties[properties.name]}">
		<c:if test="${emod == modr.path}">
			<c:set var="checked" value="checked=\"checked\"" />
		</c:if>
	</c:forEach>
	<sling:adaptTo var="module" adaptable="${modr}" adaptTo="org.apache.sling.cms.core.models.Module" />
	<label>
		<input type="checkbox" name="${properties.name}" value="${modr.path}" ${checked} ${disabled} ${required} />
		<strong><sling:encode value="${module.title}" mode="HTML" /></strong><br/>
		<small class="modue-version"><em>${module.version}</em></small><br/>
		<small class="modue-description">
			<sling:encode value="${module.description}" mode="HTML" />
		</small>
	</label>
</c:forEach>
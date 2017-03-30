<%@include file="/libs/fdn/global.jsp"%>
<c:forEach var="child" items="${sling:listChildren(resource)}">
	<sling:include resource="${child}" />
</c:forEach>
<c:if test="${cmsEditEnabled == 'true'}">
	<c:if test="${availableTypes}">
		<c:set var="availableTypes" value="${site.availableTypes}" />
	</c:if>
	<div class="cms--edit-bar">
		<button class="cms--edit-button" data-cms-action="add" data-cms-path="${resource.path}" data-cms-available-types="${availableTypes}">
			Add
		</button>
	</div>
</c:if>
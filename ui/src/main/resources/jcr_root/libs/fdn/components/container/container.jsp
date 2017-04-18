<%@include file="/libs/fdn/global.jsp"%>
<c:forEach var="child" items="${sling:listChildren(resource)}">
	<sling:include resource="${child}" />
</c:forEach>
<c:if test="${cmsEditEnabled == 'true'}">
	<c:if test="${empty availableTypes}">
		<sling:adaptTo var="pageMgr" adaptable="${resource}" adaptTo="org.apache.sling.cms.core.models.PageManager" />
		<c:set var="availableTypes" value="${pageMgr.page.availableComponents}" />
	</c:if>
	<div class="cms--edit-bar">
		<button class="cms--edit-button" data-cms-action="add" data-cms-path="${resource.path}" data-cms-available-types="${availableTypes}">
			Add
		</button>
		<button class="cms--edit-button" data-cms-action="delete" data-cms-path="${resource.path}">
			Delete
		</button>
	</div>
</c:if>
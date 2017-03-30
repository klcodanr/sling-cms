<%@include file="/libs/cms/global.jsp"%>
<c:choose>
	<c:when test="${properties.collapse}">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<a href="#panel-${resource.name}" data-toggle="collapse">
						<sling:encode value="${properties.title}" mode="HTML" />
					</a>
				</h3>
			</div>
			<div class="panel-body collapse" id="panel-${resource.name}">
				<sling:include path="." resourceType="fdn/components/container" />
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<sling:encode value="${properties.title}" mode="HTML" />
				</h3>
			</div>
			<div class="panel-body">
				<sling:include path="." resourceType="fdn/components/container" />
			</div>
		</div>
	</c:otherwise>
</c:choose>
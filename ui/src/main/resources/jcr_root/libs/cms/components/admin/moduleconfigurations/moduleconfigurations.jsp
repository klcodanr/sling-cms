<%@include file="/libs/cms/global.jsp"%>
<h3>Enabled Modules</h3>

<c:forEach var="module" items="${site.enabledModules}">
	<h4>
		<sling:encode value="${module.title}" mode="html" />
	</h4>
	<c:choose>
		<c:when test="${sling:getRelativeResource(site.config,module.moduleName) != null}">
			<a class="btn btn-default" href="/admin/site/config-module.html/etc/config/${site.id}/${module.moduleName}">
				Configure
			</a>
		</c:when>
		<c:otherwise>
			<form action="/etc/config/${site.id}/*" method="post" class="slingform" enctype="multipart/form-data">
				<input type="hidden" name="jcr:primaryType" value="nt:unstructured" />
				<input type="hidden" name=":name" value="${module.moduleName}" />
				<input type="hidden" name="sling:resourceType" value="${module.configurationResourceType}" />
				<button type="submit" class="btn btn-warning">
					Initialize
				</button>
			</form>
		</c:otherwise> 
	</c:choose>
</c:forEach>
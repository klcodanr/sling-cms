<%@include file="/libs/cms/global.jsp"%>
<c:if test="${slingRequest.requestPathInfo.suffix != null}">
	<sling:getResource path="/content${slingRequest.requestPathInfo.suffix}" var="siteResource" />
	<sling:adaptTo var="site" adaptable="${siteResource}" adaptTo="org.apache.sling.cms.core.models.Site" />
</c:if>
<form action="/admin/bin/siteedit" method="post" enctype="multipart/form-data">
	<div class="row">
		<div class="col-lg-6 col-md-6">
			<div class="form-group">
				<label for="name">Site Name <span class="text-danger">*</span></label>
				<input type="text" name="name" class="form-control" required="required" value="${site.name}" />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-6">
			<div class="form-group">
				<label for="id">Site ID</label>
				<c:choose>
					<c:when test="${site == null}">
						<input type="text" name="id" class="form-control" />
					</c:when>
					<c:otherwise>
						<input type="text" name="id" class="form-control" value="${site.id}" readonly="readonly" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-6">
			<div class="form-group">
				<label for="description">Description</label>
				<textarea class="form-control" name="description">${site.description}</textarea>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="form-group">
				<input type="submit" value="Save" class="btn btn-success" />
				&nbsp;
				<a href="/admin/sites.html" class="btn btn-default">
					Cancel
				</a>
			</div>
		</div>
	</div>
</form>
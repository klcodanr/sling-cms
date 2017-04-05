<%@include file="/libs/cms/global.jsp"%>
<sling:adaptTo var="sites" adaptable="${sling:getResource(resourceResolver,'/content')}" adaptTo="org.apache.sling.cms.core.models.SiteList" />
<div class="site-controller">
	<div class="row">
		<div class="col-xs-12">
			<a class="btn btn-primary" href="/admin/site/create.html" role="button"><span class="fa fa-plus"></span> Add Site</a>
		</div>
	</div>
	<br/>
	<div class="row">
		<c:forEach var="site" items="${sites.sites}" varStatus="status">
			<div class="col-sm-12 col-md-3">
				<div class="well">
					<div class="text-center">
						<i class="fa fa-sitemap fa-3x"></i>
						<h4>
							<a href="/admin/site/home.html${site.path}">
								<sling:encode value="${site.name}" mode="HTML" />
							</a>
						</h4>
						<small>
							<sling:encode value="${site.description}" mode="HTML" />
						</small>
					</div>
					
					<a class="btn btn-default btn-sm" title="Edit Site" href="/admin/site/home.html${site.path}">
						<i class="fa fa-pencil"><span class="sr-only">Edit</span></i>
					</a>
					<a class="btn btn-default btn-sm" title="Configure Site" href="/admin/site/edit.html/${site.id}">
						<i class="fa fa-gear"><span class="sr-only">Configure</span></i>
					</a>
					<a class="btn btn-sm btn-danger fetch-html-modal" data-path="form" data-title="Delete Site" title="Delete Site" href="/admin/site/delete.html${site.path}">
						<i class="fa fa-trash"><span class="sr-only">Delete</span></i>
					</a>
				</div>
			</div>
			<c:if test="${status.index % 4 == 3}">
				</div><div class="row">
			</c:if>
		</c:forEach>
	</div>
</div>
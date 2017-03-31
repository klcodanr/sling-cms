<%@include file="/libs/cms/global.jsp"%>
<sling:adaptTo var="assetlist" adaptable="${sling:getResource(resourceResolver,slingRequest.requestPathInfo.suffix)}" adaptTo="org.apache.sling.cms.core.models.ContentList" />
<div>
	<ol class="breadcrumb">
		<li>
			<a href="/admin/site/home.html/content/${site.id}">${site.name}</a>
		</li>
		<li>
			<a href="/admin/site/assets.html/content/${site.id}/assets">Assets</a>
		</li>
		<c:forEach var="crumb" items="${assetlist.breadcrumb}" varStatus="status">
			<li>
				<c:choose>
					<c:when test="${status.last}">
						<span>${crumb.title}</span>
					</c:when>
					<c:otherwise>
						<a href="/admin/site/assets.html${crumb.path}">${crumb.title}</a>
					</c:otherwise>
				</c:choose>
			</li>
		</c:forEach>
		<li>
			<a class="fetch-html-modal btn btn-primary btn-sm" data-path="form" data-title="Add Folder" href="/admin/site/createfolder.html${slingRequest.requestPathInfo.suffix}?path=${slingRequest.requestPathInfo.suffix}"><i class="fa fa-plus"></i> Folder</a>
		</li>
	</ol>
	<br/><br/>
	<div class="row">
		<c:if test="${fn:length(assetlist.breadcrumb) > 0}">
			<div class="col-xs-6 col-sm-4 col-md-2">
				<a href="/admin/site/assets.html${assetlist.parent.path}" class="thumbnail asset-thumbnail">
					<i class="fa fa-folder fa-5x"></i>
					<span class="caption">
						<h6>../</h6>
					</span>
				</a>
			</div>
		</c:if>
	
		<c:forEach var="folder" items="${assetlist.folders}">
			<div class="col-xs-6 col-sm-4 col-md-2">
				<div class="thumbnail asset-thumbnail ">
					<a href="/admin/site/assets.html${folder.path}" class="asset-folder">
						<i class="fa fa-folder fa-5x"></i><br/><span class="caption">${folder.title}</span>
					</a>
					<br/>
					<a class="btn btn-xs btn-default fetch-html-modal" data-title="Rename/Move Folder" data-path="form" title="Rename/Move Folder" href="/admin/site/move.html${folder.path}">
						<i class="fa fa-arrows-alt" aria-hidden="true"><span class="sr-only">Rename/Move</span></i>
					</a>
					<a class="btn btn-xs btn-danger fetch-html-modal" data-title="Delete Folder" data-path="form" title="Delete Folder" href="/admin/site/delete.html${folder.path}">
						<i class="fa fa-trash"><span class="sr-only">Delete</span></i>
					</a>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach var="asset" items="${assetlist.assets}">
			<div class="col-xs-6 col-sm-4 col-md-2">
				<div class="thumbnail asset-thumbnail ">
					<c:choose>
						<c:when test="${fn:startsWith(asset.mimeType,'image/')}">
							<img src="${asset.path}" alt="${asset.name}">
						</c:when>
						<c:otherwise>
							<i class="fa fa-file fa-5x"></i>
						</c:otherwise>
					</c:choose>
					<span class="caption">${asset.name}</span><br/>
					<a class="btn btn-xs btn-default fetch-html-modal" data-title="Edit Asset" title="Edit Asset" data-path="form" target="_blank" href="${site.configProperties.assetEditor}.html${asset.path}/jcr:content">
						<i class="fa fa-pencil" aria-hidden="true"><span class="sr-only">Edit</span></i>
					</a>
					<a class="btn btn-xs btn-default" title="View Asset" target="_blank" href="${asset.path}">
						<i class="fa fa-external-link" aria-hidden="true"><span class="sr-only">View</span></i>
					</a>
					<a class="btn btn-xs btn-default fetch-html-modal" data-title="Rename/Move Asset" data-path="form" title="Rename/Move Asset" href="/admin/site/move.html${asset.path}">
						<i class="fa fa-arrows-alt" aria-hidden="true"><span class="sr-only">Rename/Move</span></i>
					</a>
					<a class="btn btn-xs btn-danger fetch-html-modal" data-title="Delete Asset" data-path="form" title="Delete Asset" href="/admin/site/delete.html${asset.path}">
						<i class="fa fa-trash"><span class="sr-only">Delete</span></i>
					</a>
				</div>
			</div>
		</c:forEach>

		<div class="col-xs-6 col-sm-4 col-md-2">
			<div class="thumbnail asset-thumbnail asset-folder asset-upload">
				<sling:include path="uploadform" resourceType="cms/components/fields/slingform" />
			</div>
		</div>

	</div>
</div>
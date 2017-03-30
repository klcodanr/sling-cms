<%@include file="/libs/cms/global.jsp"%>
<sling:adaptTo var="contentlist" adaptable="${sling:getResource(resourceResolver,slingRequest.requestPathInfo.suffix)}" adaptTo="org.apache.sling.cms.core.models.ContentList" />
<ol class="breadcrumb">
	<li>
		<a href="/admin/site/home.html/content/${site.id}">${site.name}</a>
	</li>
	<li>
		<a href="/admin/site/fragments.html/etc/fragments/${site.id}">Fragments</a>
	</li>
	<c:forEach var="crumb" items="${contentlist.breadcrumb}" varStatus="status">
		<li>
			<c:choose>
				<c:when test="${status.last}">
					<span>${crumb.title}</span>
				</c:when>
				<c:otherwise>
					<a href="/admin/site/fragments.html${crumb.path}">${crumb.title}</a>
				</c:otherwise>
			</c:choose>
		</li>
	</c:forEach>
</ol>
<br/>
<div class="row">
	<div class="col-lg-12">
		<a class="fetch-html-modal btn btn-primary" data-path="form" data-title="Add Page" href="/admin/site/createfragment.html${slingRequest.requestPathInfo.suffix}"><i class="fa fa-plus"></i> Fragment</a>
		<a class="fetch-html-modal btn btn-default" data-path="form" data-title="Add Folder" href="/admin/site/createfolder.html${slingRequest.requestPathInfo.suffix}"><i class="fa fa-plus"></i> Folder</a>
	</div>
</div>
<br/>
<div class="row">
    <div class="col-lg-12">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Published</th>
                    <th>Last Modified</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="content" items="${contentlist.content}">
	                <tr>
	                    <td> 
	                    	<c:choose>
	                    		<c:when test="${content.type == 'nt:file'}">
	                    			<sling:encode value="${content.title}" mode="HTML" />
	                    		</c:when>
	                    		<c:otherwise>
			                    	<a href="/admin/site/fragments.html${content.path}">
	                    				<sling:encode value="${content.title}" mode="HTML" />
			                    	</a>
	                    		</c:otherwise>
	                    	</c:choose>
	                    	<small>(<sling:encode value="${content.name}" mode="HTML" />)</small>
	                    </td>
	                    <td>
	                    	<c:choose>
	                    		<c:when test="${content.published}">
			                    	<div class="btn btn-success">
			                    		<i class="fa fa-check"></i>
			                    	</div>
	                    		</c:when>
	                    		<c:otherwise>
			                    	<div class="btn btn-danger">
			                    		<i class="fa fa-times"></i>
			                    	</div>
	                    		</c:otherwise>
	                    	</c:choose>
	                    </td>
	                    <td>
	                    	<c:if test="${not empty content.lastModifiedBy}">
	                    		<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${content.lastModified}" />
	                    		<br/>
								(<em><sling:encode value="${content.lastModifiedBy}" mode="HTML" /></em>)
							</c:if>
	                    </td>
	                    <td>
	                    	<c:if test="${content.type == 'cms:page'}">
								<a class="btn btn-xs btn-default" title="Edit Page" target="_blank" href="/admin/site/editor.html${content.path}">
									<i class="fa fa-pencil" aria-hidden="true"><span class="sr-only">Edit Page</span></i>
								</a>
							</c:if>
	                    	<c:if test="${content.type == 'nt:file'}">
								<a class="btn btn-xs btn-default" title="View Content" target="_blank" href="${content.path}">
									<i class="fa fa-external-link" aria-hidden="true"><span class="sr-only">View</span></i>
								</a>
							</c:if>
							<a class="btn btn-xs btn-default fetch-html-modal" data-title="Rename/Move Content" data-path="form" title="Rename/Move Content" href="/admin/site/move.html${content.path}">
								<i class="fa fa-arrows-alt" aria-hidden="true"><span class="sr-only">Rename/Move</span></i>
							</a>
							<a class="btn btn-xs btn-danger fetch-html-modal" data-title="Delete Content" data-path="form" title="Delete Content" href="/admin/site/delete.html${content.path}">
								<i class="fa fa-trash"><span class="sr-only">Delete</span></i>
							</a>
	                    </td>
	                </tr>
	            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
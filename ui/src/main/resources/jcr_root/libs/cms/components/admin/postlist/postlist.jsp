<%@include file="/libs/cms/global.jsp"%>
<sling:adaptTo var="postlist" adaptable="${sling:getResource(resourceResolver,slingRequest.requestPathInfo.suffix)}" adaptTo="org.apache.sling.cms.core.models.PostList" />
<ol class="breadcrumb">
	<li>
		<a href="/admin/site/home.html/content/${site.id}">${site.name}</a>
	</li>
	<li>
		<a href="/admin/site/blog.html/content/${site.id}">Blog</a>
	</li>
</ol>
<br/>
<div class="row">
	<div class="col-lg-12">
		<a class="fetch-html-modal btn btn-primary" data-path="form" data-title="Add Page" href="/admin/site/createpost.html${slingRequest.requestPathInfo.suffix}"><i class="fa fa-plus"></i> Post</a>
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
            	<c:forEach var="post" items="${postlist.posts}">
	                <tr>
	                    <td> 
	                    	<a href="/admin/site/editor.html${post.path}">
	                    		<sling:encode value="${post.title}" mode="HTML" />
			                </a>
	                    	<small>(<sling:encode value="${post.name}" mode="HTML" />)</small>
	                    </td>
	                    <td>
	                    	<c:choose>
	                    		<c:when test="${post.published}">
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
	                    	<c:if test="${not empty post.lastModifiedBy}">
	                    		<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${post.lastModified}" />
	                    		<br/>
								(<em><sling:encode value="${post.lastModifiedBy}" mode="HTML" /></em>)
							</c:if>
	                    </td>
	                    <td>
							<a class="btn btn-xs btn-default fetch-html-modal" data-title="Rename/Move Content" data-path="form" title="Rename/Move Content" href="/admin/site/move.html${post.path}">
								<i class="fa fa-arrows-alt" aria-hidden="true"><span class="sr-only">Rename/Move</span></i>
							</a>
							<a class="btn btn-xs btn-danger fetch-html-modal" data-title="Delete Content" data-path="form" title="Delete Content" href="/admin/site/delete.html${post.path}">
								<i class="fa fa-trash"><span class="sr-only">Delete</span></i>
							</a>
	                    </td>
	                </tr>
	            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
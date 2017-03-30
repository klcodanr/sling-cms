<%@include file="/libs/cms/global.jsp"%>
<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
		<ul class="nav" id="side-menu">
			<c:if test="${slingRequest.requestPathInfo.suffix == null}">
				<sling:adaptTo var="sites" adaptable="${sling:getResource(resourceResolver,'/content')}" adaptTo="org.apache.sling.cms.core.models.SiteList" />
				<li class="sidebar-link">
					<a href="/admin/home.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
				</li>
				<li>
					<a href="#"><i class="fa fa-sitemap fa-fw"></i> Sites<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<c:forEach var="site" items="${sites.sites}" varStatus="status">
							<li>
								<a href="/admin/site/home.html/${site.path}">
									<sling:encode value="${site.name}" mode="HTML" />
								</a>
							</li>
						</c:forEach>
					</ul>
				</li>
				<li class="divider"></li>
				<li>
					<a href="#"><i class="fa fa-gear fa-fw"></i> Admin<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li class="sidebar-link">
							<a href="/bin/users.html"><i class="fa fa-user fa-fw"></i> Users</a>
						</li>
						<li class="sidebar-link">
							<a href="/bin/browser.html"><i class="fa fa-wrench fa-fw"></i> Repository Editor</a>
						</li>
						<li class="sidebar-link">
							<a href="/bin/packages.html"><i class="fa fa-archive fa-fw"></i> Package Manager</a>
						</li>
					</ul>
				</li>
			</c:if>
			<c:if test="${slingRequest.requestPathInfo.suffix != null}">
				<li class="sidebar-link">
					<a href="/admin"><i class="fa fa-angle-left fa-fw"></i> Change Site</a>
				</li>
				<li class="sidebar-link">
					<ul class="nav nav-second-level">
						<li class="sidebar-link">
							<a href="/admin/site/home.html${site.path}"><i class="fa fa-sitemap fa-fw"></i> <sling:encode value="${site.name}" mode="HTML" /></a>
						</li>
						<li class="sidebar-link">
							<a href="/admin/site/content.html${site.path}"><i class="fa fa-list-alt fa-fw"></i> Content</a>
						</li>
						<li class="sidebar-link">
							<a href="/admin/site/assets.html${site.path}/assets"><i class="fa fa-image fa-fw"></i> Assets</a>
						</li>
						<li class="sidebar-link">
							<a href="/admin/site/fragments.html/etc/fragments/${site.id}"><i class="fa fa-th fa-fw"></i> Fragments</a>
						</li>
						<li class="sidebar-link">
							<a href="/admin/site/config.html${site.config.path}"><i class="fa fa-gear fa-fw"></i> Site Config</a>
						</li>
					</ul>
				</li>
			</c:if>
		</ul>
	</div>
</div>
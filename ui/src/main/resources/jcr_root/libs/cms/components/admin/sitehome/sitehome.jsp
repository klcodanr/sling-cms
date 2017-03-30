<%@include file="/libs/cms/global.jsp"%>
<c:if test="${slingRequest.requestPathInfo.suffix != null}">
	<sling:getResource path="/content${slingRequest.requestPathInfo.suffix}" var="siteResource" />
	<sling:adaptTo var="site" adaptable="${siteResource}" adaptTo="org.apache.sling.cms.core.models.Site" />
</c:if>
<h2>
	<c:out value="${site.name}" />
</h2>
<div>
	<c:out value="${site.description}" />
</div>
<br/>
<div class="row">
	<div class="col-md-3">
		<div class="well">
			<div class="text-center">
				<i class="fa fa-list-alt fa-3x"></i>
				<h4>
					<a href="/admin/site/content.html${slingRequest.requestPathInfo.suffix}">
						Content
					</a>
				</h4>
			</div>
		</div>
	</div>
	<div class="col-md-3">
		<div class="well">
			<div class="text-center">
				<i class="fa fa-image fa-3x"></i>
				<h4>
					<a href="/admin/site/assets.html${slingRequest.requestPathInfo.suffix}">
						Assets
					</a>
				</h4>
			</div>
		</div>
	</div>
	<div class="col-md-3">
		<div class="well">
			<div class="text-center">
				<i class="fa fa-th fa-3x"></i>
				<h4>
					<a href="/admin/site/clientlibs.html/etc/fragments/${site.id}">
						Fragments
					</a>
				</h4>
			</div>
		</div>
	</div>
	<div class="col-md-3">
		<div class="well">
			<div class="text-center">
				<i class="fa fa-users fa-3x"></i>
				<h4>
					<a href="/admin/site/config.html/etc/config/${site.id}">
						Site Configuration
					</a>
				</h4>
			</div>
		</div>
	</div>
</div>
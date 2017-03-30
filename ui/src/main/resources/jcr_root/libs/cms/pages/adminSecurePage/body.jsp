<%@include file="/libs/cms/global.jsp"%>
<body>
	<div id="wrapper">
		<sling:call script="navigation.jsp" />
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						<c:out value="${properties.title}" default="${properties['jcr:title']}" />
					</h1>
				</div>
			</div>
			<c:if test="${ra.messageSet}">
				<div class="alert alert-${ra.level} alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
					<c:out value="${ra.messageText}" />
				</div>
			</c:if>
			<sling:include path="jcr:content/container" />
		</div>
	</div>
	<sling:call script="scripts.jsp" />
</body>
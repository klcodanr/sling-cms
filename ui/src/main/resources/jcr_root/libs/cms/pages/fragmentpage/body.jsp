<%@include file="/libs/cms/global.jsp"%>
<body>
	<sling:call script="/libs/cms/components/editor/scripts/init.jsp"/>
	<h1>
		<sling:encode value="${properties['jcr:title']}" mode="HTML" />
	</h1>
	<div class="container edit-page">
		<sling:include path="container" resourceType="fdn/components/container" />
	</div>
	<sling:call script="/libs/cms/components/editor/scripts/finalize.jsp"/>
	<sling:call script="scripts.jsp" />
</body>